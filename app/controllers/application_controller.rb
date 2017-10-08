class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # este se usará posteriormente para user el current_user
  # include SessionsHelper
end
