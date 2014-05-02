class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  layout 'registration'

  # GET /certificates
  # GET /certificates.json
  def index
    @certificates = Certificate.all
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
    @certs = params[:category].present? ? Cert.by_category(params[:category]) : Cert.all

    @certificate = Certificate.new()
    @certificate.cert = Cert.find_by_id(params[:cert_id]) || Cert.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  # GET /certificates/1/edit
  def edit
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  # POST /certificates
  # POST /certificates.json
  def create
    @certificate = Certificate.new(certificate_params)
    @certificate.cert ||= Cert.new
    @certificate.user = current_user

    @certs = Cert.all
    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @certificate, notice: 'Certificate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @certificate }
      else
        format.html { render action: 'new' }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to @certificate, notice: 'Certificate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to certificates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find(params[:id])
      @certs = Cert.by_category(@certificate.cert.category)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_params
      params.require(:certificate).permit(:cert_id, :country_id, :is_flag, :issuer, :from_date, :to_date, :is_unlimited, :licence_number)
    end
end
