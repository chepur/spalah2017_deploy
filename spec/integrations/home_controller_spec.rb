require 'rails_helper'

describe 'root page', js: true, type: :feature do
  before { visit '/' }
  it 'some check' do
    expect(page).to have_content 'Welcome to E-Shop after deploy!'
  end

  it 'login' do
    click_link('Login')
    expect(page).to have_content 'Log in Me'
  end
end
