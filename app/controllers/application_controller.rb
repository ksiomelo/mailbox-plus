class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path# (resource.role? :admin) ? root_path : inscriptions_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      "application_offline"
    else
      "application"
    end
  end
  
  
end
