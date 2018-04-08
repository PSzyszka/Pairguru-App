class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    params_with_user_id = comment_params.merge(user_id: current_user.id)

    @comment = Comment.new(params_with_user_id)
    if @comment.save
      redirect_to movie_path(comment_params[:movie_id])
    else
      redirect_to movie_path(params[:movie_id]), alert: "Comment can't be empty"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to movie_path(params[:movie_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :movie_id)
  end
end
