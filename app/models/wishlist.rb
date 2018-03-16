class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :products
  has_many :categories, through: :products

  # Validations
  validates :name, presence: true,
                   length: {maximum: 80,
                            too_long: "80 characters is the maximum allowed"}
  validates :notes, length: {maximum: 500,
                             too_long: "500 characters is the maximum allowed"},
                    allow_blank: true

  def toggle_product(product)
    if has_product?(product)
      self.products.delete(product)
    else
      self.products.push(product)
    end
  end

  def has_product?(product)
    product.wishlist_id == self.id
  end
end
