class MaritalsController < ApplicationController
  before_action :set_marital, only: [:show, :edit, :update, :destroy]

  # GET /maritals
  # GET /maritals.json
  def index
    @maritals = Marital.all
  end

  # GET /maritals/1
  # GET /maritals/1.json
  def show
  end

  # GET /maritals/new
  def new
    @marital = Marital.new
  end

  # GET /maritals/1/edit
  def edit
  end

  # POST /maritals
  # POST /maritals.json
  def create
    @marital = Marital.new(marital_params)

    respond_to do |format|
      if @marital.save
        format.html { redirect_to @marital, notice: 'Marital was successfully created.' }
        format.json { render action: 'show', status: :created, location: @marital }
      else
        format.html { render action: 'new' }
        format.json { render json: @marital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maritals/1
  # PATCH/PUT /maritals/1.json
  def update
    respond_to do |format|
      if @marital.update(marital_params)
        format.html { redirect_to @marital, notice: 'Marital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @marital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maritals/1
  # DELETE /maritals/1.json
  def destroy
    @marital.destroy
    respond_to do |format|
      format.html { redirect_to maritals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marital
      @marital = Marital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marital_params
      params.require(:marital).permit(:name)
    end
end
