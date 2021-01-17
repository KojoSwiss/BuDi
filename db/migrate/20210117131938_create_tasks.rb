class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :desciption
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end
