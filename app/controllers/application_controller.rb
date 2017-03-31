class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :before_some_method
  after_action :after_some_method
  # around_action :around_some_method

  private

  def before_some_method
    puts 'before_action => some_method'
  end

  def after_some_method
    puts 'after_action => some_method'
  end

  def around_some_method
    puts 'around_action => some_method'
  end
end
