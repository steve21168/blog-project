$( document ).ready(function() {
  onStart()
  onLinkClick()
})


function onStart() {
  $('a.all-posts-link').addClass("hovered")
  $('.my-posts').hide()
}

function onLinkClick() {
  $('a.my-posts-link').click(function() {
    showMyPosts()
    changeLinks()
  })

  $('a.all-posts-link').click(function() {
    showAllPosts()
    changeLinks()
  })
}

function showAllPosts() {
  $('.all-posts').show()
  $('.my-posts').hide()
}

function showMyPosts() {
  $('.all-posts').hide()
  $('.my-posts').show()
}

function changeLinks() {
  $('a.all-posts-link').toggleClass("hovered")
  $('a.my-posts-link').toggleClass("hovered")
}
