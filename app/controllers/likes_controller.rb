class LikesController < ApplicationController
  @post = Post.find(params[:post_id])
  @new_like = @post.likes.create(user_id: current_user.id, post_id: @post.id)
  @new_like.update_likes_counter
  respond_to do |format|
    format.html do
      if @new_like.save
        redirect_to user_post_path(@post.author_id, @post.id), notice: 'Liked 👍'
      else
        redirect_to user_post_path(@post.author_id, @post.id), alert: 'Unable to like'
      end
    end
  end
end
