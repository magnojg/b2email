(function($){
  $.fn.money_field = function(options) {
    var defaults = {
      width: null,
      class: 'span5'
    };
    var options = $.extend(defaults, options);
    
    return this.each(function() {
      obj = $(this);
      if(options.width)
        obj.css('width', options.width + 'px');
      if(options.class)
        obj.addClass(options.class);
      obj.wrap("<div class='input-prepend'>");
      obj.before("<span class='add-on'>R$</span>");
    });
  };
})(jQuery);