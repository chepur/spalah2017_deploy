class ProductsApi < Grape::API

  # /api/mobile/products?v=1
  resources :products do
    # GET /api/mobile/products?v=1
    desc 'Products List' do
      success ProductEntity.documentation
    end
    params do
      optional :page, type: Integer, default: 1, documentation: { desc: 'Page Number' }
      optional :per, type: Integer, default: 25
      optional :q, type: Hash do
        optional :name_cont, type: String
      end
    end
    get do
      @q = Product.ransack(params[:q])
      @products = @q.result.order('updated_at DESC')
      @products = @products.page(params.page).per(params.per)
      # @products.map { |product| ProductSerializer.new(product) }

      present @products, with: ProductEntity
    end

    get ':id' do
      present Product.find(params[:id]), with: ProductEntity
    end

    # POST /api/mobile/products?v=1
    params do
      requires :product, type: Hash do
        requires :name, type: String
        requires :price, type: Integer
      end
    end
    post do
      ProductCreateCommand.call(product_params) do
        on(:ok) do |product|
          present product, with: ProductEntity, email_send: true
        end
        on(:fail) do |product|
          present errors: product.errors
        end
      end
    end
  end
end