class Public::FacilitiesController < ApplicationController
  impressionist :actions => [:show]
  
  
  def index
    @first_services = Service.all.limit(5)
    @next_services = Service.all.limit(4).offset(6)
    @third_services = Service.all.limit(2).offset(10)
    
    @facility = params[:name]
    @service = params[:service_id]
    @order = params[:ordered]
    
    if @facility.present? && @service.present? && @order.present?
      if @order == "new"
        @users = User.name_search(@facility).service_search(@service).create_search.page(params[:page]).per(12)
      elsif @order == "view" 
        @users = User.name_search(@facility).service_search(@service).view_search.page(params[:page]).per(12)
      elsif @order == "many"
        @users = User.name_search(@facility).service_search(@service).many_search.page(params[:page]).per(12)
      elsif @order == "few" 
        @users = User.name_search(@facility).service_search(@service).few_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    elsif @facility.present? && @service.present?
      @users = User.name_search(@facility).service_search(@service).page(params[:page]).per(12)
      
    elsif @facility.present? && @order.present?
      if @order == "new"
        @users = User.name_search(@facility).create_search.page(params[:page]).per(12)
      elsif @order == "view"
        @users = User.name_search(@facility).view_search.page(params[:page]).per(12)
      elsif @order == "many"
        @users = User.name_search(@facility).many_search.page(params[:page]).per(12)
      elsif @order == "few" 
        @users = User.name_search(@facility).few_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    elsif @service.present? && @order.present?
      if @order == "new"
        @users = User.service_search(@service).create_search.page(params[:page]).per(12)
      elsif @order == "view" 
        @users = User.service_search(@service).view_search.page(params[:page]).per(12)
      elsif @order == "many"
        @users = User.service_search(@service).many_search.page(params[:page]).per(12)
      elsif @order == "few" 
        @users = User.service_search(@service).few_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    elsif @facility.present?
      @users = User.name_search(@facility).page(params[:page]).per(12)
      
    elsif @service.present?
      @users = User.service_search(@service).page(params[:page]).per(12)
      
    elsif @order.present?
      if @order == "new"
        @users = User.create_search.page(params[:page]).per(12)
      elsif @order == "view" 
        @users = User.view_search.page(params[:page]).per(12)
      elsif @order == "many"
        @users = User.many_search.page(params[:page]).per(12)
      elsif @order == "few" 
        @users = User.few_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    else
      @users = user_all
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
