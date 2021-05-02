import { ThisReceiver } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Product } from 'src/app/common/product';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list-grid.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {
  products: Product[] = [];
  currentCategoryId: number = 1;
  previousCategoryId: number = 1;
  currentCategoryName: string;
  searchData: boolean = false;

  // pagination properties
  thePageNumber: number = 1;
  thePageSize: number = 5;
  theTotalElements: number = 0;


  constructor(private productService: ProductService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listProducts();
    });
  }

  listProducts() {
   this.searchData = this.route.snapshot.paramMap.has('keyword');
   if (this.searchData) {
     this.handleSearchProducts();
   } else {
     this.handleListProducts();
   }
  }

  handleSearchProducts() {
    const theKeyword: string = this.route.snapshot.paramMap.get('keyword');

    //Search for the products using keyword
    this.productService.searchProducts(theKeyword).subscribe(
      data => {
        this.products = data;
      }
    )
  }

  handleListProducts() {
     // check if id parameter available
     const hasCategoryId: boolean = this.route.snapshot.paramMap.has('id');

     if (hasCategoryId) {
       //get the ID pram string and convert the string to a number using the unary operator + 
       this.currentCategoryId = +this.route.snapshot.paramMap.get('id');
       this.currentCategoryName = this.route.snapshot.paramMap.get('name');
     } else {
       //if no category id is available default category id 1
       this.currentCategoryId = 1;
       this.currentCategoryName = 'Books';
     }

     // check if a different category than previous
     // angular will reuse a component if it is currently being viewed
    //  if there is a different category id than previously then set the page number back to 1
     if (this.previousCategoryId != this.currentCategoryId) {
       this.thePageNumber = 1
     }

     this.previousCategoryId = this.currentCategoryId;

     console.log(`currentCategoryId=${this.currentCategoryId}, thePageNumber=${this.thePageNumber}`);

     this.productService.getProductListPaginate(this.thePageNumber - 1, this.thePageSize, this.currentCategoryId)
      .subscribe(this.processResult());

    //  //Get the products for the given category id
    //  this.productService.getProductList(this.currentCategoryId).subscribe(
    //    data => {
    //      this.products = data;
    //    }
    //  );

  }

  processResult() {
    return data => {
      this.products = data._embedded.products;
      this.thePageNumber = data.page.number + 1;
      this.thePageSize = data.page.size;
      this.theTotalElements = data.page.totalElements;
    }
  }

  updatePageSize(pageSize: number) {
    this.thePageSize = pageSize;
    this.thePageNumber = 1;
    this.listProducts();
  }
}
