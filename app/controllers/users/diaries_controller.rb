class Users::DiariesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def show

  end

  def new

  end

  def create

  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :featured_img, :location)
    end

end
