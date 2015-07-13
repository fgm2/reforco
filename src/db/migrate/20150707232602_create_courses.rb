class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.belongs_to :teacher, index: true, foreign_key: true
      t.belongs_to :matter, index: true, foreign_key: true
      t.text :description
      t.float :value
      t.boolean :evaluation
      
      t.timestamps null: false
    end
  end
end
