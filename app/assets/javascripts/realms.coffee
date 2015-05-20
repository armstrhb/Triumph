# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.rails.allowAction = (element) ->
  message = element.data('confirm')
  return true unless message
  $link = element.clone()
    .removeAttr('class')
    .removeAttr('data-confirm')
    .addClass('btn').addClass('btn-danger')
    .html("Don't question me! DO IT.")

  modal_html = """
               <div class="modal fade" id="myModal" aria-labelledby="myModalLabel" role="dialog" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <a class="close" data-dismiss="modal">×</a>
                       <h3>#{message}</h3>
                     </div>
                     <div class="modal-body">
                       <p>This is permanent.</p>
                     </div>
                     <div class="modal-footer">
                       <a data-dismiss="modal" class="btn">Cancel</a>
                     </div>
                   </div>
                 </div>
               </div>
               """
  $modal_html = $(modal_html)
  $modal_html.find('.modal-footer').append($link)
  $modal_html.modal()
  return false
