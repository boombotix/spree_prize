// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

jQuery(document).ready(function($) {

  if ($('.candidate-form').length > 0) {

    var _fbq = window._fbq || (window._fbq = []);
    if (!_fbq.loaded) {
      var fbds = document.createElement('script');
      fbds.async = true;
      fbds.src = '//connect.facebook.net/en_US/fbds.js';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(fbds, s);
      _fbq.loaded = true;
    }
    window._fbq = window._fbq || [];

    $('.candidate-form').on('ajax:success', function afterSend(evt, request, options) {
      $('body, html').animate({scrollTop: 0}, 'slow');
      $('input[name="candidate[email]"]').map(function() {
        $(this).val('');
      });
      addAlertMessage('alert-success', request.message);
      // Facebook Conversion Code for Production - Giveaway Signups
      window._fbq.push(['track', '6026158502796', {
        currency: 'USD',
        value: 0
      }]);
    });

    $('.candidate-form').on('ajax:error', function afterSend(evt, request, options) {
      $('body, html').animate({scrollTop: 0}, 'slow');
      $('input[name="candidate[email]"]').map(function() {
        $(this).val('');
      });
      addAlertMessage('alert-danger', request.responseJSON.message);
    });

  }
});

function addAlertMessage(alertClass, alertMessage) {
  $('#ftw-alert').remove();
  var container = $('.banner-box');
  var div_tag = $('<div class="alert alert-dismissable">');
  container.prepend(div_tag);
  div_tag.addClass('alert');
  div_tag.addClass('alert-dismissable');
  div_tag.addClass(alertClass);
  div_tag.attr('id', 'ftw-alert');
  div_tag.html(
  '  <button type="button" class="close flash-close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
    '<center>' + alertMessage + '</center>'
  );
}
