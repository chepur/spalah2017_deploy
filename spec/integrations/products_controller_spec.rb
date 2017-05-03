require 'rails_helper'

describe 'products page', js: true, type: :feature do
  let(:user) { create(:user) }
  let!(:products) { create(:product, name: 'Product Name') }

  before do
    login_as(user, scope: :user)
    visit '/products'
  end

  it 'some check' do
    expect(page).to have_content 'Product Name'
  end
end
