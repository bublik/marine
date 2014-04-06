class EyesController < ApplicationController
  before_action :set_eye, only: [:show, :edit, :update, :destroy]

  # GET /eyes
  # GET /eyes.json
  def index
    @eyes = Eye.all
  end

  # GET /eyes/1
  # GET /eyes/1.json
  def show
  end

  # GET /eyes/new
  def new
    @eye = Eye.new
  end

  # GET /eyes/1/edit
  def edit
  end

  # POST /eyes
  # POST /eyes.json
  def create
    @eye = Eye.new(eye_params)

    respond_to do |format|
      if @eye.save
        format.html { redirect_to @eye, notice: 'Eye was successfully created.' }
        format.json { render action: 'show', status: :created, location: @eye }
      else
        format.html { render action: 'new' }
        format.json { render json: @eye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eyes/1
  # PATCH/PUT /eyes/1.json
  def update
    respond_to do |format|
      if @eye.update(eye_params)
        format.html { redirect_to @eye, notice: 'Eye was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @eye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eyes/1
  # DELETE /eyes/1.json
  def destroy
    @eye.destroy
    respond_to do |format|
      format.html { redirect_to eyes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eye
      @eye = Eye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eye_params
      params.require(:eye).permit(:name)
    end
end
