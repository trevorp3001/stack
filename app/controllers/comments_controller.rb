class CommentsController < ApplicationController
	
	#add new comment to story
	def new
		#so not params [:id] and this would refer to a comment
		#we need to find the story id
		@story = Story.find(params[:story_id])

		#find the story and make a new comment on thant story
		@comment = @story.comments.new
	end

	#actually get the form data and create comment
	def create
		@story = Story.find(params[:story_id])

		@comment = @story.comments.new(comments_params)

		if @comment.save

			flash[:success] = "Youre comments in"
			redirect_to story_path(@story)
		
		else

			render "new"

		end


	end

	#lets make a shortcut for grabbing the form data
	def comments_params
		params.require(:comment).permit(:body)
	end
end
