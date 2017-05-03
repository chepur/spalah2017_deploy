class Api::ProductsController < Api::ApplicationController
  def index
    @products = Product.page(params[:page]).per(params[:per])
  end
end
