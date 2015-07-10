class Student < ActiveRecord::Base
        belongs_to :user
        validates_uniqueness_of :user_id, :message => "Você já é um estudante"
        # has_many :AreaOfKnowledge
    
    # accepts_nested_attributes_for :AreaOfKnowledge, 
    #                              reject_if: proc{ |attributes| attributes ['name'].blank?},
    #                              allow_destroy: true
    
    RailsAdmin.config do |config|
        config.model "Student" do
            label "Aluno"
            label_plural "Alunos"
            parent User
            configure :user do
              label 'Usuário'
            end
            configure :description do
                label 'Descrição'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            edit do
              field :user
              field :description
            #   field :areaOfKnowledge
            end
            list do
              field :id
              field :user
              field :created_at
              field :updated_at
            end
        end
    end
    
    def name
        if (!self.new_record?)
            self.user.name
        end
    end
end
