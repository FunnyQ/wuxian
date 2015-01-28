class Users::DiariesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @diaries = @user.diaries.all.recent
  end

  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user

    if @user != current_user
      @diary.count_up!
    end
  end

  def new
    @user = User.find(params[:user_id])
    if @user != current_user
      redirect_to root_path
      flash[:alert] = "自己的日記自己寫！"
    end
    @diary = @user.diaries.new
  end

  def create
    @user = User.find(params[:user_id])
    @diary = @user.diaries.new(diary_params)
    if @diary.save
      redirect_to user_diaries_path(@user)
      flash[:notice] = "成功寫下一篇日記囉！"
    else
      render :new
      flash[:alert] = "Oops，請您檢查日記欄位後再試一次 :P"
    end
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :featured_img, :location)
    end

end
