class StatusesController < ApplicationController

  def create
    @status = Status.new(status_params)
    @status.user_id = current_user.id
    @user = current_user
        respond_to do |format|
          if params[:status][:content].include?("script") || params[:status][:content].include?("img")
            format.html {render 'users/show', locals: {user: @user}}
            flash[:alert] = "抱歉，內容不能包含不合法的 HTML 標籤"
          else
            if @status.save
              format.html { redirect_to user_path(current_user) }
            else
              format.html { redirect_to user_path(current_user), alert: "請檢查是否正確輸入動態內容" }
            end
          end
        end
  end

  private

  def status_params
    params.require(:status).permit(:content)
  end

end
