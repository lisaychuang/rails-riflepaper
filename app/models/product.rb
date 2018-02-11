class Product < ActiveRecord::Base
    belongs_to :wishlist
    has_many :colors
end
