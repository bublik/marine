class VesselCountryCodesController < ApplicationController
  before_action :set_vessel_country_code, only: [:show, :edit, :update, :destroy]

  # GET /vessel_country_codes
  # GET /vessel_country_codes.json
  def index
    @vessel_country_codes = VesselCountryCode.all
  end

  # GET /vessel_country_codes/1
  # GET /vessel_country_codes/1.json
  def show
  end

  # GET /vessel_country_codes/new
  def new
    @vessel_country_code = VesselCountryCode.new
  end

  # GET /vessel_country_codes/1/edit
  def edit
  end

  # POST /vessel_country_codes
  # POST /vessel_country_codes.json
  def create
    @vessel_country_code = VesselCountryCode.new(vessel_country_code_params)

    respond_to do |format|
      if @vessel_country_code.save
        format.html { redirect_to @vessel_country_code, notice: 'Vessel country code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vessel_country_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @vessel_country_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vessel_country_codes/1
  # PATCH/PUT /vessel_country_codes/1.json
  def update
    respond_to do |format|
      if @vessel_country_code.update(vessel_country_code_params)
        format.html { redirect_to @vessel_country_code, notice: 'Vessel country code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vessel_country_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vessel_country_codes/1
  # DELETE /vessel_country_codes/1.json
  def destroy
    @vessel_country_code.destroy
    respond_to do |format|
      format.html { redirect_to vessel_country_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vessel_country_code
      @vessel_country_code = VesselCountryCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vessel_country_code_params
      params.require(:vessel_country_code).permit(:code, :name)
    end
end
