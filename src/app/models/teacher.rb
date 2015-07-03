class Teacher < ActiveRecord::Base
    validates_presence_of :user_id
    validates_associated :user
    validates :formation, presence: true
    #validates :user, presence: true
    belongs_to :user
    has_many :matter_teacher
    has_many :matter, :through => :matter_teacher
  
end
