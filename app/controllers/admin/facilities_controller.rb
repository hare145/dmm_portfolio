class Admin::FacilitiesController < ApplicationController
  def show
    @facility = User.find(params[:id])
    @comments = UserComment.all
    # @UserService.where(user_id: @facility)
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    
  end
  
end
