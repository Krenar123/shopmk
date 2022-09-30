import { Controller } from "@hotwired/stimulus";
// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

// Connects to data-controller="render_category"
export default class extends Controller {
    connect() {}
    static targets = ["categories"];

    loadSubCategories(e) {
        let categoriesLoadPath = this.data.get("load-path");
        let mainCategoryId = e.currentTarget.dataset.reference;
        const categoryDetails = document.getElementById("category-details");

        // I have to show loading here while waiting
        categoryDetails.style.display = "none";
        document.getElementById("loader-4").style.display = "block";
        setTimeout(function() {
            document.getElementById("loader-4").style.display = "none";

            Rails.ajax({
                type: "post",
                dataType: "json",
                url: categoriesLoadPath,
                data: `reference=${mainCategoryId}`,
                success: function(data) {
                    categoryDetails.innerHTML = data.html;
                    categoryDetails.style.display = "block";
                },
                error: function(data) {
                    alert("Error: no Category match this ID");
                },
            });
        }, 3000);
    }
}