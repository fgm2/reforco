class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :teacher
    has_many :student, dependent: :destroy
    
    
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
        configure :password do
          label 'Senha'
        end
        edit do
          field :name
          field :email
          field :password
          field :password_confirmation
        end
        list do
          field :id
          field :name
          field :email
          field :password
        end
      end
    end
end
