class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.is_new_user == true
      if @user.update_attributes(user_params)
        @user.not_new_user
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in(@user, :bypass => true)
        flash[:notice] = '謝謝您，資料已經更新'
        redirect_to root_path
      else
        # render "edit"
      end
    else
      @user.update_with_password(user_params)
      sign_in(current_user, :bypass => true)
    end

    # email_changed = @user.email != params[:user][:email]
    # first_time = @user.sign_in_count == 1

    # successfully_updated = if !first_time
    #   @user.update_with_password(user_params)
    # else
    #   @user.update_attributes(user_params)
    # end

    # if successfully_updated
    #   # Sign in the user bypassing validation in case his password changed
    #   # sign_in @user, :bypass => true
    #   # redirect_to root_path
    # else
    #   # render "edit"
    # end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

  def user_params
    params.require(:user).permit(:nick_name, :mobile_phone, :location, :current_password, :password, :password_confirmation)
  end

  # def update_resource(resource, params)
  #   if current_user.sign_in_count == 1
  #     resource.update_without_password(params)
  #   else
  #     resource.update_with_password(params)
  #   end
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:nick_name, :location, :password, :password_confirmation) }
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
