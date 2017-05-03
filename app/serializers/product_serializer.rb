class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :type
  has_many :comments

  def type
    object.type || object.class.to_s
  end
end
