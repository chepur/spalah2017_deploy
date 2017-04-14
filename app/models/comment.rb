class Comment < ApplicationRecord
  belongs_to :product, counter_cache: true, touch: true
  belongs_to :user

  delegate :full_name, to: :user, prefix: true

  validates :text, :product, presence: true
  validates :text, length: { maximum: 140 }

  # after_commit :notify!

  # after_touch do
  #   product.touch if product.present?
  # end
  # after_commit do
  #   product.touch
  #   # product.update_attributes(name: '')
  #   # product.update(name: '')
  #   #
  #   # product.update_column(:refreshed_at, Time.now)
  #   # product.update_attribute(:refreshed_at, Time.now)
  #
  # end


  private

  # def notify!
  #   action = if self.persisted?
  #              'comments.new'
  #            else
  #              'comments.destroy'
  #            end
  #   Pusher.trigger('broadcast', action, self.as_json)
  #   # WsQueue.publish(action, self)
  # end
end
