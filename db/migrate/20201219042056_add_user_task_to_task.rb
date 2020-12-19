class AddUserTaskToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_task, :string
    add_reference :tasks, :user, foreign_key: true
  end
end
