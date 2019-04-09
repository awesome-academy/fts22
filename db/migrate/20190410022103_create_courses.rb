class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :image
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
