module ApplicationHelper
  def admin?
    !!current_user.admin if user_signed_in?
  end

  def thumbnail
    if current_user.thumbnail
      image_tag(current_user.thumbnail.image.url(:thumb), class: "thumbnail")
    end
  end
end
