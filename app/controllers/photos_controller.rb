class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    @user = @photo.album.user

    if @user == current_user
      @photo.destroy
      flash[:success] = "照片已經成功刪除"
      redirect_to :back
    else
      flash[:error] = "自己的照片自己刪！"
      redirect_to :back
    end
  end
end
