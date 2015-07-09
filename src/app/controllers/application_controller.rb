class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :date_of_birth, :is_famale, :cpf, :fone, :whatsapp, :skype, :addrress, :state, :country, :avatar) }
  end
  
  def require_admin
    # unless current_user && current_user.admin
    unless current_user.admin
      flash[:error] = "Acesso negado!!! Você não é um usuário administrador!!!"
      redirect_to root_path
    end
  end
end

