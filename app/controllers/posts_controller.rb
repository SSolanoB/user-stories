class PostsController < ApplicationController

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to list_path
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
