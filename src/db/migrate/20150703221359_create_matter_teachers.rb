class CreateMatterTeachers < ActiveRecord::Migration
  def change
    create_table :matter_teachers do |t|
      t.references :matter, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
      t.float :value

      t.timestamps null: false
    end
  end
end
