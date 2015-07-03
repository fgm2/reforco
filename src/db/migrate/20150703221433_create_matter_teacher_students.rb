class CreateMatterTeacherStudents < ActiveRecord::Migration
  def change
    create_table :matter_teacher_students do |t|
      t.integer :matter_id
      t.integer :student_id
      t.integer :teacher_id
      t.integer :many

      t.timestamps null: false
    end
  end
end
