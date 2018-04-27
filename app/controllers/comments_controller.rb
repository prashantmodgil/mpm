class CommentsController < ApplicationController
  before_action :authenticate_user!
   before_action :set_commentable
    def create
      debugger
        @comment = @commentable.comments.new comment_params
          @comment.user = current_user
          @comment.save
              redirect_to @commentable, notice: "Your comment was successfully posted."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    def set_commentable
      #if parasms[:account_id]

      #  @commentable = Team.find(params[:id])
      if params[:account_id].present?
        @commentable = Account.find(params[:account_id])
    end
end