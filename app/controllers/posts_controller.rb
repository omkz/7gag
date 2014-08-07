class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.save
    redirect_to @post
  end

  def show
    # @post = Post.find params[:id]

    @commenter = current_user
    @post = Post.find(params[:id])
    @comment = Comment.build_from(@post, @commenter.id, "")
    @old_comments = @post.comment_threads.order('created_at desc')

  end

  # def vote_up
  #   begin
  #     puts "mulao"
  #     current_user.vote_for(@post = Post.find(params[:id]))
  #     # render :nothing => true, :status => 200
  #     # render js: "alert('vote up done')"
  #     respond_to do |format|
  #       format.html { redirect_to @post, notice: 'Article was successfully created.' }
  #       format.js {}
  #       format.json { render action: 'show', status: :created, location: @post }
  #     end
  #
  #   rescue ActiveRecord::RecordInvalid
  #     # render js: "alert('vote down done')"
  #     respond_to do |format|
  #       format.html { render action: 'new' }
  #       format.js {}
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  #
  # end



  def vote_up
    begin
      current_user.vote_exclusively_for(@post = Post.find(params[:id]))
      # render :nothing => true, :status => 200
      render js: "alert('vote up done')"
    rescue ActiveRecord::RecordInvalid
      render js: "alert('vote up failed')"
    end
  end



  def vote_down
    begin
      current_user.vote_exclusively_against(@post = Post.find(params[:id]))
      # render :nothing => true, :status => 200
      render js: "alert('vote down done')"
    rescue ActiveRecord::RecordInvalid
      render js: "alert('vote down failed')"
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :meme)
  end
end
