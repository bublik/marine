$ ->
  $('body').on 'click', '.vacancy-row', ()->
    window.open($(this).data('url'),'_blank')

  $('#switch_rank').change (e)->
    window.location =  $(e.target).data('url')+'?rank_id='+e.target.value
