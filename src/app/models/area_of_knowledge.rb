class AreaOfKnowledge < ActiveRecord::Base
    # has_many :matter
    
    RailsAdmin.config do |config|
        config.model "AreaOfKnowledge" do
            label "Area de Conhecimento" 
            label_plural "Areas de Conhecimentos"
            configure :name do
                label 'Nome'
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
