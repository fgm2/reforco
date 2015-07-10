class CreateMatterTeacherStudents < ActiveRecord::Migration
  def change
    create_table :matter_teacher_students do |t|
      t.references :course , index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.integer :hours

      t.timestamps null: false
    end
  end
end
