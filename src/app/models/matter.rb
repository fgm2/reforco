class Matter < ActiveRecord::Base
  belongs_to :areaOfKnowledge
  has_many :matter_teacher, :dependent => :destroy
  has_many :teacher, :through => :matter_teacher
  
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
    end
  end
end
