class WishlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :budget
  has_many :products
end
