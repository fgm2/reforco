RailsAdmin.config do |config|
  
  config.main_app_name = ["Reforço", "admin"]
  config.main_app_name = Proc.new { |controller| [ "Reforço", "admin - #{controller.params[:action].try(:titleize)}" ] }

   config.actions do
    dashboard
    index
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app
    #history_index
    #history_show
  end
  
   # config.authenticate_with do
   #   warden.authenticate! scope: :user
   # end
   # config.current_user_method(&:current_user)
  
   config.authenticate_with do 
     warden.authenticate! scope: :user
     unless current_user.try(:admin?)
       flash[:error] = "Acesso negado!!! Você não é um usuário administrador!!!"
       redirect_to main_app.root_path
     end
     config.current_user_method(&:current_user)
   end
  
end
