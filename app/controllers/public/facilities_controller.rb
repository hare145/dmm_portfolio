class Public::FacilitiesController < ApplicationController
  impressionist :actions => [:show]
  
  
  def index
    @first_services = Service.all.limit(5)
    @next_services = Service.all.limit(4).offset(6)
    @third_services = Service.all.limit(2).offset(9)
    
    @search_ficility = params[:name]
    @search_service = params[:service_id]
    @search_order = params[:ordered]
    
    if @search_ficility.present? && @search_service.present? && @search_order.present?
      if @search_order == "new"
        @users = User.where("name LIKE?","%#{@search_ficility}%").where(service_id: @search_service).creat_search
      else @search_oreder = "view" 
        @users = User.where("name LIKE?","%#{@search_ficility}%").where(service_id: @search_service).view_search
      end
      
    elsif @search_ficility.present? && @search_service.present?
      @users = User.where("name LIKE?","%#{@search_ficility}%").where(service_id: @search_service)
      
    elsif @search_ficility.present? && @search_order.present?
      if @search_order == "new"
        @users = User.where("name LIKE?","%#{@search_ficility}%").creat_search
      else @search_oreder = "view"
        @users = User.where(service_id: @search_service).view_search
      end
      
    elsif @search_service.present? && @search_order.present?
      if @search_order == "new"
        @users = User.where("name LIKE?","%#{@search_ficility}%").where(service_id: @search_service).creat_search
      else @search_oreder = "view" 
        @users = User.where("name LIKE?","%#{@search_ficility}%").where(service_id: @search_service ).view_search
      end
      
    elsif @search_ficility.present?
      @users = User.where("name LIKE?","%#{@search_ficility}%") 
      
    elsif @search_service.present?
      @users = User.where(service_id: @search_service )
      
    elsif @search_order.present?
      if @search_order == "new"
        @users = User.creat_search
      else @search_oreder = "view" 
        @users = User.view_search
      end
      
    else
      @users = User.all
    end
  end

  def show
    @facility = User.find(params[:id])
    impressionist(@facility, nil, unique: [:ip_address])
    if user_signed_in?
      @usercomment = current_user.usercomments.new
    end
    @comments = Usercomment.where(page_id: @facility, is_public: false)
    # @UserService.where(user_id: @facility)
  end
end
