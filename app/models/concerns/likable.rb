module Likable
  extend ActiveSupport::Concern

  included do
    has_many :likes, dependent: :destroy

    has_and_belongs_to_many :liked_users, class_name: 'User'
  end

  # def likes
  #   like.present? ? JSON.parse(like) : []
  # end
  #
  def add_like(liker)
    liked_users << liker
    # likes.new(user: liker)
  end

  def add_like!(liker)
    add_like(liker)
    save
  end

  def unlike!(liker)
    liked_users.delete(liker)

    # likes.where(user: liker).destroy_all.present?
  end

  def liked?(liker)
    liked_users.exists?(liker)
    # likes.exists?(user: liker)
  end

  def like_count
    liked_users.count
  end
end