$(function() {

  // make our table rows hot on click
  $(document).on('click', 'tr[data-link]', function() {
    window.location = this.dataset.link;
  });

  // hide modals on success
  $.fn.modal_success = function(){
      this.modal('hide');
  };

  // bootstrap-ify tooltips
  $('[data-toggle="tooltip"]').tooltip();
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
