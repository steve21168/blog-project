module ApplicationHelper
  def admin?
    !!current_user.admin if user_signed_in?
  end
end
