class Course < ActiveRecord::Base
    
    belongs_to :matter
    belongs_to :teacher
  
  RailsAdmin.config do |config|
        config.model "Course" do
            label "Curso Oferecido"
            label_plural "Cursos Oferecidos"
            
            configure :name do
              label 'Nome'
            end
            configure :matter do
              label 'Disciplina'
            end
            configure :teacher do
                label 'Professor'
            end
            configure :value do
                label 'Valor por Hora'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            list do
              field :id
              field :name
              field :matter
              field :teacher
              field :value
              field :created_at
              field :updated_at
            end
            edit do
              field :name
              field :matter
              field :teacher
              field :value
            end
        end
    end
end
