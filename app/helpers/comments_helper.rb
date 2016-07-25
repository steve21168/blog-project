module CommentsHelper
  def comment_delete(comment)
    if current_user == comment.user || admin?
      link_to "Delete", comment_path(comment), id: "delete-comment", remote: true, method: :delete
    end
  end
end
