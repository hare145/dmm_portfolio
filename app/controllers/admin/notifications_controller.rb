class Admin::NotificationsController < ApplicationController
  def index
    if params[:is_checked] == false
      @notifications = Notification.where(is_checked: false)
    else
      @notifications = Notification.all
    end
  end
  
  def update
    @notification = Notification.find(params[:id])
    @notification.update!(notification_params)
    redirect_to admin_notifications_path
  end
  
  
  private
  
  def notification_params
    params.permit(:is_checked)
  end
end
