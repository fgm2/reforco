class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :rating
      t.text :description
      t.references :enrollment, index: true, foreign_key: true
      t.datetime :course_date
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
