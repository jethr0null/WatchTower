class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "User Successfully Created"
        format.html { redirect_to @user }
      else
        @user.errors.full_messages.each do |msg|
          flash.now[:danger] = msg
          format.html { render :new }
        end
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
