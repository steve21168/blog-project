class UsersController < ApplicationController

  def show
    @posts = current_user.posts
  end

  # def edit
  #   @user = current_user
  # end
  #
  # def update
  #   current_user.update(user_params)
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:email, :name, :password, :password_confrimation)
  # end
end
