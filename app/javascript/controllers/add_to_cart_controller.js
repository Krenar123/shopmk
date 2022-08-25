import { Controller } from "@hotwired/stimulus"
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

// Connects to data-controller="add_to_cart"
export default class extends Controller {
  connect() {
  }
  static targets = [ "carts" ]

  fillCart(e) {
    console.log("Filling cart");

    let cartLoadPath = this.data.get('load-path');
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const cartDetails = document.getElementById("cart-details");
    
    // I have to show loading here while waiting

    Rails.ajax({
      type: "post",
      dataType: 'json',
      url: cartLoadPath,
      data: ``,
      success: function(data) {
        cartDetails.innerHTML = data.html; 
      },
      error: function(data) { alert('Error: no Product match this ID') }
    })
  }

  openCart(e){
    console.log("Opening cart");
    let cartLoadPath = this.data.get('load-path');
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const cartDetailsSection = document.getElementById("cart-details-section");

    Rails.ajax({
        type: "post",
        dataType: 'json',
        url: cartLoadPath,
        data: ``,
        success: function(data) {
          cartDetailsSection.innerHTML = data.html; 
        },
        error: function(data) { alert('Error: no Product match this ID') }
    })
  }
}
