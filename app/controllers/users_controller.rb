class UsersController < ApplicationController
  def index
  end
  # meotodo al dar click en sign up
  def new
  end

  # metodo en vista modal
  def create
  # {"name"=>"", "email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Create my account"}
  #<ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"wAWOEwMiUn2Gt+3ELnAOe7CcP6O8xXGIVuuhBtAv54JRidGGy0/vpsP9uGQQJHHionyDLkodThtBMf//3vYk0g==", "user"=>{"name"=>"", "email"=>"", "password"=>"", "password_confirmation"=>""}, "commit"=>"Create my account", "controller"=>"users", "action"=>"create"} permitted: false>
  # name: params[:user][:name],
  # email: params[:user][:email],
  # password: params[:user][:password],
  # password_confirmation:[:user][:password_confirmation]
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation] )
    if @user.save || @errors != nil
      session[:user_id] = @user.id
      @messages= Message.all
      render 'messages/index'
    else
      @errors = @user.errors.full_messages
      render "users/index"
    end

  end
  # al recargar la vista de mensajes
  def show
    # p "- " * 50
    # if @errors != nil
       @messages= Message.all
       render 'messages/index'
    #   # p session[:user_id] = User.last
    #   p "- " * 50
    # else
      # render "users/index"
    # end
  end

  def user_log
    p "+" * 50
    p "log"
    u = User.where(email: params[:user][:email], password: params[:user][:password] ).count
    if u != 0
      session[:user_id] = User.where(email: params[:user][:email], password: params[:user][:password] ).first.id
      @messages= Message.all
      render 'messages/index'
    else
      @errors = ["Nada, no estás en la BD"]
      render "users/index"
    end
  end


end
