class SeensController < ApplicationController
  def create
    @seen = current_user.seens.build(seen_params)
    if @seen.save
      flash.now[:success] = "Seen updated!"
    else
      render '/home/index'
    end
  end

  private

    def seen_params
      params.require(:seen).permit(:userid, :postid)
    end
end
