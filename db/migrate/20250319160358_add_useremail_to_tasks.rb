class AddUseremailToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :user_email, :string
  end
end
