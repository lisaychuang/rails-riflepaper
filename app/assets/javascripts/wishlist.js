// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function() {
  "use strict";
  // Wishlist prototype
  // {id: 41, name: "qwdq", notes: "wq", budget: 0, products: []}
  function Wishlist(json) {
    this.data = json;
  }

  Wishlist.prototype = {};
  Wishlist.prototype.updateHTML = function() {
    $("#wishlist-name").text(this.data.name);
    $("#wishlist-budget").text(
      "Budget: $" + this.data.budget.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,")
    );
    $("#wishlist-notes").text("Notes: " + this.data.notes);
  };

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

  //   Create a new wishlist onSubmit event listener
  $(function() {
    $("form").submit(function(event) {
      event.preventDefault();
      // Get values from form
      let values = $(this).serialize();
      // url from form's action=?
      let url = $(this).attr("action");

      // perform AJAX call
      createWishlist(url, values);
    });
  });
})();
