class Users::AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums.all.recent
    @hot_albums = @user.albums.get_hotest(4)
  end

  def show
    @album = Album.find(params[:id])
    @user = @album.user
    @photos = @album.photos.all.recent


    @album.count_up! if @user != current_user

    return if @user.id.to_s == params[:user_id]

    fail ActionController::RoutingError.new('Not Found')
  end

  def new

  end

  def create

  end

  def edit

  end

  def create

  end

  def destroy

  end

  private

  def albums_params
    params.require(:album).permit(:title, :description)
  end
end
