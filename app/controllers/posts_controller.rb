class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all
  end
  def show
  end
  def new
    @post = Post.new
  end
  def create
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end