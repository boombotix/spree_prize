// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

jQuery(document).ready(function($) {
  $('.candidate-form').on('ajax:success', function afterSend(evt, request, options) {
    addAlertMessage('alert-success', request.message);
  });

  $('.candidate-form').on('ajax:error', function afterSend(evt, request, options) {
    addAlertMessage('alert-danger', request.responseJSON.message);
  });
});

function addAlertMessage(alertClass, alertMessage) {
  var container = $('.banner-box');
  var div_tag = $('<div class="alert alert-dismissable">');
  container.prepend(div_tag);
  div_tag.addClass('alert');
  div_tag.addClass('alert-dismissable');
  div_tag.addClass(alertClass);
  div_tag.html(
  '  <button type="button" class="close flash-close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
    '<center>' + alertMessage + '</center>'
  );
}
