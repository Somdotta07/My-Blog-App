class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(params.require(:comment).permit(:text))
     new_comment.post_id = @post.id
    new_comment.update_comments_counter
    if new_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  # private

  # def comment_params
  #   params.require(:comment).permit(:text)[:text]
  # end
end
