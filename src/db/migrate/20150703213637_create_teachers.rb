class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :formation
      t.string :university
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
