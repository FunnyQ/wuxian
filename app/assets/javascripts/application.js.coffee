# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
$ ->
  $(".hot-news-content").marquee

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

  $('.global-index-slider').bxSlider
    mode: 'fade'
    controls: false
    auto: true
    pause: 5000


# turbolink 用
$(document).on "ready page:change", ->

