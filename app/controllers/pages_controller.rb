class PagesController < ApplicationController

  # Global Index Page
  def index
    @statuses = Status.includes(:user).get_latest(5)
    @diaries = Diary.includes(:user).get_hotest(4)
    @latest_albums = Album.includes(:user).get_latest(3)
    @hot_albums = Album.includes(:user).get_hotest(3)
  end

end
