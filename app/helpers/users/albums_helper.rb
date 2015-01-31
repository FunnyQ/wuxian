module Users::AlbumsHelper

  def render_new_album_btn(user)
    if user == current_user
      render "new_album_btn"
    end
  end

  def render_new_photos_btn(user)
    if user == current_user
      render "new_photos_btn"
    end
  end

end
