class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save
       redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
  end

#  def destroy
#  end

# def delete
#  end


end
