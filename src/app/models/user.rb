class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :teachers, dependent: :destroy
  # has_many :students, dependent: :destroy
  has_attached_file :avatar, styles: {thumb: "150x150>",  medium: "300x300>"}#, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  RailsAdmin.config do |config|
        config.model "User" do
            navigation_label 'Básico'
            # visible do
            #     bindings[:controller].current_user.admin
            # end
            label "Usuário"
            label_plural "Usuários"
            configure :name do
              label 'Nome'
            end
            configure :email do
              label 'E-mail'
            end
            configure :scholarity do
              label 'Escolaridade'
            end
            configure :date_of_birth do
              label 'Data de Aniversário'
            end
            configure :addrress do
              label 'Endereço'
            end
            configure :state do
              label 'Estado'
            end
            configure :country do
              label 'País'
            end
            configure :password do
              label 'Senha'
            end
            configure :avatar do
              label 'Imagem do perfil'
            end
            configure :password_confirmation do
              label 'Confirmação de senha'
            end
            configure :created_at do
                label 'Criado em'
            end
            configure :updated_at do
                label 'Atualizado em'
            end
            configure :sign_in_count do
              label 'Quantidade de logins'
            end
            configure :current_sign_in_at do
              label 'Data do login corrente'
            end
            configure :last_sign_in_at do
              label 'Data do último login'
            end
            configure :current_sign_in_ip do
              label 'IP do login corrente'
            end
            configure :last_sign_in_ip do
              label 'IP do último login'
            end
            configure :reset_password_sent_at do
              label 'Redefinição de senha enviada em'
            end
            configure :remember_created_at do
              label 'Redefinição de senha criada em'
            end
            
            list do
              field :id
              field :name
              field :email
              field :created_at
              field :updated_at
            end
            edit do
              field :name
              field :email
              field :password
              field :password_confirmation
              field :avatar
              field :scholarity
              field :date_of_birth
              field :addrress
              field :state
              field :country
            end
        end
    end
end
