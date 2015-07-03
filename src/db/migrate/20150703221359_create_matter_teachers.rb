class CreateMatterTeachers < ActiveRecord::Migration
  def change
    create_table :matter_teachers do |t|
      t.integer :matter_id
      t.integer :teacher_id
      t.float :value

      t.timestamps null: false
    end
  end
end
