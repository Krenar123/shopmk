import { Controller } from "@hotwired/stimulus";
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

// Connects to data-controller="product"
export default class extends Controller {
  static targets = ["product"]

  connect() {
    console.log("Product controller connected")
  }

  getProduct(e) {
    let productLoadPath = this.data.get("load-path");
    let productId = this.data.get("id");
    const productDetails = document.getElementById("category-details");
    
    productDetails.style.display = "none";
    document.getElementById("loader-4").style.display = "block";
    setTimeout(function() {
      document.getElementById("loader-4").style.display = "none";

      Rails.ajax({
          type: "get",
          dataType: "json",
          url: productLoadPath,
          data: `reference=${productId}`,
          success: function(data) {
            productDetails.innerHTML = data.html;
            productDetails.style.display = "block";
          },
          error: function(data) {
            alert("Error: no product match this ID");
          },
      });
    }, 3000);
  }
}
