class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :destroy_accounts, only: [:destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @accounts = Account.all
    @current_account = Account.find_by(params[:id])
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer_names = @customer.list_account_names
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to dashboard_path}
        flash[:success] = 'Customer was successfully added.'
      #  format.json { render :show, status: :created, location: @customer }
      else
        @customer.errors.full_messages.each do |msg|
          flash.now[:danger] = msg
          format.html { render :new }
        end
        #format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer }
        flash[:success] = 'Customer was successfully updated.'
        #format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        #format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy_accounts
    customer_accounts = @customer.list_customer_accounts
    customer_accounts.each do |account|
      account.destroy
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path}
      flash[:success] = 'Customer was successfully deleted.'
      #format.json { head :no_content }
    end
  end

  def dashboard
    @customer = Customer.find(params[:format])
  end

  def list_accounts
    @customer = Customer.find(params[:format])
    @customer_accounts = @customer.list_customer_accounts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name)
    end
end
