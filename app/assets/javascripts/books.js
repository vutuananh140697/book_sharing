$(document).on('click', '.rate', function(){
  var score = $(this).index() + 1;
  var book = $('.current-book-id').attr('id');
  var is_rate = $('#is_rate').val();

  if(is_rate) {
    $.ajax({
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
      },
      type: 'POST',
      url: '/books/' + book + '/rates',
      data: {
        rate: {score: score}
      },
      success: function() {
        $('#rate').load(document.URL + ' #rate');
        location.reload();
      }
    });
  } else {
    alert("Opp!!!");
  }
});

$(document).ready(function() {
  $('.average-rate').raty({
    path: '/assets/',
    readOnly: true,
    number: 5,
    noRatedMsg: 'Not rated yet!',
    score: function() {
      return $(this).attr('data-score');
   }
  });
});
