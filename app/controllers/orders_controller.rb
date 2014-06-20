class OrdersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:status]

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:create, :edit, :new, :destroy, :update]

  # GET /orders
  # GET /orders.json
  def index
    @orders = if current_user.admin?
      Order
    else
      current_user.orders
    end
    @orders = @orders.page(params[:page]).per(10)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = @order.decorate
  end

  def status
    if params[:order_id] # #{user_id}-#{Time.now.to_i}-#{payment_type}

      args = params[:order_id].split('-')
      user_id = args[0]
      uid = args[1]
      payment_type = args[2]

      @order = Order.find_by(uid: uid)

      unless @order
        @order = Order.create(
          user_id: user_id,
          uid: uid,
          payment_type: args[2]
        )
        logger.debug(@order.errors.inspect)
      end
    end

    @order ||= Order.new(user: current_user)
    @order = @order.decorate
    render 'show', layout: 'light'
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id_id, :payment_type, :payment_status)
  end
end
