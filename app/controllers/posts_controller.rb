class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order('votes_count DESC').page(params[:page]).per(20)

    @vote = Vote.new
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.order('votes_count DESC').page(params[:page]).per(20)
  end

  def hot
    @post = Post.new
    @posts = Post.order(rank: :desc).page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def newest
    @post = Post.new
     @posts = Post.order('updated_at DESC').page(params[:page]).per(20)
  end

  def create
    @post = Post.new(post_params)
    @post.hot
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end


  private

  def post_params
    params.require(:post).permit(:body, :rank)
  end
end
