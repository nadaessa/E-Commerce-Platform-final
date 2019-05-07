//= require active_admin/base
$(document).ready(function(){
    $('.select-type').change(function(){
      if ($(this).val() == 'time') {
        $('.time-tab').css('display', 'block');
        $('.usage-tab').css('display', 'none');
      }
      else {
        $('.time-tab').css('display', 'none');
        $('.usage-tab').css('display', 'block');
      }
    })
  })