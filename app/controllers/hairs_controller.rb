class HairsController < ApplicationController
  before_action :set_hair, only: [:show, :edit, :update, :destroy]

  # GET /hairs
  # GET /hairs.json
  def index
    @hairs = Hair.all
  end

  # GET /hairs/1
  # GET /hairs/1.json
  def show
  end

  # GET /hairs/new
  def new
    @hair = Hair.new
  end

  # GET /hairs/1/edit
  def edit
  end

  # POST /hairs
  # POST /hairs.json
  def create
    @hair = Hair.new(hair_params)

    respond_to do |format|
      if @hair.save
        format.html { redirect_to @hair, notice: 'Hair was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hair }
      else
        format.html { render action: 'new' }
        format.json { render json: @hair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairs/1
  # PATCH/PUT /hairs/1.json
  def update
    respond_to do |format|
      if @hair.update(hair_params)
        format.html { redirect_to @hair, notice: 'Hair was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairs/1
  # DELETE /hairs/1.json
  def destroy
    @hair.destroy
    respond_to do |format|
      format.html { redirect_to hairs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hair
      @hair = Hair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hair_params
      params.require(:hair).permit(:color)
    end
end
