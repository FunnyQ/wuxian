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

end
