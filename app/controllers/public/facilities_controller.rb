class Public::FacilitiesController < ApplicationController
  impressionist :actions => [:show]
  
  
  def index
    @first_services = Service.all.limit(5)
    @next_services = Service.all.limit(4).offset(6)
    @third_services = Service.all.limit(2).offset(10)
    
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
      elsif @order == "employee_many"
        @users = @users.employee_many_search
      elsif @order == "employee_few" 
        @users = @users.employee_few_search
      end
    end
  end

  def show
    @facility = User.find(params[:id])
    impressionist(@facility, nil, unique: [:ip_address])
    if user_signed_in?
      @usercomment = current_user.usercomments.new
    end
    @comments = Usercomment.where(page_id: @facility, is_public: false)
  end
  
  private
  
  def user_all
    User.where(is_deleted: false).page(params[:page]).per(12)
  end
  
  
end
