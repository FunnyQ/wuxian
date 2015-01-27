class PagesController < ApplicationController

  # Global Index Page
  def index
    @statuses = Status.get_latest
  end

end
