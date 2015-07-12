class Recommendation < ActiveRecord::Base
    belongs_to :course
    belongs_to :student
    validates :course, uniqueness: {scope: :student, :message => " Prezado aluno, você já recomendou este curso!" } 
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
                configure :descripition do
                    label 'Descrição'
                end
                configure :course do
                    label 'Aula'
                end
                configure :student do
                    label 'Aluno'
                end
                configure :created_at do
                    label 'Criado em'
                end
                configure :updated_at do
                    label 'Atualizado em'
                end
                list do
                    field :rating
                    field :descripition
                    field :course
                    field :student
                    field :created_at
                    field :updated_at
                end
                edit do
                    field :rating
                    field :descripition
                    field :course
                    field :student
                end
        end
    end
end
