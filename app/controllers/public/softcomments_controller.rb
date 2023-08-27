class Public::SoftcommentsController < ApplicationController
  def show
    @soft = Soft.find(params[:id])
    @softcomments = Softcomment.where(soft_id: params[:soft_id], is_public: false)
  end
  
  
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
    @softcomment = Softcomment.find(params[:id])
    if @softcomment.update!(softcomment_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  private
  
  def softcomment_params
    params.require(:softcomment).permit(:soft_id, :name, :content, :is_public)
  end
end
