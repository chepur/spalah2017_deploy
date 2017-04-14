require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:likes) }
  it { should have_and_belong_to_many(:liked_products).class_name('Product') }
end
