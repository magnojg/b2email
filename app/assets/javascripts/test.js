$(document).ready(function() {
  $('#load_bar').click(function(event) {
    event.preventDefault();
    var ad_bar_id = $('#ad_bar_id').val();

    $.ajax({
      url: '/api/v1/ad_bars',
      dataType: 'json',
      data: {
        ad_bar_id: ad_bar_id,
        tk: 'B2EMAIL'
      },
      type: 'GET',
      error: function() {
        $('#bar_result').html('<p>An error has occurred</p>');
      },
      success: function(data) {
        console.log(data)
        position = data['position']
        $('#' + position).html(data['content']);
      }
    });
  });
});
