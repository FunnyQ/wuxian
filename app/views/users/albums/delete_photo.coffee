photosCount = $('.photos-count').html()

$("#photo-<%= @photo.id %>").remove()
$('.photos-count').html(photosCount - 1)
