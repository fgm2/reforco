class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student
  
  RailsAdmin.config do |config|
      config.model "Enrollment" do
          label "Matricula"
          label_plural "Matriculas"
          
          # configure :preview do
          #     formatted_value do
          #         bindings[:hours]
          #     end
          # end
          configure :course do
              label 'Curso'
          end
          configure :student do
            label 'Aluno'
          end
          configure :hours do
              label 'Quantidade de Horas'
          end
          configure :evaluation do
              label 'Curso Avaliado'
          end
          configure :created_at do
              label 'Criado em'
          end
          configure :updated_at do
              label 'Atualizado em'
          end
          list do
            field :id
            field :course
            field :student
            field :hours
            field :evaluation
          #   field :preview
            field :created_at
            field :updated_at
          end
          edit do
            field :course
            field :student
            field :hours
          end
      end
  end
  def name
      if (!self.new_record?)
          self.course.name
      end
  end
    
end
