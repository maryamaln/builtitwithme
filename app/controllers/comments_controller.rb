class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_parameters)
		@comment.user_id = cookies[:user_id]
		if @comment.save
			 redirect_to "/ideas/#{params[:comment][:idea_id]}"
		else
			redirect_to "/"
		end
	end
	private
    def comment_parameters
      params.require(:comment).permit(:body, :idea_id)
    end
end
