class BroadcastForm < Rectify::Form
  attribute :email, String
  attribute :body, String

  validates :email, :body, presence: true
  validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/
end
