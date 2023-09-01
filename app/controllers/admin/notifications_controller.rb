class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:is_checked] == "false"
      @notifications = Notification.where(is_checked: false).page(params[:page]).per(20)
    else
      @notifications = Notification.all.page(params[:page]).per(20)
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
