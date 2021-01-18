class AddTwUrlToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :Tw_url, :string
  end
end
