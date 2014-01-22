class Story < ActiveRecord::Base

	#this is an assosiation in rails
	#our story has many comments AND has many votes
	has_many :comments
	has_many :votes

	validates :title, length: { minimum: 5}
	validates :description, presence: true
	validates :url, presence: true, uniqueness: { message: "Has already been submitted"}


	#I want to overwrite the urls in ActiveRecord
	#active record is the rails way to manage models
	#to_param is the method we want to overwrite

	def to_param
		"#{id}-#{title.parameterize}"
	end

	#this is my own short cut to make nice clean urls for our users
	def nice_url
		#i want to take url
		#and to remove http://
		#and to remove www.
		url.gsub("http://", "").gsub("www.", "")
	end

end
