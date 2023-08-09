class Public::SoftcommentsController < ApplicationController
  def create
    @soft = Soft.find(params[:soft_id])
    @softcomment = @soft.softcomments.build(softcomment_params.merge(user: current_user))
    if @softcomment.save!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def update
    @soft = Soft.find(params[:soft_id])
    @softcomment = @soft.softcomments.find(params[:id])
    if @softcomment.update!(softcomment_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
  end
  
  
  
  private
  
  def softcomment_params
    params.require(:softcomment).permit(:soft_id, :name, :content, :is_public)
  end
end
