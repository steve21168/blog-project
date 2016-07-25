module PostsHelper
  def post_delete(post)
    if current_user == post.user || admin?
       button_to "Delete post", user_post_path(current_user), method: "delete", class: "btn btn-primary delete", data: {confirm: "Are you sure?"}
    end
  end

  def post_edit(post)
    if current_user == post.user || admin?
       button_to "Edit post", edit_user_post_path(current_user, post), method: 'get', class: "btn btn-primary delete"
    end
  end
end
