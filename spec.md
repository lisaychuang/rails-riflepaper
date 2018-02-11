# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

## Associations
- [x] Include at least one has_many relationship (Product has_many colors) 
- [x] Include at least one belongs_to relationship (Color belongs_to Product)
- [ ] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

## Validation
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)


## Nested resources
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

## User authentication 
- [x] Include signup (Using Bcrypt)
- [x] Include login (Using Bcrypt)
- [x] Include logout (Using Bcrypt)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate