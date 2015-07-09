class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :teachers, dependent: :destroy#, inverse_of: :user
  has_many :students, dependent: :destroy
  has_attached_file :avatar, styles: { thumb: "150x150>", medium: "300x300#"}#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
         
   
    
end
   