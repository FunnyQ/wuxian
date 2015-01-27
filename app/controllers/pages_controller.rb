class PagesController < ApplicationController

  # Global Index Page
  def index
    @statuses = Status.includes(:user).get_latest
  end

end
