class UsersController < ApplicationController
  def index
  end
  # meotodo al dar click en sign up
  def new
  end

  # metodo en vista modal
  def create

    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      @messages= Message.all
      render 'messages/index'
    else
      render 'new'
    end

  end
  # al recargar la vista de mensajes
  def show
    @messages= Message.all
    render 'messages/index'
  end


end
