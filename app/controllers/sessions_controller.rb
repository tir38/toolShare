class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        # user exists and authenticates
        sign_in user
        redirect_to user
    else
       # user either doesn't exist or doesn't authenticate
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end

  end


  def destroy
    sign_out(@user)
    redirect_to root_path
  end

end
