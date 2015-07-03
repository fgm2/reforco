class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :rating
      t.text :descripition
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
