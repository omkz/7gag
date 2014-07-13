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
    @comment = Comment.build_from( @post, @commenter.id, "" )
    @old_comments = @post.comment_threads.order('created_at desc')

  end

  def vote_up
    begin
      current_user.vote_for(@post = Post.find(params[:id]))
      render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
  

  private
    def post_params
      params.require(:post).permit(:title, :body,:meme)
    end
end
