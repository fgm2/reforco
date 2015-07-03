class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def add_role
    # emails = params[:email].split(/,\s*/)
    # role = Role.where(name: "XYZ")
    # emails.each do |email|
    #   user = User.where(email: email).first
    #   user.roles << role
    # end
    # redirect_to :back,  notice: "Added Role XYZ to the User emails specified"
  end
  
end
