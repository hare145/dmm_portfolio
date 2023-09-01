class Public::UserservicesController < ApplicationController
  before_action :authenticate_user!
    
  def show
    @userservice = current_user.userservices.new
    @current_user_services = Userservice.where(user_id: current_user.id).pluck(:service_id)
  end
  
  def create
    params[:userservice][:service_id].each do |service| 
      @userservice = current_user.userservices.build(service_id: service)
      @userservice.save!
    end
    redirect_to users_mypage_path
  end

  def update
    @userservice = Userservice.where(user_id: params[:user_id])
    old_service = @userservice.pluck(:service_id)
      old_service.each do | destroy_service |
        service = Userservice.find_by(user_id: current_user.id, service_id: destroy_service)
        service.destroy
      end
    params[:userservice][:service_id].each do |service| 
    @userservice = current_user.userservices.build(service_id: service)
    @userservice.save!
    end
    redirect_to users_mypage_path
  end

end
