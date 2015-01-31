module UsersHelper
  # render edit user registrations form
  def render_edit_user_form(user)
    if user.is_new_user == true
      render partial: "first_time_form"
    else
      render partial: "normal_form"
    end
  end

  # render avatar
  def render_avatar(user = current_user)
    "https://graph.facebook.com/#{user.authorizations.find_by_provider('facebook').uid}/picture?height=300&width=300"
  end

  # render user name
  def render_username(user = current_user)
    if user.nick_name?
      user.nick_name
    else
      user.real_name
    end
  end

  def render_level(user = current_user)
    user.level
  end

  def render_viewed_count(user = current_user)
    user.viewed
  end

  def render_status_update_form(user, status)
    render :partial => "partials/user_status_message_form", locals: { user: user, status: status } if user == current_user
  end

  # render last status
  def render_status(user = current_user)
    status = user.statuses.latest
    if status.present?
      sanitize(status.content, tags: %w(a div))
    else
      " [ 目前還沒有狀態 :< ]"
    end
  end

  def render_status_publish_time(user = current_user)
    status = user.statuses.latest
    if status.present?
      time_ago_in_words(status.created_at) + "前"
    else
      ""
    end
  end
end
