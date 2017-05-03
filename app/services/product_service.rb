class ProductService
  attr_accessor :product

  def initialize(product)
    @product = product
  end

  class << self
    def create(product_params)
      product = Product.new(product_params)
      if product.save
        User.find_in_batches do |users|
          users.each do |user|
            BrodcastMailer.new_product(product, user).deliver if user.email.present?
          end
        end
      end
      product
    end
  end
end