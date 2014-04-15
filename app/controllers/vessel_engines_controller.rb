class VesselEnginesController < ApplicationController
  before_action :set_vessel_engine, only: [:show, :edit, :update, :destroy]

  # GET /vessel_engines
  # GET /vessel_engines.json
  def index
    @vessel_engines = VesselEngine.all
  end

  # GET /vessel_engines/1
  # GET /vessel_engines/1.json
  def show
  end

  # GET /vessel_engines/new
  def new
    @vessel_engine = VesselEngine.new
  end

  # GET /vessel_engines/1/edit
  def edit
  end

  # POST /vessel_engines
  # POST /vessel_engines.json
  def create
    @vessel_engine = VesselEngine.new(vessel_engine_params)

    respond_to do |format|
      if @vessel_engine.save
        format.html { redirect_to @vessel_engine, notice: 'Vessel engine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vessel_engine }
      else
        format.html { render action: 'new' }
        format.json { render json: @vessel_engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vessel_engines/1
  # PATCH/PUT /vessel_engines/1.json
  def update
    respond_to do |format|
      if @vessel_engine.update(vessel_engine_params)
        format.html { redirect_to @vessel_engine, notice: 'Vessel engine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vessel_engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vessel_engines/1
  # DELETE /vessel_engines/1.json
  def destroy
    @vessel_engine.destroy
    respond_to do |format|
      format.html { redirect_to vessel_engines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vessel_engine
      @vessel_engine = VesselEngine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vessel_engine_params
      params.require(:vessel_engine).permit(:name)
    end
end
