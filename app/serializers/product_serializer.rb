class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :url, :image_link
  belongs_to :category
end
