class Admin::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
     @works = Work.all
     
    @search_soft = params[:company]
    @search_work = params[:work_id]
    @search_order = params[:ordered]
    
    if @search_soft.present? && @search_work.present? && @search_order.present?
      if @search_order == "new"
        @softs = Soft.where("company LIKE?","%#{@search_soft}%").where(work_id: @search_work).creat_search
      else @search_oreder = "view" 
        @softs = Soft.where("company LIKE?","%#{@search_soft}%").where(work_id: @search_work).view_search
      end
    elsif @search_soft.present? && @search_work.present?
      @softs = Soft.where("company LIKE?","%#{@search_soft}%").where(work_id: @search_work)
      
    elsif @search_soft.present? && @search_order.present?
      if @search_order == "new"
        @softs = Soft.where("company LIKE?","%#{@search_soft}%").creat_search
      else @search_oreder = "view" 
        @softs = Soft.where("company LIKE?","%#{@search_soft}%").view_search
      end
      
    elsif @search_work.present? && @search_order.present?
      if @search_order == "new"
        @softs = Soft.where(work_id: @search_work).creat_search
      else @search_oreder = "view" 
        @softs = Soft.where(work_id: @search_work).view_search
      end
    
    elsif @search_soft.present?
      @softs = Soft.where("company LIKE?","%#{@search_soft}%")
      
    elsif @search_work.present?
      @softs = Soft.where(work_id: @search_work)
      
    elsif @search_order.present?
      if @search_order == "new"
        @softs = Soft.creat_search
      else @search_oreder = "view" 
        @softs = Soft.view_search
      end
    
    else
      @softs = Soft.all
    end
  end

  def show
    @soft = Soft.find(params[:id])
    @soft_comments = Softcomment.where(id: params[:id])
  end

  def edit
   @soft = Soft.find(params[:id])
  end


  def create
    @soft = Soft.new(soft_params)
    @soft.user_id = current_admin.id
    @soft.save
    redirect_to admin_softs_path(@soft)
  end

  def update
    @soft = Soft.find(params[:id])
    @soft.update(soft_params)
    redirect_to admin_softs_path(@soft)
  end

  
  
  private
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :is_public, :logo_image)
  end
end
