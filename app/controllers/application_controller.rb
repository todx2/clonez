class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #def selam
  #  render html: "hello, world!"
  #end
    include SessionsHelper

  #may 27 2018  --only  logged in peolpe can tweet 
 private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


end
