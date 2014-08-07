class CommentsController < ApplicationController
  respond_to :html, :json, :js

  def index
  end

  # def create
  #   @comment_hash = comment_params
  #   @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
  #   # Not implemented: check to see whether the user has permission to create a comment on this object
  #   @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
  #   # if @comment.save
  #   #   format.html { redirect_to @comment, notice: '@comment was successfully created.' }
  #   #   format.json { render action: 'show', status: :created, location: @comment }
  #   # else
  #   #   format.html { redirect_to root_path }
  #   #   format.json { render json: @comment.errors, status: :unprocessable_entity }
  #   # end
  #
  #   if @comment.save
  #     # redirect_to root_path
  #     flash[:notice] = "comment created successfully";
  #   else
  #     # redirect_to root_path
  #   end
  # end

  def create
    @comment_hash = comment_params
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    # if @comment.save
    #   format.html { redirect_to @comment, notice: '@comment was successfully created.' }
    #   format.json { render action: 'show', status: :created, location: @comment }
    # else
    #   format.html { redirect_to root_path }
    #   format.json { render json: @comment.errors, status: :unprocessable_entity }
    # end

    # if @comment.save
    #   # redirect_to root_path
    #   flash[:notice] = "comment created successfully";
    # else
    #   # redirect_to root_path
    # end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Article was successfully created.' }
        format.js { }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.js {}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end


end
