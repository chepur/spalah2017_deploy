class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  has_many :comments
end
