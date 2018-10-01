class SeensController < ApplicationController
  def create
    @seen = current_user.seens.build(seen_params)
    if @seen.save
      flash.now[:success] = "Seen updated!"
      redirect_to list_path
    else
      render '/home/index'
    end
  end

  private

    def seen_params
      params.require(:seen).permit(:user_id, :post_id)
    end
end
