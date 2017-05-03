class MobileApi < Grape::API
  format :json
  prefix :mobile
  version '1', using: :param, parameter: 'v'

  helpers do
    def permit_params
      ActionController::Parameters.new(params)
    end

    def product_params
      permit_params.require(:product).permit(:name, :price)
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    # status 404
    error!(e, 404)
  end

  rescue_from :all

  mount ProductsApi

  add_swagger_documentation(
    mount_path: '/swagger_doc'
  )
end
