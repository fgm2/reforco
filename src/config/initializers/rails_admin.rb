RailsAdmin.config do |config|
  
  config.main_app_name = ["Reforço", "MPROF"]
  config.main_app_name = Proc.new { |controller| [ "Reforço", "MPROF - #{controller.params[:action].try(:titleize)}" ] }

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
  
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  
end