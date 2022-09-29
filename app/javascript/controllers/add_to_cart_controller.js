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

  addReduceCart(e) {
    let cartLoadPath = this.data.get('load-path');
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const cartDetails = document.getElementById("add-reduce-section");
    const cartDetailsSecond = document.getElementById("add-reduce-second-section");
    const totalAmount = document.getElementById("total-amount");
    const totalSecondAmount = document.getElementById("total-second-amount");
    const cartNav = document.getElementById("cart-nav");
    // I have to show loading here while waiting

    Rails.ajax({
      type: "post",
      dataType: 'json',
      url: cartLoadPath,
      data: ``,
      success: function(data) {
        cartDetails.innerHTML = data.html;
        cartDetailsSecond.innerHTML = data.html
        if(data.amount == ""){
          cartNav.style.display = "none";
        }else{
          totalAmount.innerHTML = data.amount;
          totalSecondAmount.innerHTML = data.amount;
        }
      },
      error: function(data) { alert('Error: no Product match this ID') }
    })
  }

  openCart(e){
    console.log("Opening cart");
    let cartLoadPath = this.data.get('load-path');
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const cartDetailsSection = document.getElementById("cart-details-modal");

    Rails.ajax({
        type: "get",
        dataType: 'json',
        url: cartLoadPath,
        data: ``,
        success: function(data) {
            cartDetailsSection.innerHTML = data.html;
            document.getElementById("modal-background").style.display = "block";
            document.getElementById("cart-modal").style.display = "block";
            document.getElementById("modal-arrow").style.display = "block";
        },
        error: function(data) { alert('Error: no Product match this ID') }
    })
  }

  closeCart(e){
    document.getElementById("modal-background").style.display = "none";
    document.getElementById("cart-modal").style.display = "none";
    document.getElementById("modal-arrow").style.display = "none";
  }
}
