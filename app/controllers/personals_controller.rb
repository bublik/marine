class PersonalsController < ApplicationController
  before_action :set_personal, only: [:show, :edit, :update, :destroy]
  layout 'registration'

  # GET /personals
  # GET /personals.json
  def index
    @personals = Personal.all
  end

  # GET /personals/1
  # GET /personals/1.json
  def show
  end

  # GET /personals/new
  def new
    @personal = current_user.personal || Personal.new
  end

  # GET /personals/1/edit
  def edit
  end

  # POST /personals
  # POST /personals.json
  def create
    @personal = Personal.new(personal_params)
    @personal.user = current_user

    respond_to do |format|
      if @personal.save
        format.html { redirect_to new_contact_path, notice: 'Personal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @personal }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
        format.js { }
      end
    end
  end

  # PATCH/PUT /personals/1
  # PATCH/PUT /personals/1.json
  def update
    respond_to do |format|
      if @personal.update(personal_params)
        format.html { redirect_to @personal, notice: 'Personal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /personals/1
  # DELETE /personals/1.json
  def destroy
    @personal.destroy
    respond_to do |format|
      format.html { redirect_to personals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal
      @personal = Personal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_params
      params.require(:personal).permit(:available_from, :required_position, :rank_id, :salary, :photo, :surname, :name, :middle_name,
                                       :pp_dob, :pp_pob, :country_id, :citizenship_id, :marital_id, :sex, :eye_id, :hair_id, :height_id, :weight_id, :overallsize_id, :shoe_id, :taxation_id_code, :note)
    end
end
