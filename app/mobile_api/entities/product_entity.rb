class ProductEntity < Grape::Entity
  expose :id, :name, :price, :type
  expose :email_send do |_, options|
    options[:email_send]
  end

  def type
    object.type || object.class.to_s
  end
end