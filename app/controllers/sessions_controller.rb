class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to welcome_path, :notice => "Hello, #{@user.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to welcome_path
  end

  def new

  end

end