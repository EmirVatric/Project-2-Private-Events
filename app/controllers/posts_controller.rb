class PostsController < ApplicationController
  before_action :user_logged, only: [:new, :create]

  def index
    @postAll = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    @post.user = current_user

    if @post.save 
      redirect_to posts_path
    else
      render :new
    end

  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
