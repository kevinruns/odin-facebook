class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy like]
  before_action :authenticate_user!, except: [:index, :show]
  
  # GET /posts or /posts.json
  def index

    @friend_posts = []
    @friend_ids = current_user.friends 
    @friend_ids << current_user.id 

    Post.all.each do | post | 
      poster = User.find_by(id: post.author_id)
      if (@friend_ids.include?(poster.id))
        p "#{poster.user_name} friend"
        @friend_posts << post
      end
    end

  end


  # GET /posts/1 or /posts/1.json
  def like

    @like = @post.like_posts.build(liker: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_back(fallback_location: :index) }
        format.json { render :index, status: :created, location: @post }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end

  end


  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to authenticated_root_path , notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:post)
    end
end
