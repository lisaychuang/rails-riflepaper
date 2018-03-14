class Category < ActiveRecord::Base
    has_many :products
    has_many :wishlists, through: :products

    accepts_nested_attributes_for :products

    # Validations 
    validates :name, :link, :img_url, presence: true
    validates :link, uniqueness: true
    validates :name, length: { minimum: 4 }

    def products_attributes=(products)
        products.values.each do |product_hash|
            self.products.push(Product.create(product_hash))
        end
    end
end
