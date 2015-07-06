class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy
#<<<<<<< HEAD
   # has_one :teacher , dependent: :destroy 
    #exithas_one :student, dependent: :destroy     
#=======
         
   
    
end
   