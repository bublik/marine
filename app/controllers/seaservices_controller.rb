class SeaservicesController < ApplicationController
  before_action :set_seaservice, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  layout 'registration'

  # GET /seaservices
  # GET /seaservices.json
  def index
    @seaservices = current_user.seaservices
    if @seaservices.blank?
      @seaservice =  Seaservice.new
    end
  end

  # GET /seaservices/1
  # GET /seaservices/1.json
  def show
  end

  # GET /seaservices/new
  def new
    @seaservice = Seaservice.new
  end

  # GET /seaservices/1/edit
  def edit
  end

  # POST /seaservices
  # POST /seaservices.json
  def create
    @seaservice = Seaservice.new(seaservice_params)
    @seaservice.user = current_user

    respond_to do |format|
      if @seaservice.save
        format.html { redirect_to @seaservice, notice: 'Seaservice was successfully created.' }
        format.json { redirect_to seaservices_path, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @seaservice.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /seaservices/1
  # PATCH/PUT /seaservices/1.json
  def update
    respond_to do |format|
      if @seaservice.update(seaservice_params)
        format.html { redirect_to @seaservice, notice: 'Seaservice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @seaservice.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /seaservices/1
  # DELETE /seaservices/1.json
  def destroy
    @seaservice.destroy
    respond_to do |format|
      format.html { redirect_to seaservices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seaservice
      @seaservice = Seaservice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seaservice_params
      params.require(:seaservice).permit(:vessel_name, :vessel_country_code_id, :vessel_year, :vessel_type_id, :vessel_dwt, :vessel_engine_id, :vessel_engine_model, :vessel_engine_power, :rank_id, :on_date, :off_date, :owner_name, :agent_name)
    end
end
