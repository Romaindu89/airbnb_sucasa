import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "checkInDate", "checkOutDate" ]

  connect() {
    const options = {
      mode: "range",
      minDate: "today",
      dateFormat: "d-m-Y",
      altInput: true
    };

    flatpickr(this.checkInDateTarget, options);
  }
}
