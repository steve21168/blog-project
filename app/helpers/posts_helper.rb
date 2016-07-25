module PostsHelper
  def post_delete(post)
    if current_user == post.user || admin?
       button_to "Delete post", user_post_path(current_user), method: "delete", class: "btn btn-primary delete", data: {confirm: "Are you sure?"}
    end
  end
end
