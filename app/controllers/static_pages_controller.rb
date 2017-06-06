class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.micropost.order_desc
        .paginate page: params[:page]
  end

  def help
  end

  def about
  end

  def contact
  end
end
