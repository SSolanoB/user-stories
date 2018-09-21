class PostsController < ApplicationController

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.now[:success] = "Post created!"
      redirect_to root_url
    else
      render '/home/index'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:body, :expiration)
    end

end
