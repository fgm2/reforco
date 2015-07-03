class MatterTeacherStudent < ActiveRecord::Base
      belongs_to :matter_teacher
      belongs_to :student
end
