class Recommendation < ActiveRecord::Base
    belongs_to :user
    belongs_to :teacher
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
                configure :created_at do
                    label 'Criado em'
                end
                configure :updated_at do
                    label 'Atualizado em'
                end
        end
    end
end
