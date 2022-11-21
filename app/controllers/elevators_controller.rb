class ElevatorsController < ApplicationController
  require 'slack-ruby-client'
  require 'slack-incoming-webhooks'
  require 'slack-notifier'
  require 'rubygems'
  require 'twilio-ruby'
  # before_save :Twilio, if: :elevator_status_changed?
  before_action :set_elevator, only: %i[ show edit update destroy ]
  before_save :do_something, if: :elevator_status_changed?

  # GET /elevators or /elevators.json
  def index
    @elevators = Elevator.all
  end

  # GET /elevators/1 or /elevators/1.json
  def show
  end

  # GET /elevators/new
  def new
    @elevator = Elevator.new
  end

  # GET /elevators/1/edit
  def edit
  end

  # POST /elevators or /elevators.json
  def create
    @elevator = Elevator.new(elevator_params)

    respond_to do |format|
      if @elevator.save
        format.html { redirect_to elevator_url(@elevator), notice: "Elevator was successfully created." }
        format.json { render :show, status: :created, location: @elevator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elevators/1 or /elevators/1.json
  def update
    respond_to do |format|
      if @elevator.update(elevator_params)
        format.html { redirect_to elevator_url(@elevator), notice: "Elevator was successfully updated." }
        format.json { render :show, status: :ok, location: @elevator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elevators/1 or /elevators/1.json
  def destroy
    @elevator.destroy

    respond_to do |format|
      format.html { redirect_to elevators_url, notice: "Elevator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elevator
      @elevator = Elevator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def elevator_params
      params.require(:elevator).permit(:columnID, :serialNumber, :model, :elevatorType, :status, :commissioningDate, :lastInspection, :inspectionCertificate, :information, :notes)
    end
  end

  # def Twilio
  #   if @elevator_status_changed = 'intervention' then 

  #     account_sid = 'AC213db6283cce81b392d3b0c11c28af36'
  #     auth_token = 'f28d27a834907b1426c79aadf95cb519'
  #     @client = Twilio::REST::Client.new(account_sid, auth_token)

  #     message = @client.messages.create(
  #       to: '+15142366192',
  #       from: '+12183046140',
  #       body: 'Elevator needs technical intervention'
  #     )
  #   end
  # end
