class Matter < ActiveRecord::Base
  belongs_to :areaOfKnowledge
  # has_many :matter_teacher, :dependent => :destroy
  # has_many :teacher, :through => :matter_teacher
  
  RailsAdmin.config do |config|
    config.model "Matter" do
      label "Matéria" 
      label_plural "Matérias"
      configure :name do
          label 'Nome'
      end
      configure :descripition do
          label 'Descrição'
      end
      configure :areaOfKnowledge do
          label 'Área de conhecimento'
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
        field :descripition
        field :areaOfKnowledge
        field :created_at
        field :updated_at
      end
      edit do
        field :name
        field :descripition
        field :areaOfKnowledge
      end
    end
  end
end
