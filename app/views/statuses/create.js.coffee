$('.textarea-wrapper textarea').val('')
$('.user-status-message span').html('<%=j render_status(current_user) %>')
$('.user-status-subinfo .timestamp').html('<%=j render_status_publish_time(current_user) %>')
