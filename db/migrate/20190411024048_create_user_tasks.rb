class CreateUserTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :short_description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
