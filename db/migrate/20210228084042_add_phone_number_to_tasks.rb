class AddPhoneNumberToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :phone_number, :integer
  end
end
