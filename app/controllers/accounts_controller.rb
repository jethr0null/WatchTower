class AccountsController < ApplicationController

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
    @customers = Customer.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
    @customers = Customer.all
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @customers = Customer.all

    respond_to do |format|
      if @account.save
        format.html { redirect_to dashboard_path }
        flash[:success] = 'Account was successfully created.'
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account }
        flash[:success] = 'Customer was successfully updated.'
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      flash[:success] = 'Customer was successfully deleted.'
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :account_number, :customer_id)
    end
end
