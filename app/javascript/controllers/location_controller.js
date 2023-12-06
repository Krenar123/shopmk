import { Controller } from "@hotwired/stimulus"
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";
import "leaflet-css";
import L from 'leaflet';

// Connects to data-controller="locations"
export default class extends Controller {
  connect() {
    if (this.data.get('showLocation')) {
      // Run the action when connected
      this.openLocation();
    }
  }
  static targets = [ "locations" ]

  openLocation(e){
    console.log("Opening location");
    
    document.getElementById("modal-second").style.display = "block";
    document.getElementById("modal-background-second").style.display = "block";
    
    this.initializeMap(); // Initialize a new map
  }

  closeLocation(e){
    
    console.log("close location")
    document.getElementById("modal-second").style.display = "none";
    document.getElementById('drag-marker-text').style.display = "none";
    document.getElementById("modal-background-second").style.display = "none";
  }

  initializeMap() {
    const mapContainer = document.getElementById('map');
    const dragMarkerText = document.getElementById('drag-marker-text');
    if (mapContainer) {
    
      const map = L.map('map').setView([42.01041, 21.44080], 15);
      map.invalidateSize();

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors',
      }).addTo(map);

      dragMarkerText.style.display = "block";

      var customIcon = L.icon({
        iconUrl: '/assets/map-marker.svg',
        iconSize: [38, 31],
        iconAnchor: [22, 31],
        popupAnchor: [-3, -76],
      });
      
      const marker = L.marker([42.01041, 21.44080], { icon: customIcon, draggable: true }).addTo(map);

      const polygonCoordinates = [
        [42.02525, 21.42991],
        [42.00900, 21.43355],
        [42.00554, 21.44144],
        [42.02432, 21.45006]
      ];
    
      // Create a polygon and add it to the map
      const polygon = L.polygon(polygonCoordinates, { color: '#507c99' }).addTo(map);

      marker.on('dragend', (event) => {
        const { lat, lng } = event.target.getLatLng();
        console.log(`Marker dragged to: ${lat}, ${lng}`);
        const latitude = document.getElementById("latitude");
        const longitude = document.getElementById("longitude");
        latitude.value = `${lat}`;
        longitude.value = `${lng}`;
      });
    }
  }

  createLocation(e) {
    //let mainCategoryId = e.currentTarget.dataset.reference;
    const locationForm = document.getElementById("location-form");
    const fullAddress = document.getElementById("full-address");
    const orderButton = document.getElementById("order-button");
    
    // Check if neighborhood, road, and phone are empty
    const neighborhoodInput = document.getElementById("neighborhood");
    const roadInput = document.getElementById("road");
    const phoneInput = document.getElementById("phone");

    if (
      neighborhoodInput.value.trim() === "" ||
      roadInput.value.trim() === "" ||
      phoneInput.value.trim() === ""
    ) {
      if(neighborhoodInput.value.trim() === "") {
        // Focus on the neighborhood input and exit
        neighborhoodInput.focus();
      } else if(roadInput.value.trim() === "") {
        // Focus on the neighborhood input and exit
        roadInput.focus();
      } else if(phoneInput.value.trim() === "") {
        // Focus on the neighborhood input and exit
        phoneInput.focus();
      }
    } else {
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
            selectList.name = "order[user_location_id]"; 

            fullAddress.appendChild(selectList);

            var option = document.createElement("option");
            option.value = data.location.id;
            option.text = data.address;
            option.selected = true;
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
}
