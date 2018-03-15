class Product < ActiveRecord::Base
  belongs_to :wishlist
  belongs_to :category

  # Validations
  validates :name, :price, :url, :image_link, presence: true
  validates :url, uniqueness: true
  validates :name, length: {minimum: 2}

  #Scope methods
  scope :free_shipping, -> { where('price >= ?', 50.0)}
  scope :sort_by_price, -> { order("price ASC")}
end
