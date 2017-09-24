module ApplicationHelper

  def signed_in?
     session[:current_user_id] ? true : false
  end

  def signed_in
     if !session[:current_user_id]
       flash[:alert] = "Login to add a post"
       redirect_to login_path
     end
  end
end
