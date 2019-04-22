class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.integer :course_id
      t.integer :subject_id
      t.integer :status, default: 0
      t.date :start_date
      t.integer :working_day

      t.timestamps
    end
  end
end
