import { Controller } from "@hotwired/stimulus"
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

// Connects to data-controller="locations"
export default class extends Controller {
  connect() {
  }
  static targets = [ "locations" ]

  openLocation(e){
    console.log("Opening location");
    
    document.getElementById("modal-second").style.display = "block";
    document.getElementById("modal-background-second").style.display = "block";
  }

  closeLocation(e){
    console.log("close location")
    document.getElementById("modal-second").style.display = "none";
    document.getElementById("modal-background-second").style.display = "none";
  }

  createLocation(e) {
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const locationForm = document.getElementById("location-form");
    const fullAddress = document.getElementById("full-address");
    const orderButton = document.getElementById("order-button");

    // I have to show loading here while waiting
    var formData = new FormData(locationForm)
    console.log(formData);

    Rails.ajax({
      type: "post",
      dataType: 'json',
      url: '/locations',
      data: formData,
      success: function(data) {
        // We need to make it ad option select
        console.log(data)
        console.log(data.locations);
        if(data.locations == "1"){
          //Create and append select list
          var selectList = document.createElement("select");
          selectList.id = "order_user_location_id";
          fullAddress.appendChild(selectList);

          var option = document.createElement("option");
          option.value = data.location.id;
          option.text = data.address;
          selectList.appendChild(option);
          orderButton.classList.remove("disabled");
          // create an select with one option (id: user_location, address)
        }else {
          // fill the select with option
          // Create and append select list
          var selectList = document.getElementById("order_user_location_id");

          var option = document.createElement("option");
          option.value = data.location.id;
          option.text = data.address;
          selectList.appendChild(option);
        };

        document.getElementById("modal-second").style.display = "none";
        document.getElementById("modal-background-second").style.display = "none";
      },
      error: function(data) { console.log('Error: address was not created') }
    })
  }

}
