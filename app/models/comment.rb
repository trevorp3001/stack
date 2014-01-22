require 'obscenity/active_model'

class Comment < ActiveRecord::Base

	#a comment belongs to a story
	#this is an opposite assosiation
	belongs_to :story

	#validations
	validates :body, length: {minimum: 20}, obscenity: true

end
