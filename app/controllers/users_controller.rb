class UsersController < ApplicationController

  def show
    if params[:nick_name].present?
      @user = User.find_by_nick_name(params[:nick_name])
    else
      @user = User.find(params[:id])
    end

    if @user != current_user
      @user.count_up!
      write_in_guestbook(@user) if user_signed_in?
    end

    @guestbook = @user.guestbooks.includes(:visitor).recent
    @status = @user.statuses.new
    @diaries = @user.diaries.get_latest(5)
  end

  def write_in_guestbook(user)
    user.guestbooks.where(visitor_id: current_user.id).delete_all if user.guestbooks.find_by_visitor_id(current_user.id)
    @user.guestbooks.create(visitor_id: current_user.id)
  end

end
