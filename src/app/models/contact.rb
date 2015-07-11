class Contact < ActiveRecord::Base
    
    RailsAdmin.config do |config|
        config.model "Contact" do
            label "Contato"
            label_plural "Contatos"
            configure :name do
                label 'Nome'
            end
            configure :email do
                label 'E-mail'
            end
            configure :subject do
                label 'Assunto'
            end
            configure :message do
                label 'Mensagem'
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
              field :email
              field :subject
              field :message
              field :created_at
              field :updated_at
            end
            edit do
              field :name
              field :email
              field :subject
              field :message
            end
        end
    end 
end
