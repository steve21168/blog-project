$(document).ready(function() {
  $('#new_comment').on("ajax:success", (e, data, status, xhr) => {
    $('.comments').append(
      `<p>${data.body}</p>
      <p>by, ${data.user.name}</p>`)
    $('textarea').val('')
  })

})
