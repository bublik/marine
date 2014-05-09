$ ->
  $('#toTop').on 'click', () ->
    $('body,html').animate({scrollTop: 0 }, 800)
    return false