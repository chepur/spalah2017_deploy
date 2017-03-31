class CommentJob < ApplicationJob
  queue_as :default

  def perform(action, comment_json)
    puts '123123'
    sleep 5
    Pusher.trigger('broadcast', action, comment_json)
  end
end
