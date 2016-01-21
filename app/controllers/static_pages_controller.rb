class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    end
      @microposts = Micropost.all
      @feed_items = Micropost.paginate(page: params[:page], per_page: 10)
  end

  def help
  end

  def about
  end

  def contact
  end
end