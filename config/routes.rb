require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end


  resources :products do
    get '/likes', to: 'c#a'
    collection do
      get '/likes_collection', to: 'c#a'
      get :my # => /products/my
    end
    member do
      get :details # => /products/:id/details?q=iPh
      # details_product_path(id: 12312, q: 'iPh')
    end

    resources :comments
    resources :images
    # params[:product_id], params[:id]
    # product_comment_path(product, comment)
    # product_comment_path(product_id: 123, comment_id: 3)
  end

  mount Sidekiq::Web => '/sidekiq'


  # resources :comments # CRUD

  # get '/products/my' => my (collection)
  # get '/products/:id/details' => details (collection)

  # resources:
  #
  # get /products => index (collection)
  # get /products/:id => show (member)
  # get /products/new => new
  # get /products/:id/edit => edit
  #
  # post /products => create
  # put(patch) /products/:id => update
  #
  # delete /products/:id => destroy


  # get '/products', to: 'products#index', as: 'products'
  # get '/products/new', to: 'products#new', as: 'new_product'
  # get '/products/:id', to: 'products#show', as: 'product'
  # post '/products', to: 'products#create', as: 'create_product'
  # delete '/products/:id', to: 'products#destroy', as: 'destroy_product'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/about/us/company(/:company_name)(/:department)', to: 'controller_name#action_name', as: 'about_company'
  # about_company_path(company_name: 'spalah')
  # => /about/us/company/spalah params[:department] = nil,

  # about_company_path(department: 'ruby', company_name: 'spalah')
  # => /about/us/company/spalah/ruby params[:department] = ruby,

  # match '/about/us/company(/:company_name)(/:department)', to: 'controller_name#action_name', as: 'about_company2', via: [:post, :get]
end
