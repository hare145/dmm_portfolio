class Public::UserServicesController < ApplicationController
  
  def show
  end
  
  def create
    @user_service = current_user.user_services.new(user_service_params)
    @user_servuce.save
    redirect_to users_mypage_path
  end

  def update
    @user_service = UserService.find(params[:id])
    @user_service.user_id = current_user.id
    @user_service.update(user_service_params)
    redirect_to users_mypage_path
  end


private

  def user_service_params
    params.require(:user_service).permit(:user_id, :service_id)
  end

end
