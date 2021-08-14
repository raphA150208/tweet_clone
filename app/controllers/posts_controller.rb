class PostsController < ApplicationController
  def index
  end
  def show
    
  end
  def new
    @post = Post.new
  end
  def create
    Post.create(params[:post])
    redirect_to new_post_path
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
end

