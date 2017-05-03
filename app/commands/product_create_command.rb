class ProductCreateCommand < Rectify::Command
  def initialize(product_params)
    @product_params = product_params
  end

  def call
    product = Product.new(product_params)
    if product.save
      User.find_in_batches do |users|
        users.each do |user|
          BrodcastMailer.new_product(product, user).deliver if user.email.present?
        end
      end
      broadcast(:ok, product)
    else
      broadcast(:fail, product)
    end
  end

  private

  attr_reader :product_params
end