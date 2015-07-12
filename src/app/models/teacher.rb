class Teacher < ActiveRecord::Base
    belongs_to :user #, inverse_of: :teacher
    validates_uniqueness_of :user_id, :message => "Você já é um professor"

    # has_many :matter_teacher, :dependent => :destroy
    # has_many :matter, :through => :matter_teacher
    # has_many :courses
    # accepts_nested_attributes_for :courses, 
                            #   reject_if: proc{ |attributes| attributes ['name'].blank?},
                            #   allow_destroy: true
    
    # has_many :matter_teacher
    # has_many :matter, :through => :matter_teacher
    
    RailsAdmin.config do |config|
        config.model "Teacher" do
            parent User
            label "Professor"
            label_plural "Professores"
            configure :user do
                label 'Usuário'
            end
            configure :formation do
                label 'Formação'
            end
            configure :description do
                label 'Descrição'
            end
            configure :university do
                label 'Universidade'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            list do
              fields :id do
                #   label do
                #       "#{label} (timestamp)"
                #   end
              end
              field :id
              field :user
              field :university
              field :formation
              field :created_at
              field :updated_at
            end
            edit do
              field :user do
                #   help 'selecione um usuário.'
              end
              field :formation
              field :university
              field :description
            end
        end
    end 
    
    def name
        if (!self.new_record?)
            self.user.name
        end
    end
   
end

