module ApplicationHelper

  # 依網址是否符合加入 active class
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  # 顯示最新狀態
  def render_status
    if current_user.statuses.recent.present?
      current_user.statuses.recent.first.content
    else
      " [ 目前還沒有狀態 :< ]"
    end
  end

  # 顯示狀態發表時間
  def render_status_publish_time
    if current_user.statuses.recent.present?
      time_ago_in_words(current_user.statuses.recent.first.created_at) + "前"
    else
      "昨天 19:31"
    end
  end
end
