require 'rails_helper'

describe MobileApi do

  context 'GET /api/mobile/products' do
    let!(:products) { create_list(:product, 10) }
    let(:index_request) { get '/api/mobile/products?v=1&page=1&per=2' }
    let(:response_json) { JSON.parse(response.body) }

    before do
      index_request
    end

    it do
      expect(response_json.count).to eq 2
    end
  end

  context 'POST /api/mobile/products' do
    context 'success' do
      let(:product_params) { attributes_for(:product) }
      let(:create_request) { post '/api/mobile/products?v=1', params: { product: product_params } }
      let(:response_json) { JSON.parse(response.body) }

      it do
        expect { create_request }.to change { Product.count }.by(1)
        expect(response_json['name']).to eq product_params[:name]
      end
    end

    context 'fail' do
      let(:product_params) { attributes_for(:product, name: nil) }
      let(:create_request) { post '/api/mobile/products?v=1', params: { product: product_params } }
      let(:response_json) { JSON.parse(response.body) }

      it do
        expect { create_request }.to change { Product.count }.by(0)
        expect(response_json['errors']).to be_present
      end
    end
  end
end
