class Product < ActiveRecord::Base
    belongs_to :wishlist
    belongs_to :category
end
