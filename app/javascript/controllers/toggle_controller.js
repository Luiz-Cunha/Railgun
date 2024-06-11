import { Controller } from "@hotwired/stimulus"
// import Swal from 'sweetalert2';

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["formToggle"]
  connect() {
    console.log("Working");
  }

  fire () {
    console.log("fire");
    console.log(this.data.get("value"));
    if (this.data.get("value") === "true"){
      this.formToggleTarget.classList.toggle("d-none");
    }
    else{
      window.alert("You must be logged in!");
    }

  }
}
