module Api
  class ApplicationController < ::ApplicationController
    private

    def authenticate_user!
      unless current_user
        render json: { error: 'Invalid token!' }
      end
    end

    def current_user
      @current_user ||= User.find_by(
        auth_token: params[:auth_token] || request.headers['X-Auth-Token']
      )
    end
  end
end
