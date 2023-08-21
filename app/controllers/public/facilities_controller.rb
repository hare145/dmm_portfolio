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
        @users = User.name_search(@search_ficility).service_search(@search_service).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view" 
        @users = User.name_search(@search_ficility).service_search(@search_service).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "many"
        @users = User.name_search(@search_ficility).service_search(@search_service).many_search.page(params[:page]).per(12)
      elsif @search_oreder == "few" 
        @users = User.name_search(@search_ficility).service_search(@search_service).few_search.page(params[:page]).per(12)
      else
        @users = User.all.page(params[:page]).per(12)
      end
      
    elsif @search_ficility.present? && @search_service.present?
      @users = User.name_search(@search_ficility).service_search(@search_service).page(params[:page]).per(12)
      
    elsif @search_ficility.present? && @search_order.present?
      if @search_order == "new"
        @users = User.name_search(@search_ficility).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view"
        @users = User.name_search(@search_ficility).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "many"
        @users = User.name_search(@search_ficility).many_search.page(params[:page]).per(12)
      elsif @search_oreder == "few" 
        @users = User.name_search(@search_ficility).few_search.page(params[:page]).per(12)
      else
        @users = User.all.page(params[:page]).per(12)
      end
      
    elsif @search_service.present? && @search_order.present?
      if @search_order == "new"
        @users = User.service_search(@search_service).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view" 
        @users = User.service_search(@search_service).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "many"
        @users = User.service_search(@search_service).many_search.page(params[:page]).per(12)
      elsif @search_oreder == "few" 
        @users = User.service_search(@search_service).few_search.page(params[:page]).per(12)
      else
        @users = User.all.page(params[:page]).per(12)
      end
      
    elsif @search_ficility.present?
      @users = User.name_search(@search_ficility).page(params[:page]).per(12)
      
    elsif @search_service.present?
      @users = User.service_search(@search_service).page(params[:page]).per(12)
      
    elsif @search_order.present?
      if @search_order == "new"
        @users = User.create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view" 
        @users = User.view_search.page(params[:page]).per(12)
      elsif @search_oreder == "many"
        @users = User.many_search.page(params[:page]).per(12)
      elsif @search_oreder == "few" 
        @users = User.few_search.page(params[:page]).per(12)
      else
        @users = User.all.page(params[:page]).per(12)
      end
      
    else
      @users = User.all.page(params[:page]).per(12)
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
end
