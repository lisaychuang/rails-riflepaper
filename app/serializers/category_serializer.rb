class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :link, :img_url
  has_many :products
end
