class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.build(post_params)
    new_post.comments_counter = 0
    new_post.likes_counter = 0
  
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.user_id, new_post.id), notice: 'Post has been successfully created!'
        else
          render :new, alert: 'Post not created. Please try again!'
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
