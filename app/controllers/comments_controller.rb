class CommentsController < ApplicationController
  before_action :authenticate_user!

def create
  idea = Idea.find(params[:idea_id])
  @comment = current_user.comments.new(comment_params)
  @comment.idea = idea

  if @comment.save
    flash[:notice] = "You have added a comment!"
    redirect_to idea_path(idea)
  else
    redirect_to idea_path(idea)
    end
  end
end
