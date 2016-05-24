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
      beforeSend: function (jqXHR, settings) {
        url = location.protocol + "//" + location.host + settings.url;
        jquery_result = url; //jquery_snippet(url);
      },
      error: function() {
        $('#bar_result').html('<p>An error has occurred</p>');
      },
      success: function(data) {
        position = data['position']
        $('#url_call').html(jquery_result);
        $('#' + position).html(data['content']);
      }
    });
  });
});

function jquery_snippet(url) {
  var snippet =
  "$(document).ready(function() {" +
  "  $.ajax({" +
  "    url: '/api/v1/ad_bars', " +
  "    data: { ad_bar_id: ID, tk: 'TOKEN' }, " +
  "    type: 'GET', " +
  "    error: function() { " +
  "      $('#bar_result').html('<p>An error has occurred</p>'); " +
  "    }, " +
  "    success: function(data) { " +
  "      position = data['position']; " +
  "      $('#' + position).html(data['content']); " +
  "    } " +
  "  })" +
  "})";

  return snippet;
}
