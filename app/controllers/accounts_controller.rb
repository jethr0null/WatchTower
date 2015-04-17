class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    @customers = Customer.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @customers = Customer.all

    #respond_to do |format|
      if @account.save
        redirect_to customer_dashboard_path
        flash[:success] = 'Account was successfully created.'
      end
    #end
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @customers = Customer.all

    respond_to do |format|
      if @account.save
        format.html { redirect_to dashboard_path }
        flash[:success] = 'Account was successfully created.'
        #format.json { render :show, status: :created, location: @account }
      else
        @account.errors.full_messages.each do |msg|
          flash.now[:danger] = msg
          format.html { render :new }
        end
      end
        #format.json { render json: @account.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account }
        flash[:success] = 'Customer was successfully updated.'
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        #format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :account_number, :customer_name)
    end
end
