class Admin::SoftcommentsController < ApplicationController
  def update
    @softcomment = Softcomment.find(params[:comment_id])
    if @softcomment.update!(softcomment_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @softcomment = Softcomment.find(params[:comment_id])
    if @softcomment.destroy!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  
  private
  
  def softcomment_params
    params.require(:softcomment).permit(:is_public)
  end
  
end
