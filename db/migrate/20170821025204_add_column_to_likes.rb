class AddColumnToLikes < ActiveRecord::Migration
  def change
  	add_column :likes, :user_id, :integer
  	add_column :likes, :status_id, :integer
  end
end
