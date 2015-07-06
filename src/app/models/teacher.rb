class Teacher < ActiveRecord::Base
    belongs_to :user
    validates_uniqueness_of :user_id, :message => "Você já é um professor"
#<<<<<<< HEAD
    has_many :matter_teacher, :dependent => :destroy
    has_many :matter, :through => :matter_teacher
#=======
    # has_many :matter_teacher
    # has_many :matter, :through => :matter_teacher
    
   
  
end
