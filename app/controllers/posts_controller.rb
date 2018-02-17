class PostsController < ApplicationController
  before_action :load_categories, :only => %w(show index)

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(nil)
    @posts = @posts.search(params[:search]) if params[:search].present?
    @posts = @category.posts if @category.present?
    @posts = @posts.published

    respond_with @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.published.find(params[:id])
    respond_with @post
  end

protected
  def load_categories
     @categories = Category.all
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
