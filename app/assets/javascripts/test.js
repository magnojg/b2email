$(document).ready(function() {
  $('#ad_bar_position_select').change(function(event) {
    event.preventDefault();
    var company = $('#companies_select').val();
    var position = $(this).val();

    $.ajax({
      url: '/api/v1/ad_bar',
      dataType: 'json',
      data: {
        company_id: company,
        position: position,
        tk: 'B2EMAIL',
        renew_file: true
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
        var content = data['content'];

        if(content == '') {
          content = 'Nothing to display';
        }

        $('#url_call').html(jquery_result);
        $('#' + position).html(content);
      }
    });
  });
});

function jquery_snippet(url) {
  var snippet =
  "$(document).ready(function() {" +
  "  $.ajax({" +
  "    url: '/api/v1/ad_bar', " +
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
