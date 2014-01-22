class AddCountersToStories < ActiveRecord::Migration
  def change

  	add_column :stories, :votes_count, :integer
  	add_column :stories, :comments_count, :integer
  	add_column :stories, :is_featured, :boolean, default: false

  end
end
