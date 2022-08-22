import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]

  connect() {
  }

  sayHello() {
    this.outputTarget.textContent = "Hello, Stimulus!"
  }
}
