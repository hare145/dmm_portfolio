class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @search_ficility = params[:name]
    @search_service = params[:service_id]
    @search_order = params[:ordered]
    
    if @search_ficility.present? && @search_service.present? && @search_order.present?
      if @search_order == "new"
        @users = User.name_search(@search_ficility).service_search(@search_service).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view" 
        @users = User.name_search(@search_ficility).service_search(@search_service).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "release"
        @users = User.name_search(@search_ficility).service_search(@search_service).release_search.page(params[:page]).per(12)
      elsif @search_oreder == "private" 
        @users = User.name_search(@search_ficility).service_search(@search_service).private_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    elsif @search_ficility.present? && @search_service.present?
      @users = User.name_search(@search_ficility).service_search(@search_service).page(params[:page]).per(12)
      
    elsif @search_ficility.present? && @search_order.present?
      if @search_order == "new"
        @users = User.name_search(@search_ficility).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view"
        @users = User.name_search(@search_ficility).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "release"
        @users = User.name_search(@search_ficility).release_search.page(params[:page]).per(12)
      elsif @search_oreder == "private" 
        @users = User.name_search(@search_ficility).private_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    elsif @search_service.present? && @search_order.present?
      if @search_order == "new"
        @users = User.service_search(@search_service).create_search.page(params[:page]).per(12)
      elsif @search_oreder == "view" 
        @users = User.service_search(@search_service).view_search.page(params[:page]).per(12)
      elsif @search_oreder == "release"
        @users = User.service_search(@search_service).release_search.page(params[:page]).per(12)
      elsif @search_oreder == "private" 
        @users = User.service_search(@search_service).private_search.page(params[:page]).per(12)
      else
        @users = user_all
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
      elsif @search_oreder == "release"
        @users = User.release_search.page(params[:page]).per(12)
      elsif @search_oreder == "private" 
        @users = User.private_search.page(params[:page]).per(12)
      else
        @users = user_all
      end
      
    else
      @users = User.all.page(params[:page]).per(10)
    end
  end
  
  
  private
  
  def user_all
    User.where(is_deleted: false).page(params[:page]).per(12)
  end
  
end
