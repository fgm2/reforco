class AddFormationToStudents < ActiveRecord::Migration
  def change
    add_column :students, :formation, :text
  end
end
