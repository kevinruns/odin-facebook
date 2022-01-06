class CommentsController < ApplicationController
  before_action :get_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :like]

  def new
    @comment = @post.comments.build
  end


  def like

    @like = @comment.like_comments.build(liker: current_user)

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


  def create
    @comment = @post.comments.build(comment_params)
    @comment.author_id = current_user.id

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to authenticated_root_path , notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def show
  end
  
  def edit
  end

  def index
    @comments = @post.comments
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@post), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  #Only allow a list of trusted parameters through.
  def comment_params
   params.require(:comment).permit(:body)
  end

  def get_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

end
