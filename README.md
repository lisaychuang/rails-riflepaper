# Rails Rifle Paper wishlist app

An app to view all products available for sale on [Rifle Paper Co](https://riflepaperco.com/shop/).

## 📌Features

### Sorting 
Users can sort all products by name, price, categories, and view a list of products that qualify for Free Shipping (> $50).

### Wishlist
Users can create multiple wishlists and add products to them!

### Third-party sign-up and login

Users can sign-up and login via Facebook.

## 💻Supported Versions
- Ruby 2.0.0, 2.1.x, 2.2.x, 2.3.x
- Rails 4.2.x
- SQLite3 1.3.x

## 🛠Installation Guide

Fork and clone repo: 
` https://github.com/lisaychuang/rails-riflepaper `
 
Install all gem dependencies:

` bundle install `

Create database scheme with migrations:

` rake db:migrate `

Seed database:

` rake db:seed ` 

Start local server:

` rails s `

Please note that you will requires an internet connection to seed the database, as the scraper will obtain current product information from Rifle Paper Co's website.

You can view or update scraper method at: `lib/scraper.rb`

## 🤩Contributing

Contributions are welcomed!  Fork, fix, then send a pull request.

Bug reports and pull requests are welcome on GitHub at [rails-riflepaper repo](https://github.com/lisaychuang/rails-riflepaper), please open Issues to provide feedback.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/ContributorCovenant/contributor_covenant) code of conduct.

## 📗License

This library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
