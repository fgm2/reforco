class MatterTeacherStudent < ActiveRecord::Base
      belongs_to :course  # Course.exists?(:course =>self.course)
      belongs_to :student # Course.exists?(:student =>self.student)
    #   validates :course, uniqueness: {scope: :student, :message => " Prezado aluno, você já contratou este curso!"}

 
      RailsAdmin.config do |config|
        config.model "MatterTeacherStudent" do
            label "Aluno Matriculado"
            label_plural "Alunos Matriculados"
            
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
