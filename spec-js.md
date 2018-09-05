# Specifications for the Rails with jQuery Assessment

Specs:
- [X] Use jQuery for implementing new requirements
- [X] Include a `show` resource rendered using jQuery and an Active Model Serialization JSON backend.

On `product` show page, users can click on the <kbd>Next Product</kbd> button to fetch JSON data of the next product, and then appended to the page using jQuery.

- [X] Include an `index` resource rendered using jQuery and an Active Model Serialization JSON backend.

On `wishlist` show page, users can click on the <kbd>Show Products</kbd> button to fetch the list of products that belong to the wishlist via an **AJAX GET** request. Data is retrieved in JSON format, and then appended to the page using jQuery.

- [X] Include at least one `has_many` relationship in information rendered via JSON and appended to the DOM.

Association data is defined in serializer files, the relationship is rendered on each wishlist's show page. 
- A `Wishlist` has_many `products`
- A `Product` belongs_to a `wishlist`

- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.

Users can create a new `wishlist` and render it without a page refresh. This was achieved by hooking up an event listener to the `submit` event of the `Wishlist` new form, serializing form data, and submitting the data via **AJAX POST** request. The response is rendered on the page using jQuery.

- [X] Translate JSON responses into Javascript Model Objects.
- [X] At least one of the Javascript Model Objects must have at least one method added by your code to the prototype.

In `wishlist.js` file, JSON response from the `Create Wishlist` form is translated into a JS Model Object. On the `Wishlist` prototype, there is a `updateHTML` method which will render the object's properties on the page using jQuery.  

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message