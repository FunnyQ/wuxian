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

    get_location if cookies[:lat].present?
  end

  def write_in_guestbook(user)
    @guestbooks = user.guestbooks
    @guestbooks.where(visitor_id: current_user.id).delete_all if @guestbooks.find_by_visitor_id(current_user.id)
    @guestbooks.create(visitor_id: current_user.id)
    @guestbooks.first.delete if @guestbooks.count >= 25
  end

  def get_location
    lat = cookies[:lat]
    lng = cookies[:lng]
    loc = Geocoder.search("#{lat}, #{lng}")
    if loc.length > 4
      @location = loc[loc.length - 3].formatted_address
    else
      @location = loc.first.formatted_address
    end
  end

end
