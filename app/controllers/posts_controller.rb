class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc).includes(:thumbnail).paginate(page: params[:page], per_page: 5)
    @user_posts = current_user.posts.order(updated_at: :desc) if user_signed_in?
  end

  def show
    @comment = Comment.new
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
    if @post.update(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to user_post_path(current_user, @post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  def new
    @post = Post.new
  end

  def get_posts
    posts = Post.all
    render json: posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
