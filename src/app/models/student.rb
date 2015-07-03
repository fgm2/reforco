class Student < ActiveRecord::Base
    validates :user, presence: true
    belongs_to :user
    has_many :matter_teacher_student
    has_many :matter_teacher, :through => :matter_teacher_student
end
