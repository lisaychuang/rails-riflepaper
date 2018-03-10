class Product < ActiveRecord::Base
    belongs_to :wishlist
    belongs_to :category

    # Validations 
    validates :name, :price, :url, :image_link, presence: true
    validates :url, uniqueness: true
    validates :name, length: { minimum: 2 }
    
end
