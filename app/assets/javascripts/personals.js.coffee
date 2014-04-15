$ ->
  $('#myWizard').wizard()
  $('body').on 'click', 'input.datepicker', ()->
    $(this).datepicker({ format: 'dd/mm/yyyy', autoclose: true}).focus()

