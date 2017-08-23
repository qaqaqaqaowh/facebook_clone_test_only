class AddColumnToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :user_id, :integer
  	add_column :statuses, :title, :string
  	add_column :statuses, :content, :string
  end
end
