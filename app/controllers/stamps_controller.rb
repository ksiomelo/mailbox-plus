class StampsController < ApplicationController
  # GET /stamps
  # GET /stamps.json
  before_filter :authenticate_user!
  respond_to :html, :json
  
  EXPIRE_IN = 365 # days 
  

  def index
   
    if current_user.is? :admin
      @stamps = Stamp.order("created_at DESC")
      render "admin_index"
      return
    else
      @stamps = current_user.stamps.order("created_at DESC")
      render "index"
      return
    end

   
  end
  
  
  
  def batch_delete
     Stamp.delete(params[:stamp_ids])
     
     redirect_to stamps_url
  end
  
  
  def buy
    nat = params[:national_qte].to_i
    int = params[:international_qte].to_i
    
     @stamps = Stamp.where("user_id IS NULL").limit(nat+int)
     
     #@stamps.update_all( {:expires_at => EXPIRE_IN.days.from_now}, {:user_id => current_user.id} )
     
     puts "USER ID: "+ current_user.id.to_s
     
     @stamps.each do | stamp | 
       stamp.expires_at = EXPIRE_IN.days.from_now
       stamp.stamp_type = (nat > 0) ? "national" : "international"
       stamp.user_id = current_user.id
       stamp.save
       nat -= 1
     end
    
     # @products.each do |product|
    # product.update_attributes!(params[:product].reject { |k,v| v.blank? })
  # end
  # flash[:notice] = "Updated products!"
  end
  
  def batch_generate
    nat = params[:national_qte]
    int = params[:international_qte]
    
    @stamps = []
    0.upto(nat.to_i-1) { 
      @stamp = Stamp.new
      #@stamp.user = current_user
      #@stamp.expires_at = EXPIRE_IN.days.from_now #Date.new(Time.now.year+1, Time.now.month, Time.now.day)
      @stamp.stamp_type = "national"
      @stamp.save
      @stamps << @stamp
    }
    0.upto(int.to_i-1) { 
      @stamp = Stamp.new
      #@stamp.user = current_user
      #@stamp.expires_at = EXPIRE_IN.days.from_now #Date.new(Time.now.year+1, Time.now.month, Time.now.day)
      @stamp.stamp_type = "international"
      @stamp.save
      @stamps << @stamp
    }
    
    
    redirect_to stamps_url
    
    
    # respond_to do |format|
      # format.html # index.html.erb
      # format.json { render json: @stamps }
    # end
    
  end
  
  
  
  
  

  
end
