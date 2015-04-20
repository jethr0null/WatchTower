class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    @accounts = Account.all
    @current_account = Account.find_by(params[:id])
  end

  def edit
  end

  def show
    @customer_names = @customer.list_account_names
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to dashboard_path}
        flash[:success] = 'Customer was successfully added.'
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer }
        flash[:success] = 'Customer was successfully updated.'
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path}
      flash[:success] = 'Customer was successfully deleted.'
    end
  end

  def dashboard
    @customer = Customer.find(params[:format])
  end

  def list_accounts
    @customer = Customer.find(params[:format])
    @customer_accounts = @customer.accounts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name)
    end
end
