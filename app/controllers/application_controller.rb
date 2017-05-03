class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :before_some_method
  before_action :set_locale
  after_action :after_some_method
  # around_action :around_some_method

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path
  end

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

  def set_locale
    I18n.locale = params[:lang] if params[:lang]
  end
end
