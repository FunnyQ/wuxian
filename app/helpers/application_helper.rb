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
    if current_user.statuses.present?
      current_user.statuses.last.content
    else
      " [ 目前還沒有狀態 :< ]"
    end
  end

end
