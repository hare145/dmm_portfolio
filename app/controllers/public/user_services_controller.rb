class Public::UserServicesController < ApplicationController

  def create
    @user.new(user_service_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_mypage_path
  end


private

  def user_service_params
    params.require(:user_service).permit(:user_id, :service_id)
  end

end
