class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :comments, dependent: :destroy
  has_many :commented_products, through: :comments,
           source: :product
  has_many :likes, dependent: :destroy
  has_many :auth_providers, dependent: :destroy
  has_and_belongs_to_many :liked_products, class_name: 'Product'

  enum role: [:guest, :user, :admin, :super_admin], _prefix: :role

  validates :auth_token, presence: true, uniqueness: true

  after_initialize do
    self.role ||= User.roles[:user]
  end

  before_validation do
    if self.password.blank?
      self.password = Devise.friendly_token
    end
  end
  before_validation :generate_auth_token

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(value)
    first_last_name = value.split(' ')
    self.first_name = first_last_name[0]
    self.last_name = first_last_name[1]
  end

  private

  def generate_auth_token
    if self.auth_token.blank?
      loop do
        auth_token = Devise.friendly_token
        unless User.exists?(auth_token: auth_token)
          self.auth_token = auth_token
          break
        end
      end
    end
  end
end
