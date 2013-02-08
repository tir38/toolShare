class ToolsController < ApplicationController

  def create
    @tool = Tool.new(params[:tool])
    puts @tool.name
    if @tool.save
     redirect_to '/tools'
    else
     render :new
    end
  end

  def edit
  end

  def index
    @tools = Tool.all
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def update
  end

#  def destroy
#  end

# def delete
#  end

end
