$(document).ready(function() {
 comment()
 deleteComment()
 onDeleteClick();
})

function onDeleteClick() {
  $('.comments').on("click", "a#delete-comment", function() {
    $(this).parent().addClass("to-delete")
  })
}

function deleteComment() {
  $('.comments').on("ajax:success", 'a#delete-comment', function(e, data, status, xhr) {
    $('.to-delete').remove()
  })
}

function comment() {
  $('#new_comment').on("ajax:success", function(e, data, status, xhr) {
    if (data.errors) {
      commentErrors(data)
    } else {
      addComment(data)
    }
  })
}

function addComment(data) {
  var commentString = '<div class="comment"><p>'
  + data.body
  + '</p>'
  + data.user.name
  + '</br><a id="delete-comment" data-remote="true" rel="nofollow" data-method="delete" href="/comments/'
  + data.id
  + '">Delete</a></div>'
  $('.comments').append(commentString)
  $('textarea').val('')
}

function commentErrors(data) {
    data.errors.forEach(function(error) {
      var errorHtml = '<div class="alert alert-danger" role="alert">'+ error + '</div>'
      if ($('div.alert-danger')) {
        $('div.alert-danger').remove()
      }
      $('.comments').append(errorHtml)
    })
}

//  var commentString =
//   `
//   <div class="comment">
//   <p>${data.body}</p>
//   ${data.user.name}</br>
//   <a id="delete-comment" data-remote="true" rel="nofollow" data-method="delete" href="/comments/${data.id}">Delete</a>
//   </div>
//   `
