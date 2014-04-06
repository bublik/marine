class OverallsizesController < ApplicationController
  before_action :set_overallsize, only: [:show, :edit, :update, :destroy]

  # GET /overallsizes
  # GET /overallsizes.json
  def index
    @overallsizes = Overallsize.all
  end

  # GET /overallsizes/1
  # GET /overallsizes/1.json
  def show
  end

  # GET /overallsizes/new
  def new
    @overallsize = Overallsize.new
  end

  # GET /overallsizes/1/edit
  def edit
  end

  # POST /overallsizes
  # POST /overallsizes.json
  def create
    @overallsize = Overallsize.new(overallsize_params)

    respond_to do |format|
      if @overallsize.save
        format.html { redirect_to @overallsize, notice: 'Overallsize was successfully created.' }
        format.json { render action: 'show', status: :created, location: @overallsize }
      else
        format.html { render action: 'new' }
        format.json { render json: @overallsize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overallsizes/1
  # PATCH/PUT /overallsizes/1.json
  def update
    respond_to do |format|
      if @overallsize.update(overallsize_params)
        format.html { redirect_to @overallsize, notice: 'Overallsize was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @overallsize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overallsizes/1
  # DELETE /overallsizes/1.json
  def destroy
    @overallsize.destroy
    respond_to do |format|
      format.html { redirect_to overallsizes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overallsize
      @overallsize = Overallsize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overallsize_params
      params.require(:overallsize).permit(:overall_size)
    end
end
