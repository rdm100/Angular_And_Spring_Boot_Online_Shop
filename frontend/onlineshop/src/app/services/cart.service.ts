import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  cartItems: CartItem[] = [];

  totalPrice: Subject<number> = new Subject<number>();
  totalQuantity: Subject<number> = new Subject<number>();

  constructor() { }

  addToCart(theCartItem: CartItem) {
    // Check if the item is already in the cart 
    let alreadyExistsInCart: boolean = false;
    let existingCartItem: CartItem = undefined;

    if (this.cartItems.length > 0) {
    // find the item in the cart based on item id 
      for (const tempCartItem of this.cartItems) {
        if (tempCartItem.id === theCartItem.id) {
          existingCartItem = tempCartItem;
          break;
        }
      }
    }

    // check if found
    alreadyExistsInCart = (existingCartItem != undefined);
    if (alreadyExistsInCart) {
      // increment the quantity 
      existingCartItem.quantity++;
    } else {
      // add to cart item to array
      this.cartItems.push(theCartItem);
    }

    // calculate cart total price and total quantity 
    this.calculateCartTotals();
  }

  calculateCartTotals() {
    let totalPriceValue: number = 0;
    let totalQuantityValue: number = 0;

    for (const tempCartItem of this.cartItems) {
      totalPriceValue += tempCartItem.unitPrice * tempCartItem.quantity;
      totalQuantityValue += tempCartItem.quantity;
    }

    // publish the new values. This will publish events to all subscribers will receive the new data
    // one event for total price and one event for total quantity
    // .next publishes/sends event
    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);

    logCartData(totalPriceValue, totalQuantityValue);
  }
}
function logCartData(totalPriceValue: number, totalQuantityValue: number) {
  console.log('contents of the cart ');

  for (const tempCartItem of this.cartItems) {
    const subtotalPrice = tempCartItem.quantity * tempCartItem.price;
    console.log(`name: ${tempCartItem.name}, quantity: ${tempCartItem.quantity},
     unitPrice: ${tempCartItem.unitPrice}, subtotalPrice: ${subtotalPrice}`);
  }

  console.log(`totalPrice: ${totalPriceValue.toFixed(2)}, totalQuantity: ${totalQuantityValue}`);
  console.log('------------------------------------------------');
}

