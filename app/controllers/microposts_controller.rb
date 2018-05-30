class MicropostsController < ApplicationController
  #may 27 2018
 before_action :logged_in_user, only: [:create, :destroy]

  before_action :correct_user,   only: :destroy 



  def create
    #may 27 2018
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
       #may 27 2018---to catch empty post
        @feed_items = []
      render 'static_pages/home'
    end


  end

  def destroy
    #may 27 2018
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url

  end

 

  #may 27 2018 
  private

    def micropost_params
     #params.require(:micropost).permit(:content)
     #may 29 2018
      params.require(:micropost).permit(:content, :picture)

    end

   #may 27 2018
  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end



end
