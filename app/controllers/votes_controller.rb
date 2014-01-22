class VotesController < ApplicationController

	#just create a vote
	#no need for a new.html.erb because it doesnt make that much sense
	def create

		#again, because were in Votes controller
		#the story id is found by params[:story_id]
		@story = Story.find(params[:story_id])

		#create instead of new because we dont need to worry about validations
		@vote = @story.votes.create

		flash[:success] = "You've voted"

		#redirect_to story_path(@story)

		if params[:back_to] == "home"
			#back to homepage
			redirect_to root_path
		else
			#go to the story page
			redirect_to story_path(@story)
		end
	end
end
