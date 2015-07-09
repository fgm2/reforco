class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.datetime :created_at
      t.belongs_to :user, index: true, foreign_key: true
      # t.references :areaOfKnowledge, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
