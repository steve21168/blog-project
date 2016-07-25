$(document).ready(function() {
 AddComment()
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

function AddComment() {
  $('#new_comment').on("ajax:success", (e, data, status, xhr) => {
    var commentString =
    `
    <div class="comment">
    <p>${data.body}</p>
    ${data.user.name}</br>
    <a id="delete-comment" data-remote="true" rel="nofollow" data-method="delete" href="/comments/${data.id}">Delete</a>
    </div>
    `
    $('.comments').append(commentString)
    $('textarea').val('')
  })
}
