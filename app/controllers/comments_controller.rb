class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment].permit(:body))
    if @comment.save
      flash[:notice] = "Your commnet has saved"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to @post
    else
      flash[:erroe] = "Comment couldn't be deleted. Try again."
      render @post
    end
  end
end
