class Teacher < ActiveRecord::Base
    belongs_to :user
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
    
   RailsAdmin.config do |config|
        config.model "Teacher" do
            parent User
            label "Professor"
            label_plural "Professores"
            configure :formation do
                label 'Formação'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
        end
    end 
  
end
