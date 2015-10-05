class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has saved successfully"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "Post was deleted successfully"
      redirect_to @post
    else
     flash[:error] = "There was an errore deleting the post"
     render :show
   end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
