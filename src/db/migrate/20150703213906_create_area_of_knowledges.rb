class CreateAreaOfKnowledges < ActiveRecord::Migration
  def change
    create_table :area_of_knowledges do |t|
      t.string :name
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
