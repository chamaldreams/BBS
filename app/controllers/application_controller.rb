class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  skip_before_action :authenticate_user!, :only => [:index]

  
  before_action :configure_permitted_parameter , if: :devise_controller?

def configure_permitted_parameter
 
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name, :company_name, :telephone, :billing_address, :shipping])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_name, :telephone, :web, :billing_address, :shipping])
end

def after_sign_in_path_for(resource)

 dashboard_index_path

end	
  
end
