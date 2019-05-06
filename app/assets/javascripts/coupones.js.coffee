jQuery ->
  
  $('#coupone_expiration_type').change ->
    expiration_type = $('#coupone_expiration_type :selected').text()
    if expiration_type == 'time'
      $('#time').show()
      $('#no_of_usage').hide()
    else
       $('#no_of_usage').show()
      $('#time').hide()