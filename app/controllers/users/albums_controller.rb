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
    @user = User.find(params[:user_id])
    @latest_diaries = @user.diaries.get_latest(4)

    if !user_signed_in? || @user != current_user
      redirect_to root_path
      flash[:alert] = "自己的照片自己拍！"
    end
    @album = @user.albums.new
    @photos = @album.photos.new
    respond_to do |format|
      format.html
      format.json
    end

  end

  def create
    @user = User.find(params[:user_id])
    @album = @user.albums.new(album_params)
    @photos = params[:album][:photos_attributes][:"0"][:file]
    if @album.save
      @photos.each do |photo|
        @album.photos.create(file: photo)
      end
      redirect_to user_albums_path
      flash[:notice] = "成功建立一本相簿囉！"
    else
      render :new
      flash[:alert] = "Oops，請您檢查所有欄位後再試一次 :P"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :photos_attributes => [:file])
  end
end
