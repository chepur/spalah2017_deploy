require 'rails_helper'

describe Comment, type: :model do
  context 'check validations' do
    context 'for text' do
      it 'required' do
        comment = Comment.new
        comment.valid?
        [1,2,3].include? 10
        expect([1,2,3]).to include 3
        expect(comment.errors[:text]).to be_present
      end
    end
  end

  context '#full_name' do
    it do
      # build(:comment)
      # create(:comment)
    end
  end
end
