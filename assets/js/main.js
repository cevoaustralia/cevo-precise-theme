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
  if (p$("#tracks").length) {
    p$.when(loadHighcharts()).then(function() {
      PreciseTracks('tracks', p$("#tracks").data("tracks"));
    })
  }
});

function loadHighcharts() {
  var deferred = jQuery.Deferred();
  if (window.Highcharts !== undefined) {
    return deferred.resolve();
  } else {
    return jQuery.when(getScripts([
      "https://code.highcharts.com/highcharts.js",
      "https://code.highcharts.com/highcharts-more.js"])).then(function() {
          deferred.resolve();
      });
  }
}

getScripts = function(scripts) {
  var i = 0;
  var deferred = jQuery.Deferred();
  var _getScript = function() {
    if (i == scripts.length) {
      deferred.resolve();
    }
    $.getScript(scripts[i], function() {
      i++;
      _getScript();
    });
  };
  _getScript();
  return deferred.promise();
};

jQuery.ajaxSetup({
    cache: true
});
