class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # Didn't understand this as well
    @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params[:comment].permit(:name, :comment)
  end
end
