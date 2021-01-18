class AddIgUrlToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :Ig_url, :string
  end
end
