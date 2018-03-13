class Category < ActiveRecord::Base
    has_many :products
    has_many :wishlists, through: :products

  accepts_nested_attributes_for :products

    # Validations 
    validates :name, :link, :image_url, presence: true
    validates :url, uniqueness: true
    validates :name, length: { minimum: 4 }
end
