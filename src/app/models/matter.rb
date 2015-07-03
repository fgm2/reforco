class Matter < ActiveRecord::Base
  belongs_to :areaOfKnowledge
  has_many :matter_teacher
  has_many :teacher, :through => :matter_teacher
end
