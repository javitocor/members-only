class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index 
        @posts = Post.all
    end

    def new 
        @posts = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: 'Post created'
        else
            render 'new', notice: 'Failed to crete post'
    end

    private

    def post_params 
        params.require(:post).permit()
    end

end
