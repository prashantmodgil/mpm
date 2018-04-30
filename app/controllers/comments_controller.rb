class CommentsController < ApplicationController
  before_action :authenticate_user!
   before_action :set_commentable
    def create
        @comment = @commentable.comments.new comment_params
        @comment.user_id = current_user.id
        @comment.save
        redirect_to @commentable, notice: "Your comment was successfully posted."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    def set_commentable
      if params[:team_id].present?
       @commentable = Team.find(params[:team_id])
     elsif params[:account_id].present?
        @commentable = Account.find(params[:account_id])
    end
end
