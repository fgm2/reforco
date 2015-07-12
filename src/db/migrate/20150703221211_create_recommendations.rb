class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.boolean :rating
      t.text :descripition
      t.references :course, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
