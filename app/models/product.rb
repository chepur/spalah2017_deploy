class ProductTranstake
  enum locale: [:ru, :en]

  # name
end

p = Product.first

I18n.locale
p.

class Product < ApplicationRecord
  def name
    product_translations.send(I18n.locale).first.name
  end

  def name=(val)
    prod_loc = product_translations.send(I18n.locale).first
    prod_loc = product_translations.send(I18n.locale).new if prod_loc.blank?
    prod_loc.name = val
  end
  include Redis::Objects
  include Likable

  # Product.auto => Auto < Product
  # Auto.all
  # Product.mobile => Mobile < Product
  # Mobile.all
  # :type


  serialize :like, Array

  counter :view

  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments,
           source: :user
  has_many :uniq_commented_users, -> { uniq },
           through: :comments,
           source: :user

  has_many :images, as: :imagable, inverse_of: :imagable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, :name, presence: true
  validates_uniqueness_of :name
end
