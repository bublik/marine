class AgencySubscriptionsController < ApplicationController
  before_action :set_agency_subscription, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /agency_subscriptions
  # GET /agency_subscriptions.json
  def index
    @agency_subscriptions = AgencySubscription.all.page(params[:page]).per(10)
  end

  # GET /agency_subscriptions/1
  # GET /agency_subscriptions/1.json
  def show
  end

  # GET /agency_subscriptions/new
  def new
    @agency_subscription = AgencySubscription.new
  end

  # GET /agency_subscriptions/1/edit
  def edit
  end

  # POST /agency_subscriptions
  # POST /agency_subscriptions.json
  def create
    @agency_subscription = AgencySubscription.new(agency_subscription_params)

    respond_to do |format|
      if @agency_subscription.save
        format.html { redirect_to agency_subscriptions_path, notice: 'Agency subscription was successfully created.' }
        format.json { render :show, status: :created, location: @agency_subscription }
      else
        format.html { render :new }
        format.json { render json: @agency_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agency_subscriptions/1
  # PATCH/PUT /agency_subscriptions/1.json
  def update
    respond_to do |format|
      if @agency_subscription.update(agency_subscription_params)
        format.html { redirect_to @agency_subscription, notice: 'Agency subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency_subscription }
      else
        format.html { render :edit }
        format.json { render json: @agency_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agency_subscriptions/1
  # DELETE /agency_subscriptions/1.json
  def destroy
    @agency_subscription.destroy
    respond_to do |format|
      format.html { redirect_to agency_subscriptions_url, notice: 'Agency subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency_subscription
      @agency_subscription = AgencySubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_subscription_params
      params.require(:agency_subscription).permit(:email, :name, :is_active)
    end
end
