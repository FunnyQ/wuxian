class UsersController < ApplicationController

  def show
    if params[:nick_name].present?
      @user = User.find_by_nick_name(params[:nick_name])
    else
      @user = User.find(params[:id])
    end

    if @user != current_user
      @user.count_up!
    end

  end

end
