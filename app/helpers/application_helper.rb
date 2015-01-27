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

  def link_actived?(link_path)
    if current_page?(link_path)
      "active"
    end
  end

  # render avatar
  def render_avatar
    "https://graph.facebook.com/#{current_user.authorizations.find_by_provider('facebook').uid}/picture?type=large"
  end

  # 顯示最新狀態
  def render_status
    status = current_user.statuses.recent
    if status.present?
      simple_format(status.first.content)
    else
      " [ 目前還沒有狀態 :< ]"
    end
  end

  # 顯示狀態發表時間
  def render_status_publish_time
    status = current_user.statuses.recent
    if status.present?
      time_ago_in_words(status.first.created_at) + "前"
    else
      "昨天 19:31"
    end
  end
end
