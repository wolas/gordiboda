class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @orders = Order.all.where(status: 'completed')
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end


end
