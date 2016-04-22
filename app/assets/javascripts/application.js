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
//= require_directory .
//= require jquery.nested-fields

$(function() {
    $('.bootstrap-datetimepicker-widget').css('z-index','9999')

    //Input file wrapper
    inputfilewrapper($('input[type=file]'));

    //Nested field para attachments em lessons form
    $('.nested-attachment').nestedFields({
      containerSelector: '.attachments-items',
      itemSelector: '.attachment-item',
      afterInsert: function(item){
        inputfilewrapper(item.find("input[type='file']"));
        loadAttachmentTagField(item);
        loadAttachmentPosition(item);
        item.find('.more').on('click', function(){
          $(this).toggleClass('active');
          $(this).parents('.list-type-table-item').find('.list-line-more').stop().slideToggle();
          if($(this).hasClass('active')){
            $(this).children('i').attr('class', 'icon-chevron-up');
          }else{
            $(this).children('i').attr('class', 'icon-chevron-down');
          }
        });
      }
    });

    // remove all masked money
    // $('form').submit(function(){
    //     $('.money').maskMoney('destroy');
    // });

    $('.clear-calendar').click(function(){
      $(this).parent().children('.datetime_select').val('');
    });

    $('.datetime_select').addClass('input-medium');

    /*
     * Quando for página inicial, remove classe de icone na cor branco
     */
     $('#root_menu.active').find('.icon-home').removeClass('icon-white');

     $("form").nestedFields();

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
