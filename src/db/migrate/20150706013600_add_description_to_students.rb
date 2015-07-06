class AddDescriptionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :description, :text
  end
end
