# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

## Associations
- [x] Include at least one has_many relationship (Category has_many Products) 
- [x] Include at least one belongs_to relationship (Product belongs_to Category)
- [x] Include at least one has_many through relationship (User has_many products through wishlists)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (Edit/ Delete product)

## Validation
- [x] Include reasonable validations for simple model objects
- [x] Include form display of validation errors (for all create action)


## Nested resources
- [x] Include a nested form writing to an associated model using a custom attribute writer (categories/new enable creation of Products)
- [x] Include nested resource show or index (users/2/wishlists)
- [x] Include nested resource "new" form (users/2/wishlists)
- [x] Include a class level ActiveRecord scope method (Product.free_shipping,  URL: /products/free_shipping)

## User authentication 
- [x] Include signup (Using Bcrypt)
- [x] Include login (Using Bcrypt)
- [x] Include logout (Using Bcrypt)
- [x] Include third party signup/login (Using OmniAuth-facebook to enable facebook login)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate