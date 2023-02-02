import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["product"]

  connect() {
    console.log("Product controller connected")
  }

  getProduct(event) {
    let productLoadPath = this.data.get("load-path");
    let productId = event.currentTarget.dataset.id;
    const productDetails = document.getElementById("category-details");

    console.log(productLoadPath);
    
    productDetails.style.display = "none";
    document.getElementById("loader-4").style.display = "block";
    setTimeout(function() {
      document.getElementById("loader-4").style.display = "none";

      Rails.ajax({
          type: "post",
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
