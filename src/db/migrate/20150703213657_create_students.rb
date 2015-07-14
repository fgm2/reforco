class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.datetime :created_at
      # t.references :areaOfKnowledge, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
