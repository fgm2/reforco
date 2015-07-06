class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#<<<<<<< HEAD
   # has_one :teacher , dependent: :destroy 
    #exithas_one :student, dependent: :destroy     
#=======
         
    has_many :teacher
    has_many :student, dependent: :destroy
    
end
   