class MatterTeacher < ActiveRecord::Base
    belongs_to :matter
    belongs_to :teacher
    has_many :matter_teacher_student
    has_many :student, :through => :matter_teacher_student
end
