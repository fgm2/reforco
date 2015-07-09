class Teacher < ActiveRecord::Base
    belongs_to :user#, inverse_of: :teacher
    validates_uniqueness_of :user_id, :message => "Você já é um professor"
#<<<<<<< HEAD
    has_many :matter_teacher, :dependent => :destroy
    has_many :matter, :through => :matter_teacher
    has_many :courses
    accepts_nested_attributes_for :courses, 
                                 reject_if: proc{ |attributes| attributes ['name'].blank?},
                                 allow_destroy: true
#=======
    # has_many :matter_teacher
    # has_many :matter, :through => :matter_teacher
    
   
  
end
