module Users::AlbumsHelper
  def render_new_album_btn(user)
    render "new_album_btn" if user == current_user
  end

  def render_new_photos_btn(user)
    render "new_photos_btn" if user == current_user
  end

  def render_delete_album_btn(user)
    render "delete_album_btn" if user == current_user
  end

  def get_cover_url(album, size = "mid")
    album.photos.find_by(album.cover_id).file.send(size).url
  end

  def render_album_title(album)
    return album.title if album.title.present?
    "沒有標題"
  end
end
