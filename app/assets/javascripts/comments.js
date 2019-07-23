//= require best_in_place

$(document).ready(function(){
  $('.best_in_place').best_in_place();
});

$(document).on('click', '.create-comment', function(event) {
  function locale() { return $('body').data('locale') }
  event.preventDefault();

  var userId = $('#user-id').val();
  var reviewId = $('#review-id').val();
  var content = $('.text-content').val();
  var url = '/reviews/'+ reviewId + '/comments/';
  // '/' + locale() +

  $.ajax({
    beforeSend: function (xhr) {
      xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'POST',
    url: url,
    data: {
      comment: {
        content: content,
        review_id: reviewId,
        user_id: userId
      }
    },
    success: function (e) {
      $('.comment-count-' + reviewId).text(e.comments_count);
      $('#comments').load(document.URL + ' #comments');
    }
  });
});

$(document).on('click', '.delete-comment', function() {
  var commentId = $(this).data('id');
  var reviewId = $(this).attr('value');
  var url = '/reviews/' + reviewId + '/comments/' + commentId;
  // var currentPage = $(this).data('page');
  // var newhref = location.pathname + '?page=' + currentPage;

  $.ajax({
    beforeSend: function (xhr) {
      xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
    },
    type:'DELETE',
    url: url,
    data: {
      comment: {
        id: commentId
      }
    },
    success: function(e) {
      $('.comment-count-' + reviewId).text(e.comments_count);
      $('#comments').load(document.URL + ' #comments');
    }
  });
});

// edit comment
$(document).on('click', '.edit-comment', function() {
  var comment_id = $(this).attr('id');
  var edit_comment = '.comment-item-' + comment_id;
  var edited_comment = '.edited-' + comment_id;
  var editMode = $(this).hasClass('edit-mode'),
      contents = $(edit_comment);

  if (!editMode){
    $(this).html('Save').addClass('edit-mode');
    contents.each(function(){
      var txt = $(this).text();
      var input = $('<textarea class="edit-content form-control">');
      input.val(txt);
      $(this).html(input);
    });

  } else {
    $(this).html('Edit').removeClass('edit-mode');
    contents.each(function(){
      var user_id = $('#user-id').val();
      var review_id = $('#review-id').val();
      var content = $(this).find('.edit-content').val();
      var url = '/reviews/' + review_id + '/comments/' + comment_id;

      $.ajax({
        beforeSend: function (xhr) {
          xhr.setRequestHeader('X-CSRF-Token',
            $('meta[name="csrf-token"]').attr('content'));
        },
        type: 'PATCH',
        url: url,
        data: {
          comment: {
            id: comment_id,
            content: content,
            review_id: review_id,
            user_id: user_id
          }
        },
        success: function () {
          location.reload();
        }
      });
    });
  }
});
