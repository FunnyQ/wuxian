# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins

# run codes after page loaded with turbolinks
$(document).on "ready page:load", ->

  # hot news marquee
  $(".hot-news-content").marquee

    allowCss3Support: true

    css3easing: 'linear'

    pauseOnHover: true

    #speed in milliseconds of the marquee
    duration: 15000

    #gap in pixels between the tickers
    gap: 50

    #time in milliseconds before the marquee will start animating
    delayBeforeStart: 0

    #'left' or 'right'
    direction: "left"

    #true or false - should the marquee be duplicated to show an effect of continues flow
    duplicated: true

  # global index slider
  $('.global-index-slider').bxSlider
    mode: 'fade'
    controls: false
    auto: true
    pause: 5000

# $(document).on "ready page:change", ->

#     s = document.createElement("script")
#     s.async = true
#     s.type = "text/javascript"
#     s.src = "//" + disqus_shortname + ".disqus.com/count.js"
#     (document.getElementsByTagName("HEAD")[0] or document.getElementsByTagName("BODY")[0]).appendChild s
#     return
#     # * * Disqus Reset Function * *
#     reset = (newIdentifier, newUrl, newTitle, newLanguage) ->
#       DISQUS.reset
#         reload: true
#         config: ->
#           @page.identifier = newIdentifier
#           @page.url = newUrl
#           @page.title = newTitle
#           @language = newLanguage
#           return

#       return

# adding transitions to page change with turbolinks
#
# document.addEventListener 'page:change', ->
#   document.getElementById('primary-content').className += 'animated fadeIn'

# document.addEventListener 'page:fetch', ->
#   document.getElementById('primary-content').className += 'animated fadeOut'
