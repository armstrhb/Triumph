$(function() {

  // make our table rows hot on click
  $(document).on('click', 'tr[data-link]', function() {
    window.location = this.dataset.link;
  });

  // hide modals on success
  $.fn.modal_success = function(){
      this.modal('hide');
  };

  // if a modal has an autofocus element, focus it on show
  $('.modal').on('shown.bs.modal', function() {
    $(this).find('[autofocus]').focus();
  });

  // reset a modal's form once it's closed
  $('.modal').on('hidden.bs.modal', function() {
    $(this).find('form')[0].reset();
  });

  // bootstrap-ify tooltips
  $('body').tooltip({selector: '[data-toggle=tooltip]'});
});

function update_field(selector, newVal) {
  $("#" + selector).fadeOut(250, function() {
    if ($.type(newVal) == "string")
      $(this).html(newVal);
    else
      $(newVal).appendTo($(this));

    $(this).fadeIn(250);
  });
}
