$ ->
  $('#myWizard').wizard()
  $('body').on 'click', 'input.datepicker', ()->
    $(this).datepicker({ format: 'yyyy-mm-dd', autoclose: true}).focus()

