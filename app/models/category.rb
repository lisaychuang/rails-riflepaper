class Category < ActiveRecord::Base
    has_many :products
    has_many :wishlists, through: :products
end
