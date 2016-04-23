class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(model_params)

    if @user.save
      flash[:notice] = 'User successfully created!'     #by default, flash persists for one new request
      redirect_to root_path                    # this is the new request, defined in routes
    else
      flash.now[:error] = 'Failed to create user!'      #flash.now, says dont persist for next request, show now
      render :new
    end

  end


  def show
    @user = User.find(params[:id])
    @grams = @user.grams.page(params[:page]).per(5)
  end


  private
  def model_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
