$(document).ready(function() {
  $('.select-book').select2({
    theme: 'bootstrap'
  });

  if ($('textarea').length > 0) {
    var data = $('.ckeditor');
    $.each(data, function(i) {
      CKEDITOR.replace(data[i].id)
    });
  }

  CKEDITOR.config.height = 500;
});

// like
$(document).on('click', '#likeBtn', function () {
  var review = $(this).attr('data');

  $.ajax({
    beforeSend: function(xhr){
      xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'POST',
    url: '/reviews/' + review + '/likes',
    success: function() {
      $('#like-' + review).load(document.URL + ' #like-' + review);
    }
  });
});

$(document).on('click', '.likeBtn', function () {
  var review = $('#review-id').val();
  var element = this;
  $.ajax({
    beforeSend: function(xhr){
      xhr.setRequestHeader('X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'POST',
    url: '/reviews/' + review + '/likes',
    success: function(e) {
      $('.like-count-' + review).text(e.likes_count);
      $(element).removeClass('likeBtn');
      $(element).addClass('unlikeBtn');
      $(element).attr('like-id', e.like_id);
      $('.like').load(document.URL + ' .like');
    }
  });
});

$(document).on('click', '.unlikeBtn', function () {
  var review = $('#review-id').val();
  var like = $(this).attr('like-id');
  var element = this;
  $.ajax({
    beforeSend: function(xhr){
      xhr.setRequestHeader('X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'DELETE',
    url: '/reviews/' + review + '/likes/' + like,
    success: function(e) {
      $('.like-count-' + review).text(e.likes_count);
      $(element).removeClass('unlikeBtn');
      $(element).addClass('likeBtn');
      $('.like').load(document.URL + ' .like');
    }
  });
});

$(document).on('click', '.like-login', function() {
  alert("Please login!");
  window.location.href = '/users/sign_in';
});
