class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
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
