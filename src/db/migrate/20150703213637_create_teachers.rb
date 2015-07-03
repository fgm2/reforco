class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :formation
      t.datetime :created_at
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
