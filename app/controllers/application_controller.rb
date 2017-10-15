class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # esto permite intergrar el helper de los users, donde se encuetra logout method
  include UsersHelper

end
