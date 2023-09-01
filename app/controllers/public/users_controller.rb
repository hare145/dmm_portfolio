class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = User.find(current_user.id)
  end
 
  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to users_mypage_path
  end
   
  def unsubscribe
  end
  
  def withdraw
    user = User.find(current_user.id)
    user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def mypage
    @usercomments = Usercomment.where(user_id: current_user.id).limit(4)
    @softcomments = Softcomment.where(user_id: current_user.id).limit(4)
  end
  
  def bookmark
    @softmarks = current_user.softmark_softs.order(created_at: :desc)
    @usermark_page = Usermark.select("page_id").where(user_id: current_user.id)
    @usermarks = User.where(id: @usermark_page).order(created_at: :desc)
  end
  
  def mycomment
    @usercomments = current_user.usercomments.all
    @softcomments = current_user.softcomments.all
  end
  
  private
 
  def user_params
    params.require(:user).permit(:name, :employee, :tag, :service_id, 
    :image, :founding, :account_soft,:account_reason, :accounting_soft, 
    :accounting_reason, :other_soft, :other_reason,
    :salary_soft, :salary_reason, :working_hours_soft, :working_hours_reason,
    :communication_soft, :communication_reason, :customer_info_soft, :customer_info_reason,
    :customer_deposit_soft, :customer_billing_soft, :customer_billing_reason)
  end
end
