class HistoriesController < ApplicationController
  before_action :set_history, only: %i[ show edit update destroy ]
  before_action :set_pet
  before_action :set_client

  # GET /histories or /histories.json
  def index
    @client = Client.find(params[:client_id])
    @pet = @client.pets.find(params[:pet_id])
    @histories = @pet.histories
  end

  # GET /histories/1 or /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @history = @pet.histories.build
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories or /histories.json
  def create
    @client = Client.find(params[:client_id])
    @pet = @client.pets.find(params[:pet_id])
    @history = @pet.histories.build(history_params)
    @history.pet = @pet

    respond_to do |format|
      if @history.save
        format.html { redirect_to [@client, @pet, @history], notice: "History was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1 or /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params.merge(pet: @pet))
        format.html { redirect_to [@client, @pet, @history], notice: "History was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1 or /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to [@client, @pet, @history], notice: "History was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def client
      @client = Client.find(params[:client_id])
    end

    # Only allow a list of trusted parameters through.
    def history_params
      params.require(:history).permit(:date, :weight, :height, :description)
    end
end
