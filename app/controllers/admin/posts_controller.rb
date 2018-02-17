class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :list_resources, only: [:show, :edit, :update, :new, :create]


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    respond_with @posts, :location => admin_posts_path
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  	render :location=>"application"
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_with @post
  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with @post, :location => admin_posts_path
   
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    params[:post][:category_ids] ||= []
flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(post_params)
    respond_with @post, :location => admin_posts_path
   
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_with @post, :location => admin_posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :excerpt, :body, :user_id, :slug, :draft, :published_at, category_ids: [])
    end

    def list_resources
      @users = User.all
      @categories = Category.all
    end
end
