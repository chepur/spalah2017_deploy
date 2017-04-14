class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :comments, dependent: :destroy
  has_many :commented_products, through: :comments,
           source: :product
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :liked_products, class_name: 'Product'

  enum role: [:guest, :user, :admin, :super_admin], _prefix: :role

  after_initialize do
    self.role ||= User.roles[:user]
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
