$ ->
  if $('.step-content > .personal').length
    $('.wizard').wizard('selectedItem', { step: 1 })
  if $('.step-content > .contacts').length
    $('.wizard').wizard('selectedItem', { step: 2 })
  if $('.step-content > .certificates').length
    $('.wizard').wizard('selectedItem', { step: 3 })
  if $('.step-content > .seaservices').length
    $('.wizard').wizard('selectedItem', { step: 4 })
  if $('.step-content > .langs').length
    $('.wizard').wizard('selectedItem', { step: 5 })
