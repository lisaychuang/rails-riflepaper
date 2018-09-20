// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createWishlist(url, data) {
  $.post(url, data, "json")
    // on success create a new instance of our model object
    .done(json => {
      let myWishList = new Wishlist(json);
      myWishList.updateHTML();
    })
    .error(resp => {
      alert("There is an error!", resp);
    });
}

// Wishlist class constructor
// {id: 41, name: "qwdq", notes: "wq", budget: 0, products: []}
class Wishlist {
  constructor(json) {
    this.name = json.name;
    this.notes = json.notes;
    this.budget = json.budget;
    this.products = json.products;
  }

  // wishlist class instance method
  updateHTML() {
    $("#wishlist-name").text(this.name);
    $("#wishlist-budget").text(
      "Budget: $" +
        this.budget.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,")
    );
    $("#wishlist-notes").text("Notes: " + this.notes);
  }
}

function setupCreateWishlist() {
  $("form").submit(function(event) {
    event.preventDefault();
    // Get values from form
    let values = $(this).serialize();
    // url from form's action=?
    let url = $(this).attr("action");

    // perform AJAX call
    createWishlist(url, values);
  });
}
