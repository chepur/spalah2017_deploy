require 'rails_helper'

describe CommentPolicy do
  subject { described_class }
  let(:user) { build(:user, :user) }
  let(:admin) { build(:user, :admin) }
  let(:comment) { build(:comment) }

  permissions :destroy? do
    it "denies access if post is published" do
      expect(subject).not_to permit(user, comment)
    end

    it "grants access if post is published and user is an admin" do
      expect(subject).to permit(admin, comment)
    end
  end
end
