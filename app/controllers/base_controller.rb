class BaseController < ApplicationController
  #layout "application_offline"


  before_filter :authenticate_user!
  
  def index
    if current_user.is? :admin
      redirect_to stamps_url
    else
      redirect_to messages_url
    end
  end


end
