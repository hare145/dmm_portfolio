class Public::UsermarksController < ApplicationController
  def create
    @usermark = current_user.usermarks.build(usermark_params)
    if @usermark.save!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @usermark = current_user.usermarks.find_by(page_id: params[:id])
    if @usermark.present?
      @usermark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  
  
private
  
  def usermark_params
    params.require(:usermark).permit(:user_id, :page_id)
  end

end
