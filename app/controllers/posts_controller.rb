class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @posts = Post.all.order(create_at: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post created'
    else
      render 'new', notice: 'Failed to crete post'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
