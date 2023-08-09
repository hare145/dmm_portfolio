class Public::UsercommentsController < ApplicationController
  
  def create
    @usercomment = current_user.usercomments.build(usercomment_params)
    if @usercomment.save!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
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
    
  end
  
  
  private
  
  def usercomment_params
    params.require(:usercomment).permit(:user_id, :page_id, :name, :content, :is_public)
  end
  
end
