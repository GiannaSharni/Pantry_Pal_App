class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
  end

  def submit_review
    @post = Post.find(params[:id])
    @review = @post.reviews.build(review_params)
    if @review.save
      redirect_to @post
    else
      render 'show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def review_params
    params.require(:review).permit(:name, :rating, :comment)
  end
end
