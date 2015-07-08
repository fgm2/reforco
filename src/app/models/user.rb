class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :teachers, dependent: :destroy
  # has_many :students, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>"}#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
         
  RailsAdmin.config do |config|
        config.model "User" do
            label "Usuário"
            label_plural "Usuários"
            configure :name do
              label 'Nome'
            end
            configure :email do
              label 'E-mail'
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
              field :created_at
              field :updated_at
            end
        end
    end
end