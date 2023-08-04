class Public::SoftmarksController < ApplicationController
  def create
    @softkmark = Softmark.new(softmark_params)
    @softmark.user_id = current_user.id
    if @softmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destory
    @soft = Soft.find(params[:soft_id])
    @softmark = @soft.softmarks.find_by(user_id: current_user.id)
    if @softmark.present?
      @softmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  
  
private
  
  def softmark_params
    params.permit(:soft_id)
  end
end
