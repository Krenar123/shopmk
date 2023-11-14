import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["carouselItem"]

  connect() {
    // Wait for images to load before showing the first slide
    // Delay the execution of the connect method by 2000 milliseconds (2 seconds)
    this.showSlide(0); // Replace this with your desired logic
  }

  showSlide(index) {
    const carouselItems = document.getElementsByClassName('carousel-item');
  
    for (let i = 0; i < carouselItems.length; i++) {
      const item = carouselItems[i];
      item.classList.toggle('is-active', i === index);
    }
  }

  changeSlide(event) {
    const carouselItems = document.getElementsByClassName('carousel-item');
    const offset = parseInt(event.target.dataset.carouselOffset, 10);
    const currentIndex = this.currentIndex();
    const newIndex = currentIndex + offset;

    if (newIndex >= carouselItems.length) {
      // If newIndex is beyond the last item, loop back to the first item
      this.showSlide(0);
    } else if (newIndex < 0) {
      // If newIndex is negative, loop to the last item
      this.showSlide(carouselItems.length - 1);
    } else {
      this.showSlide(newIndex);
    }
  }

  currentIndex() {
    const carouselItems = document.getElementsByClassName('carousel-item');
    const itemsArray = Array.from(carouselItems);

    return itemsArray.findIndex(item => item.classList.contains('is-active'));
  }
}
