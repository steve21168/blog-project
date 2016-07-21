class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
