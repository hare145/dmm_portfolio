class Public::UserservicesController < ApplicationController
  before_action :authenticate_user!
    
  def show
    @userservice = current_user.userservices.new
    @current_user_services = Userservice.where(user_id: current_user.id).pluck(:service_id)
  end
  
  def create
    current_user.update(userservice_service_ids: params[:userservice][:service_id])
    redirect_to users_mypage_path
  end

  def update
    current_user.update(userservice_service_ids: params[:userservice][:service_id])
    redirect_to users_mypage_path
  end

end
