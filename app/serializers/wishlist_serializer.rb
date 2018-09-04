class WishlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :budget
  # belongs_to :user
  has_many :products
end
