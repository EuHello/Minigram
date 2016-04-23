class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.present? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
          #store user details in session array. this will last throughout whole session
          #no need for any database model for sessions
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid Email/password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to root_path
  end


end
