class LangsController < ApplicationController
  before_action :set_lang, only: [:show, :edit, :update, :destroy]
  layout 'registration'
  skip_before_filter :verify_authenticity_token

  # GET /langs
  # GET /langs.json
  def index
    @langs = current_user.langs
  end

  # GET /langs/1
  # GET /langs/1.json
  def show
  end

  # GET /langs/new
  def new
    @lang = Lang.new
  end

  # GET /langs/1/edit
  def edit
  end

  # POST /langs
  # POST /langs.json
  def create
    @langs = current_user.langs
    @lang = Lang.new(lang_params)
    @lang.user = current_user

    respond_to do |format|
      if @lang.save
        format.html { redirect_to @lang, notice: 'Lang was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lang }
        format.js { flash.now[:notice] = 'Language was successfully added.' }
      else
        format.html { render action: 'index' }
        format.json { render json: @lang.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /langs/1
  # PATCH/PUT /langs/1.json
  def update
    respond_to do |format|
      if @lang.update(lang_params)
        format.html { redirect_to @lang, notice: 'Lang was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lang.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /langs/1
  # DELETE /langs/1.json
  def destroy
    @lang.destroy
    respond_to do |format|
      format.html { redirect_to langs_url, notice: 'Lang was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lang
    @lang = Lang.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lang_params
    params.require(:lang).permit(:language_id, :level)
  end
end
