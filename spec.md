# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
Yes, built with `Rails 4.2.x `

## Associations
- [x] Include at least one has_many relationship
`Category` has_many `products`, Category model line 2
`User` has_many `wishlists`, User model line 4
`Wishlist` has_many `products`, Wishlist model line 3

- [x] Include at least one belongs_to relationship
`Product` belongs_to `wishlists`, Product model line 2
`Product` belongs_to `category`, Product model line 3
`Wishlist` belongs_to `user`, Wishlist model line 2

- [x] Include at least one has_many through relationship
`Category` has_many `wishlists` through `products`, Category model line 3
`User` has_many `products` through `wishlists`, User model line 5
`Wishlist` has_many `categories` through `products`, Wishlist model line 4

- [x] The "through" part of the has_many through includes at least one user submittable attribute
`Product.category.name` 

## Validation
- [x] Include reasonable validations for simple model objects
`Category, Product, User, Wishlist` model objects have validations

- [x] Include form display of validation errors
All create actions have validation error display, see `Category, Product, User, Wishlist` #new view

## Nested resources
- [x] Include a nested form writing to an associated model using a custom attribute writer (categories/new enable creation of Products)
`/categories/new` enable creation of new `Category` and new `Product`, with a custom attribute writer method `products_attributes=(products)` in Category model line 12.

- [x] Include nested resource show or index
Index: `users/1/wishlists`
Show: `users/1/wishlists/1`

- [x] Include nested resource "new" form
New form: `users/1/wishlists/new`

- [x] Include a class level ActiveRecord scope method (Product.free_shipping,  URL: /products/free_shipping)
`Product` has two scope methods: 
    - `Product.free_shipping`, URL: `/products/free_shipping`
    - `Product.sort_by_price`, URL: `/products/sort_by_price`

## User authentication 
- [x] Include signup
Using `Bcrypt` with `has_secure_password` on User model line 2

- [x] Include login
Using `Bcrypt`

- [x] Include logout
Using `Bcrypt`

- [x] Include third party signup/login
Using `Omniauth` with `OmniAuth-facebook` strategy to enable facebook signup/login

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
Using private method to limit controller logic, see:
    - ProductController `#sort_by(sort_param)`, line 70

- [x] Views use helper methods if appropriate
Using helper methods to determine what to display in views, see:
    - ApplicationController `#current_user`, line 6
    - Application_helper, `#display_edit_delete_link`, line 3

- [x] Views use partials if appropriate
Using partial to display New / Edit form:
    - Wishlists `_form` partial
    - Products `_form` partial

Using partial to display products:
     - Products `_products` partial