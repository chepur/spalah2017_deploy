class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  # Action for /
  # 123...
  def index
  end
end
