// app/javascript/controllers/search_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    const currentPath = window.location.pathname;

    if (currentPath === "/shop") {
      this.element.style.display = "block";
    } else {
      this.element.style.display = "none";
    }
  }
}
