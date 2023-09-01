class Admin::UsercommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @facility = User.find(params[:facility_id])
    @usercomments = Usercomment.where(page_id: params[:facility_id])
  end
  
  
  def update
    @user = User.find(params[:facility_id])
    @usercomment = Usercomment.find(params[:comment_id])
    if @usercomment.update!(usercomment_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @usercomment = Usercomment.find(params[:comment_id])
    if @usercomment.destroy!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  
  private
  
  def usercomment_params
    params.require(:usercomment).permit(:is_public)
  end
  
end
