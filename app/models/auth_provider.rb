class AuthProvider < ApplicationRecord
  belongs_to :user

  validates :user, :provider, :uid, presence: true
  validates_uniqueness_of :uid, scope: [:provider]
end
