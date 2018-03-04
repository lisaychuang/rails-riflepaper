class Product < ActiveRecord::Base
    belongs_to :wishlist
    has_many :colors
    has_many :categories
end
