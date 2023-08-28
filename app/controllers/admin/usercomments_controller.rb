class Admin::UsercommentsController < ApplicationController
  
  def update
    @user = User.find(params[:user_id])
    @usercomment = @user.usercomments.find(params[:comment_id])
    if @usercomment.update!(usercomment_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
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
