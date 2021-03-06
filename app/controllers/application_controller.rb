class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  use_growlyflash

  private

  def after_sign_in_path_for(resource)
    if resource.is_new_user == true
      edit_user_registration_path
    else
      root_path
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end
