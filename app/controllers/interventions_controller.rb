class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
    @customers = Customer.all
    @buildings = []
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
     
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    # # # creates a ticket
    data  = {
      status: 2, 
      priority: 1,
      subject: "Incident",
      email: 'allo@hotmail.com',
      description: " Requester: #{@intervention.Author} , " + " Customer: #{@intervention.CustomerID} , " + " Building ID: #{ @intervention.BuildingID} , " + " Battery ID: #{@intervention.BatteryID} , " + " Column ID: #{ @intervention.ColumnID} " + " Elevator ID: #{ @intervention.ElevatorID} , " + " Employee: #{@intervention.EmployeeID} , " + " Report: #{ @intervention.Report} "
    }

    data_json = JSON.generate(data)
  
   
      
    request = RestClient::Request.execute(
      method: :post,
      url: 'https://rockets-help.freshdesk.com/api/v2/tickets',
      user: 'HmvDUJ4UJMl5GwnzVQR',
      password: 'X',
      payload: data_json,
      headers: {"Content-Type" => 'application/json'}
    )
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.permit(:Author, :CustomerID, :BuildingID, :BatteryID, :ColumnID, :ElevatorID, :EmployeeID, :Result, :Report, :Status)
    end
end
