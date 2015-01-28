module Users::DiariesHelper

  # render add new diary btn or not
  def render_new_diary_btn(user)
    if user == current_user
      render "new_diary_btn"
    end
  end

end
