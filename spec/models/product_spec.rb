require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:likes) }
  it { should have_and_belong_to_many(:liked_users).class_name('User') }

  context 'Likable' do
    context '#add_like' do
      let(:product) { create(:product) }
      let(:user) { create(:user) }
      let(:users) { create_list(:user, 1000) }

      it do
        expect(product.like_count).to eq 0
        expect(product.liked?(user)).to be_falsey
        product.add_like!(user)
        expect(product.like_count).to eq 1
        expect(product.liked?(user)).to be_truthy
      end
    end
  end
end
