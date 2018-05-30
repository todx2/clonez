class StaticPagesController < ApplicationController
  
  def home
    #may 27 2018
    #@micropost = current_user.microposts.build if logged_in?
   if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

   
  end

  def help
  end

  #added ted 
  def about
  end

  def contact 
  end

end
