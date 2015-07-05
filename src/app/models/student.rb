class Student < ActiveRecord::Base
    validates :user, presence: true
    belongs_to :user
    # has_many :matter_teacher_student
    # has_many :matter_teacher, :through => :matter_teacher_student
    
    RailsAdmin.config do |config|
        config.model "Student" do
            label "Aluno"
            label_plural "Alunos"
            parent User
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
              field :created_at
              field :updated_at
            end
        end
    end
end
