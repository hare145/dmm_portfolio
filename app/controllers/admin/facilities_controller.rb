class Admin::FacilitiesController < ApplicationController
  def show
    @facility = User.find(params[:id])
    @usercomments = Usercomment.where(page_id: params[:id])
    # @UserService.where(user_id: @facility)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @facility = User.find(params[:id])
    @facility.update(facility_params)
    redirect_to admin_facility_path(@facility)
  end
  
  
  private
  
  def facility_params
    params.require(:user).permit(:name, :employee, :tag, :service_id, :account_soft,
    :account_reason, :accounting_soft, :accounting_reason, :other_soft, :other_reason,
    :salary_soft, :salary_reason, :working_hours_soft, :working_hours_reason,
    :communication_soft, :communication_reason, :customer_info_soft, :customer_info_reason,
    :customer_deposit_soft, :customer_billing_soft, :customer_billing_reason)
  end
  
end
