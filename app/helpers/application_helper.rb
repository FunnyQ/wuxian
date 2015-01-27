module ApplicationHelper

  # image place holder
  def image_holder(w, h)
    image_tag "http://placehold.it/#{w}x#{h}"
  end

  # 依網址是否符合加入 active class
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  # check active status 2
  def link_actived?(link_path)
    if current_page?(link_path)
      "active"
    end
  end

  # render avatar
  def render_avatar(user = current_user)
    "https://graph.facebook.com/#{user.authorizations.find_by_provider('facebook').uid}/picture?type=large"
  end

  # render user name
  def render_username(user = current_user)
    if user.nick_name?
      user.nick_name
    else
      user.real_name
    end
  end

  # 顯示最新狀態
  def render_status(user = current_user)
    status = user.statuses.latest
    if status.present?
      sanitize(status.content, tags: %w(a div))
    else
      " [ 目前還沒有狀態 :< ]"
    end
  end

  # 顯示狀態發表時間
  def render_status_publish_time(user = current_user)
    status = user.statuses.latest
    if status.present?
      time_ago_in_words(status.created_at) + "前"
    else
      "昨天 19:31"
    end
  end
end
