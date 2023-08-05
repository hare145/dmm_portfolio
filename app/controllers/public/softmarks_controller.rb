class Public::SoftmarksController < ApplicationController
  def create
    @softmark = current_user.softmarks.build(softmark_params)
    if @softmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @softmark = current_user.softmarks.find_by(soft_id: params[:id])
    if @softmark.present?
      @softmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  
  
private
  
  def softmark_params
    params.require(:softmark).permit(:soft_id)
  end
end
