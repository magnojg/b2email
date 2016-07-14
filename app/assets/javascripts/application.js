// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require libs/bootstrap
//= require jquery.minicolors
//= require_directory .
//= require jquery.nested-fields
//= require ckeditor/init

$(function() {

  $('#companies_select, .companies_select').change(function() {
    var company_id, self, url;
    self = $(this);
    url = '/load_campaigns';
    company_id = $(this).val();
    if (company_id !== null) {
      $.ajax({
        url: url,
        data: {
          company_id: company_id
        },
        dataType: 'script'
      });
    }
  });

  $('#campaigns_select, .campaigns_select').change(function() {
    var campaign_id, self, url;
    self = $(this);
    url = '/load_ad_bars';
    campaign_id = $(this).val();
    if (campaign_id !== null) {
      $.ajax({
        url: url,
        data: {
          campaign_id: campaign_id
        },
        dataType: 'script'
      });
    }
  });

  $('.bootstrap-datetimepicker-widget').css('z-index','9999');

  //Input file wrapper
  inputfilewrapper($('input[type=file]'));

  $('.clear-calendar').click(function(){
    $(this).parent().children('.datetime_select').val('');
  });

  $('.datetime_select').addClass('input-medium');

  /*
   * Quando for página inicial, remove classe de icone na cor branco
   */
   $('#root_menu.active').find('.icon-home').removeClass('icon-white');

   $('form').nestedFields();

  $(".select-all").on("click", function(){
    $(".check").attr("checked", $(this).is(":checked"));
  });
});

function addCalendar(){
  $('.datetime')
  .append('<span class="add-on"><i class="icon-calendar"></i></span>')
  .datetimepicker({
    format: "dd/MM/yyyy hh:mm",
    language: "pt-BR"
  })
  .append('<span class="add-on clear-calendar"><i class="icon-remove"></i></span>')
  .removeClass('datetime')
  .addClass('load-datetime');
}
