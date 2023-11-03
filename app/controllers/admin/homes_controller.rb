class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    
    @facility = params[:name]
    @service = params[:service_id]
    @order = params[:ordered]
    
    @users = user_all
    if @facility.present?
      @users = @users.name_search(@facility)
    end
    if @service.present?
      @users = @users.service_search(@service)
    end
    if @order.present?
      if @order == "new"
        @users = @users.new_search
      elsif @order == "old" 
        @users = @users.old_search
      elsif @order == "view_many"
        @users = @users.view_many_search
      elsif @order == "view_few"
        @users = @users.view_few_search
      elsif @order == "release"
        @users = @users.release_search
      elsif @order == "private" 
        @users = @users.private_search
      end
    end
  end
  
  
  private
  
  def user_all
    User.where(is_deleted: false).page(params[:page]).per(12)
  end
  
end
