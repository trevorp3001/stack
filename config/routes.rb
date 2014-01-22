Stack::Application.routes.draw do
  
  #URLs for ActiveAdmin- it put its self in
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  #the routes file matches our URLs up with our controllers

  # i want to add in all the REST urls for the stories
  #eg index, show, new, create
  #edit, update, destroy
  resources :stories do
  	#This is called a nested resource
  	#basically meaning the  urls for comments are on the urls for strories
  	resources :comments

    #because routes are related to stories, ust like comments
    resources :votes
  end


  #lets add in a homepage
  root "stories#index"
end
