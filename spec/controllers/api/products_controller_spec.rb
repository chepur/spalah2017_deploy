require 'rails_helper'
require 'api/products_controller'

describe Api::ProductsController do
  render_views

  context 'GET index' do
    let!(:products) { create_list(:product, 10) }
    let(:response_json) { JSON.parse response.body }
    let(:index_request) { get :index, format: :json }

    before do
      index_request
    end

    context 'without token' do
      it do
        expect(response_json['error']).to eq 'Invalid token!'
      end
    end

    context 'with token in params' do
      let!(:current_user) { create(:user) }
      let(:index_request) { get :index, format: :json, params: { auth_token: current_user.auth_token } }

      it do
        expect(response_json['current_page']).to eq 1
        expect(response_json['products'].count).to eq 5
      end
    end

    context 'with token in header' do
      let!(:current_user) { create(:user) }
      let(:index_request) do
        request.headers['X-Auth-Token'] = current_user.auth_token
        get :index, format: :json
      end

      it do
        expect(response_json['current_page']).to eq 1
        expect(response_json['products'].count).to eq 5
      end
    end
  end
end