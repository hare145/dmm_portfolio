class Public::UsersController < ApplicationController
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
  end

  def mypage
    @comments = UserComment.where(user_id: params[:id])
  end
  
  
  
  private
 
  def user_params
    params.require(:user).permit(:name, :employee, :tag, :service_id, :account_soft,
    :account_reason, :accounting_soft, :accounting_reason, :other_soft, :other_reason,
    :salary_soft, :salary_reason, :working_hours_soft, :working_hours_reason,
    :communication_soft, :communication_reason, :customer_info_soft, :customer_info_reason,
    :customer_deposit_soft, :customer_billing_soft, :customer_billing_reason, :addressee)
  end
end
