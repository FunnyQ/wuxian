$('.textarea-wrapper textarea').val('')
$('.user-status-message span').html('<%=j render_status(current_user) %>')
$('.flash-message-wrapper').html('<%=j render "partials/flash_message", locals: {flash: flash} %>')
