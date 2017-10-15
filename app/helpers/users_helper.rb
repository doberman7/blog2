module UsersHelper
# deslogear el usario, este metodo es llamado desde el user controller
  def log_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @user = nil
  end
end
