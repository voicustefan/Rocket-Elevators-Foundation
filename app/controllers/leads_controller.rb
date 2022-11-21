class LeadsController < ApplicationController
  require 'sendgrid-ruby'
  require 'net/http'
  require 'uri'
  require 'json'
  require 'rest_client'
  
  include SendGrid

  before_action :set_lead, only: %i[ show edit update destroy ]

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(contact_params)
    #@lead.full_name = params[:full_name]
    #@lead.company_name = params[:company_name]
    #@lead.email = params[:email]
    #@lead.phone = params[:phone]
    #@lead.project_name = params[:project_name]
    #@lead.project_description = params[:project_description]
    #@lead.department = params[:department]
    #@lead.message = params[:message]
    #@lead.attached_file = params[:attached_file]
    #@lead.date = params[:date]
    # @lead.contact_name = params[:full_name]
    # @lead.company_name = params[:company_name]
    # @lead.email = params[:email]
    # @lead.phone = params[:phone]
    # @lead.project_name = params[:project_name]
    # @lead.project_description = params[:project_description]
    # @lead.department = params[:department]
    # @lead.message = params[:message]
    # @lead.image = params[:image]
    # @lead.date = params[:date]
    # @lead = Lead.new(contact_params)
    @lead = Lead.new(params.permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :attached_file))
    if @lead.attached_file.attached?
      puts "FILE ATTACHED??????????"
      puts @lead.attached_file.attached?
      dbx = DropboxApi::Client.new("sl.BS4YbxnpKOLZOZhpuQgI9-0njGUSmurKiMBOucoFKd5flJLJq0uOH7JYI1nVOrDO_0vU8HF4rwKusoKs1xDkXGJQhgkdRVcVUdNz7RrzAwkig02VothfnROQ_j3GDQZH0iZKGZFNy676")
      puts "-------------------------"
      puts "AUTHENTICATED"
      folder_name = dbx.create_folder("/#{@lead.full_name}")
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts "FOLDER CREATED"
      file_path = ActiveStorage::Blob.service.path_for(@lead.attached_file.key)
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^" 
      puts file_path
      new_filename = "#{@lead.project_name.parameterize}/#{@lead.attached_file.filename.to_s}"
      puts "*************************"
      puts new_filename
      dbx.upload(file_path, "/#{new_filename}")
      puts '$$$$$$$$$$$$$$$$$$$$$$$$$'
      puts 'FILE IN DROPBOXX'
    end

    respond_to do |format|
      if @lead.save
        format.html { redirect_to leads_url(@lead), notice: "Lead was successfully created." }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end

    end
     
       

    

    
        from = Email.new(email:'adityamenonchef@gmail.com')
        to = Email.new(email: contact_params[:email])
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: "Greetings #{@lead.full_name}
        We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{@lead.project_name}.
        A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
        We’ll Talk soon
        The Rocket Team
        ")
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
     

        
    
    
      # # # creates a ticket
          data  = {
          status: 2, 
          priority: 1,
          subject: "#{@lead.project_name}",
          email: "#{@lead.email}",
          description: " name: #{@lead.full_name} , " + " company name:#{@lead.company_name} , " + " phone number: #{ @lead.phone} , " + " project description: #{@lead.project_description} , " + " message: #{ @lead.message} "
        }
    
        data_json = JSON.generate(data)
      
       
          
        request = RestClient::Request.execute(
          method: :post,
          url: 'https://rocketel-help.freshdesk.com/api/v2/tickets',
          user: "QYhX1ws5jwdE8iefaPPW",
          password: 'X',
          payload: data_json,
          headers: {"Content-Type" => 'application/json'}
        )
       
        
        
      

  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      # params.require(:leads).permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :attached_file)
      params.permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :attached_file)
      params.require(:leads).permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :image, :date)
    end
  end

  # using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby

# from = Email.new(email: 'test@example.com')
# to = Email.new(email: 'test@example.com')
# subject = 'Sending with SendGrid is Fun'
# content = Content.new(type: 'text/plain', value: 'Greetings [Full Name]
# We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project [Project Name].
# A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
# We’ll Talk soon
# The Rocket Team
# ')
# mail = Mail.new(from, subject, to, content)

# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
# response = sg.client.mail._('send').post(request_body: mail.to_json)
# puts response.status_code
# puts response.body
# puts response.headers


 
