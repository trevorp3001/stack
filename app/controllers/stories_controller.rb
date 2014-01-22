class StoriesController < ApplicationController

	#before we run show edit destroy and update lets find the story were talking about
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	#controllers manage the urls, the data from the models and our html views

	def index
		@username = "trev"
		@now = Time.now

		# @stories = ["Google", "Facebook", "Twitter", "blinq"]

		#set the variable @stories to all the records in our database table
		#@stories = Story.order("votes_count desc, title asc, created_at desc")


		#if it has ?sort=recet in the url, then sort by created at, if it has nothing sort by popular ones

		if params[:sort] == "recent"
			#sort by created at
			@stories = Story.order("created_at desc")

		elsif params[:sort] == "featured"

			#sort by featured
			@stories = Story.where(is_featured: true)
							.order("id_featured desc, title asc")
				

		else
			#sort by popular
			@stories = Story.order("votes_count desc, title asc, created_at desc")
		end

		#add in my pagination
		#overwrite the @stories variabl with a paginated version
		@stories = @stories.page(params[:page]).per(20)


	end

	#this is the individual story page
	def show
		#params[:id] is the number in the url we are looking for
		#@story = Story.find(params[:id])
	end

	#this is the page for the new story
	def new

		#variable @story goes to view
		#Story.new comes from the model
		@story = Story.new

	end

	#this is where the form data from the new.html.erb view goes
	def create
		@story = Story.new(story_params)

		if @story.save

			#lets add a flash of content to tell the user we've added this
			flash[:success] = "You've added a link! yeeehaaa!!!!"

			#go back to homepage
			redirect_to root_path

		else
			render "new"



		end

	end

	#show the edit form
	def edit
		#@story = Story.find(params[:id])
	end

	#actually update the database
	def update
		#@story = Story.find(params[:id])

		if @story.update(story_params)

			flash[:success] = "you did it buddy"

			redirect_to story_path(@story)

		else

			render "edit"

		end
	end

	#actually destroy the record in the database
	def destroy
		#@story = Story.find(params[:id])

		@story.destroy

		flash[:success] = "its a goner"

		redirect_to root_path
	end

	#shortcut for getting form data
	def story_params
		params.require(:story).permit(:title, :description, :url, :tag_list)
	end

	#shortcut for finding the story from the url
	#find story is made by us not rails
	def find_story
		@story = Story.find(params[:id])
	end

end
