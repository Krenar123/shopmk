import { Controller } from "@hotwired/stimulus"
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["accepted", "prepared", "delivered", "paid"]

  connect() {
    
  }

  updateStatus() {
    console.log("Delivery status");

    let updateDeliveryPath = this.data.get("update-url");
    const deliveryForm = document.getElementById("delivery-status-form");

    console.log(updateDeliveryPath);
    // I have to show loading here while waiting
    var formData = new FormData(deliveryForm)

    Rails.ajax({
        type: "put",
        dataType: "json",
        url: updateDeliveryPath,
        data: formData,
        success: function(data) {
            console.log("Status updated");
        },
        error: function(data) {
            alert("Error: no Product match this ID");
        },
    });
  }
}
