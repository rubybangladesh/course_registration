class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :course_title
      t.decimal :credit, precision: 3, scale: 2
      t.timestamps null: false
    end
  end
end
