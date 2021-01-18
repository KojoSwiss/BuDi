class AddLocationToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :location, :string
  end
end
