class Student < ActiveRecord::Base
        belongs_to :user
        validates_uniqueness_of :user_id, :message => "Você já é um estudante"
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
