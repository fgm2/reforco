class AddTeacherIdToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :teacher_id, :integer
  end
end
