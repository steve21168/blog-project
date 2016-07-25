$( document ).ready(function() {
  onStart()
  onLinkClick()
  //getPosts()
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

function postHTML(post){
  debugger
  var snippet = post.content.split("").splice(0,80).join("")
  return `
    <div class="all-posts">
      <div class="post">
        <h3><a href="/users/${post.user_id}/posts/${post.id}">${post.title}</a></h3>
        <p>${snippet}</p>
        <div class="author">By, ${post.author}</div>
      </div>
    </div>
    `
}

// function infiniteScroll(posts) {
//   var posts = posts.splice(0,3)
//   $('.col-sm-8').scroll(function() {
//     if($('.col-sm-8').scrollTop() + $('.col-sm-8').height() > $('div.container').height()) {
//       for (var i=0; i < 1; i++) {
//         $('.public-posts').append(postHTML(posts.pop()))
//       }
//     }
//   });
// }

// function getPosts() {
//   $.get("/get_posts", function(data) {
//     infiniteScroll(data)
//   })
// }
