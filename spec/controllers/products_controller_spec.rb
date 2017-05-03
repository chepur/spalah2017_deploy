require 'rails_helper'
require 'api/products_controller'

describe ProductsController do
  render_views

  context 'GET index' do
    let!(:current_user) { create(:user) }
    let!(:products) { create_list(:product, 10) }
    let(:index_request) { get :index, format: :json }
    let(:response_json) { JSON.parse response.body }

    before do
      sign_in(current_user)
      index_request
    end

    it do
      expect(response_json['current_page']).to eq 1
      expect(response_json['products'].count).to eq 5
    end
  end

  context 'POST create' do
    let!(:current_user) { create(:user) }
    let(:create_request) { post :create, params:  create_params }
    let(:create_params) { { product: attributes_for(:product), format: :json } }
    let(:response_json) { JSON.parse response.body }
    before do
      sign_in(current_user)
    end

    context do
      before do
        create_request
      end

      it do
        expect(response_json['id']).to be_present
        expect(response_json['name']).to eq create_params[:product][:name]
        expect(response_json['price'].to_s).to eq create_params[:product][:price].to_s
      end
    end


    context do
      it do
        expect { create_request }.to change { Product.count }.by(1)
      end
    end
  end
end