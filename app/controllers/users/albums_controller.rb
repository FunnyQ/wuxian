class Users::AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums.all
  end

  def show

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
