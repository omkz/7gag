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
  

  private
    def post_params
      params.require(:post).permit(:title, :body,:meme)
    end
end
