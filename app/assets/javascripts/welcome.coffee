t1 = setInterval(myTimer, 10)
score = 0
n = 0
scroll = dw_getScrollOffsets()
sy = scroll.y
sflg = false
cflg = 0

coin_cross = (sl, st, el, et) ->
  $bgimg = $('.bgimg')
  $coin = $('<div class="coin">').insertAfter($bgimg).css(
    'left': sl
    'top': st
    'z-index': 500).animate({
    'top': et
    'left': el
  }, 1000, ->
    $coin.remove()
    score++
    return
  )
  return

myTimer = ->
  `var _`
  n++
  _ = text_size()
  if n >= 500
    n = 0
    score++
    sflg = false
  if cflg > 0
    if cflg <= 25
      cflg++
      if cflg % 5 == 0
        _ = coin_cross($(window).scrollLeft(), $(window).scrollTop() + $(window).height(), $(window).scrollLeft() + $(window).width(), $(window).scrollTop())
    else
      cflg = 0
  scroll = dw_getScrollOffsets()
  if scroll.y > sy + 500
    if !sflg
      cflg = 1
    sy = scroll.y
    sflg = true
  document.getElementById('score').innerHTML = score.toString()
  return

dw_getScrollOffsets = ->
  doc = document
  w = window
  x = undefined
  y = undefined
  docEl = undefined
  if typeof w.pageYOffset == 'number'
    x = w.pageXOffset
    y = w.pageYOffset
  else
    docEl = if doc.compatMode and doc.compatMode == 'CSS1Compat' then doc.documentElement else doc.body
    x = docEl.scrollLeft
    y = docEl.scrollTop
  {
    x: x
    y: y
  }

delay = (URL) ->
  setTimeout (->
    window.location = URL
    return
  ), 700
  return

text_size = ->
  start_size = 95
  stext = $('.score_text')
  len_txt = stext.html().length
  new_size = start_size - (15 * (len_txt - 1))
  stext.css 'font-size', new_size
  return

$(window).load ->
  $score_box = $('.score_box')
  $('a').on 'click', ->
    $link = $(this)
    $coin = $('<div class="coin">').insertAfter($link).css(
      'left': $link.offset().left
      'top': $link.offset().top).animate({
      'top': $score_box.offset().top + 75
      'left': $score_box.offset().left + 50
    }, 500, ->
      $coin.remove()
      score++
      return
    )
    href = $(this).attr('href')
    setTimeout (->
      window.location = href
      return
    ), 1000
    return
  return
