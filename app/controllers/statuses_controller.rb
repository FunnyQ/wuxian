class StatusesController < ApplicationController

  def create
    @status = current_user.statuses.new(status_params)
    @user = current_user
    respond_to do |format|
      if params[:status][:content].include?("script") || params[:status][:content].include?("img")
        format.html { render 'users/show', locals: { user: @user } }
        flash[:error] = "抱歉，您的動態中包含了不建議使用的 HTML 標籤"
        format.js
      else
        if @status.save
          format.html { redirect_to user_path(current_user) }
          format.js
          flash[:success] = "成功更新動態！"
        else
          format.html { redirect_to user_path(current_user) }
          flash[:alert] = "抱歉，請檢查是否正確輸入動態內容 :)"
          format.js
        end
      end
    end
  end

  private

  def status_params
    params.require(:status).permit(:content)
  end

end
