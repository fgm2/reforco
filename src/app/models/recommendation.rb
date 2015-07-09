class Recommendation < ActiveRecord::Base
    
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
                list do
                    field :rating
                    field :descripition
                    field :created_at
                    field :updated_at
                end
                edit do
                    field :rating
                    field :descripition
                end
        end
    end
end
