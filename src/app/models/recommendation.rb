class Recommendation < ActiveRecord::Base
    belongs_to :enrollment
    # validates :course, uniqueness: {scope: :student, :message => " Prezado aluno, você já recomendou este curso!" } 
    # validates :rating, inclusion: { in: %w(0 1), message: "%{value} não é válido! Informe 0 ou 1" }
 
    # validate :existCourse

      
    def existCourse
        # Course.where(":course_id => self.course AND :student_id => self.student")
        # Course.where(course_id: self.course, student_id: self.student)
        # Course.exists?(self.course)
        # Course.exists?(student_id: self.student)
    end
    
    RailsAdmin.config do |config|
        config.model "Recommendation" do
     
                label "Recomendação" 
                label_plural "Recomendações"
                
                configure :rating do
                    label 'Avaliação'
                end
                configure :description do
                    label 'Descrição'
                end
                configure :enrollment do
                    label 'Matricula'
                end
                configure :course_date do
                    label 'Data do Curso'
                end
                configure :created_at do
                    label 'Criado em'
                end
                configure :updated_at do
                    label 'Atualizado em'
                end
                list do
                    field :rating
                    field :description
                    field :enrollment
                    field :course_date
                    field :created_at
                    field :updated_at
                end
                edit do
                    field :rating
                    field :description
                    field :enrollment
                end
        end
    end
end
