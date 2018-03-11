class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :products
  has_many :categories, through: :products

  # Validations
  validates :name, presence: true,
                   length: {maximum: 80,
                            too_long: "80 characters is the maximum allowed"}
  validates :note, length: {maximum: 500,
                            too_long: "500 characters is the maximum allowed"},
                    allow_blank: true
end
