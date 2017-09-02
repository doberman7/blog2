class UsersController < ApplicationController
  def index
  end
  def new
    p "+" * 50
    p params
    if params[:authenticity_token]

      @user = User.new(name: params[:name], email: params[:email])
      if @user.save
        p "salvado"
      else
        render 'new'
      end

    end
    # "authenticity_token"=>"FHjoi/wQvnHPYvxw6Wbp5tjU/Ml5foR6ECBZLUr1kVeF9LceNH0DqoooqdDXMpZ/yjRARI+mu+kH+gfURCxSBw==", "user"=>{"name"=>"name", "email"=>"email@email.com", "password"=>"123456", "password_confirmation"=>"123456"}, "commit"=>"Create my account", "controller"=>"users", "action"=>"new"} permitted: false>

  end


end
