class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user, :product, presence: true
  validates :user_id, uniqueness: { scope: :product_id }
end
