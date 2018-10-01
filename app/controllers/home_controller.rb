class HomeController < ApplicationController
  def index
    @post = current_user.posts.build if user_signed_in?
  end

  def post_listing
    @seen = current_user.seens.build if user_signed_in?
    @posts = Post.not_expired_not_seen(current_user.id)
  end


end
