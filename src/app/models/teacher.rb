class Teacher < ActiveRecord::Base
    validates_presence_of :user_id
    validates_associated :user
    validates :formation, presence: true
    #validates :user, presence: true
    belongs_to :user
    # has_many :matter_teacher
    # has_many :matter, :through => :matter_teacher
    
    RailsAdmin.config do |config|
        config.model "Teacher" do
            label "Professor"
            label_plural "Professores"
            parent User
            configure :formation do
              label 'Formação'
            end
            configure :user do
              label 'Usuário'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            list do
              field :id
              field :user
              field :formation
              field :created_at
              field :updated_at
            end
        end
    end
  
end
