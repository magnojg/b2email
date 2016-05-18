$(document).ready(function() {
  $('#load_bar').click(function(event) {
    event.preventDefault();
    var COMP = $('#company_id').val();
    var CAMP = $('#campaign_id').val();
    var POS  = $('#position').val();

    base = '&ad_bar_id='

    $.ajax({
      url: 'http://localhost:3000/api/v1/ad_bars',
      data: {
        campaign_id: CAMP,
        position: POS,
        tk: 'B2EMAIL'
      },
      type: 'GET',
      error: function() {
        $('#bar_result').html('<p>An error has occurred</p>');
      },
      success: function(data) {
        $('#' + POS).html(unescape(JSON.parse(data)));
      }
    });
  });
});
