class CreateCourseSubjectTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subject_tasks do |t|
      t.integer :course_subject_id
      t.integer :task_id

      t.timestamps
    end
  end
end
