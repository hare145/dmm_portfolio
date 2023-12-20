class Admin::UserservicesController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @user = User.find(params[:facility_id])
    @userservice = @user.userservices.new
    @current_user_services = Userservice.where(user_id: @user.id).pluck(:service_id)
  end
  
  def update
    @user = User.find(params[:facility_id])
    @userservice = Userservice.where(user_id: @user.id)
    old_service = @userservice.pluck(:service_id)
      old_service.each do | destroy_service |
        service = Userservice.find_by(user_id: @user.id, service_id: destroy_service)
        service.destroy
      end
    params[:userservice][:service_id].each do |service| 
    @userservice = @user.userservices.build(service_id: service)
    @userservice.save!
    end
    redirect_to edit_admin_facility_path(@user)
  end

end
