import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]

  connect() {
    this.beingActive()
  }

  beingActive() {
    var domElement = document.getElementById("delivery-being-active");

    if(domElement.classList.contains("delivery-being-active")) {
        domElement.classList.replace("delivery-being-active", "delivery-not-active");
    }else {
        domElement.classList.replace("delivery-not-active", "delivery-being-active");
    }
    setTimeout(() => this.beingActive(), 1000);
  }
}
