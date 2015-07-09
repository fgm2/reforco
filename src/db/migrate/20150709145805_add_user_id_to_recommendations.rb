class AddUserIdToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :user_id, :integer
  end
end
