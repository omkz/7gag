class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.save
    redirect_to root_path


  end

  private
    def post_params
      params.require(:post).permit(:title, :body,:meme)
    end
end
