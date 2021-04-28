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
  products: Product[];
  currentCategoryId: number;
  currentCategoryName: string;
  searchData: boolean;

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
     //Get the products for the given category id
     this.productService.getProductList(this.currentCategoryId).subscribe(
       data => {
         this.products = data;
       }
     )
  }
}
