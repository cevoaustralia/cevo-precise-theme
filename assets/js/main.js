jQuery(document).ready(function(p$) {
  p$('.level-bar-inner').css('width', '0');
  p$(window).on('load', function() {
    p$('.level-label').tooltip();
    p$('.level-bar-inner').each(function() {
      var itemWidth = p$(this).data('level');
      p$(this).animate({
        width: itemWidth
      }, 800);
    });
  });
});

