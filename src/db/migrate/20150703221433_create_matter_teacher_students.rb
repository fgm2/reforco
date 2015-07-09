class CreateMatterTeacherStudents < ActiveRecord::Migration
  def change
    create_table :matter_teacher_students do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :hours

      t.timestamps null: false
    end
  end
end
