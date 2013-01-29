class MailboxesController < ApplicationController
  
  before_filter :authenticate_user!
  
  
  # GET /mailboxes
  # GET /mailboxes.json
  def index
    @mailboxes = current_user.mailboxes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailboxes }
    end
  end

  # GET /mailboxes/1
  # GET /mailboxes/1.json
  def show
    @mailbox = Mailbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mailbox }
    end
  end

  # GET /mailboxes/new
  # GET /mailboxes/new.json
  def new
    @mailbox = Mailbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailbox }
    end
  end
  
  def edit
    @mailbox = Mailbox.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailbox }
    end
  end


  # POST /mailboxes
  # POST /mailboxes.json
  def create
    @mailbox = Mailbox.new(params[:mailbox])
    @mailbox.user = current_user

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to @mailbox, notice: 'Mailbox was successfully created.' }
        format.json { render json: @mailbox, status: :created, location: @mailbox }
      else
        format.html { render action: "new" }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /mailboxes/1
  # DELETE /mailboxes/1.json
  def destroy
    @mailbox = Mailbox.find(params[:id])
    @mailbox.destroy

    respond_to do |format|
      format.html { redirect_to mailboxes_url }
      format.json { head :no_content }
    end
  end
  
  
  
  def community
    @mailboxes = current_user.mailboxes
  end
  
  def nearby
    @mailbox = Mailbox.find(params[:id])
    distance_in_miles = (params[:distance]) ? params[:distance].to_f * 0.62137 : 0.62137
    @search = {}
    @search[:radius] = params[:distance] || 1
    @search[:latitude] = @mailbox.latitude
    @search[:longitude] = @mailbox.longitude
    
    if @mailbox.geocoded?
      @nearby = @mailbox.nearbys(distance_in_miles)                      
    end
    
    respond_to do |format|
      format.json
    end
    
    
  end
  
  

  
  
  
end
