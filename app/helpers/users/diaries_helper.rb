module Users::DiariesHelper

  # render add new diary btn or not
  def render_new_diary_btn(user)
    if user == current_user
      render "new_diary_btn"
    end
  end

  def render_diary_summary(diary)
    simple_format(truncate(diary.content, :length => 500,  :separator => ''))
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
