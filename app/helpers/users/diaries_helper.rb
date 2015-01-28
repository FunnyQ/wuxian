module Users::DiariesHelper

  # render add new diary btn or not
  def render_new_diary_btn(user)
    if user == current_user
      render "new_diary_btn"
    end
  end

  def render_edit_diary_btn(user)
    if user == current_user
      render "edit_diary_btn"
    end
  end

  def render_delete_diary_btn(user)
    if user == current_user
      render "delete_diary_btn"
    end
  end

  def render_diary_featured_img(diary, size = "original")
    if diary.featured_img? # has featured image

      # render requested version
      if size == "thumb"
        image_tag diary.featured_img.thumb.url, class: "featured-img img-responsive"
      else
        image_tag diary.featured_img.url, class: "featured-img img-responsive"
      end

    else # has no featured image

      # render placeholder
      if size == "thumb"
        image_tag 'http://placehold.it/100x100&text=no+pic', class: "featured-img img-responsive"
      end

    end
  end

  def get_diary_featured_img_url(diary)
    if diary.featured_img? # has featured image
      diary.featured_img.url
    else
      "http://placehold.it/1920x960&text=no+pic"
    end
  end

  def render_diary_summary(diary, length)
    simple_format(truncate(diary.content, :length => length,  :separator => ''))
  end

  def render_diary_publish_human_time(diary)
    time_ago_in_words(diary.created_at) + "前"
  end

  def render_diary_publish_time(diary)
    diary.created_at.to_date
  end

  def render_diary_content(diary)
    simple_format(diary.content)
  end

end
