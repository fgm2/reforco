class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name
      t.text :descripition
      t.references :areaOfKnowledge, index: true, foreign_key: true
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
