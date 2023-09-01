class Admin::SoftsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    @soft = params[:company]
    @work = params[:work_id]
    @order = params[:ordered]
    
    if @soft.present? && @work.present? && @order.present?
      if @order == "new"
        @softs = Soft.company_search(@soft).work_search(@work).create_search.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.company_search(@soft).work_search(@work).view_search.page(params[:page]).per(10)
      elsif @order == "false"
        @softs = Soft.company_search(@soft).work_search(@work).public_false.page(params[:page]).per(10)
      elsif @order == "true"
        @softs = Soft.company_search(@soft).work_search(@work).public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
      
    elsif @soft.present? && @work.present?
      @softs = Soft.company_search(@soft).work_search(@work).page(params[:page]).per(10)
      
    elsif @soft.present? && @order.present?
      if @order == "new"
        @softs = Soft.company_search(@soft).create_search.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.company_search(@soft).view_search.page(params[:page]).per(10)
      elsif @order == "false"
        @softs = Soft.company_search(@soft).public_false.page(params[:page]).per(10)
      elsif @order == "true"
        @softs = Soft.company_search(@soft).public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
      
    elsif @work.present? && @order.present?
      if @order == "new"
        @softs = Soft.work_search(@work).create_search.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.work_search(@work).view_search.page(params[:page]).per(10)
      elsif @order == "false"
        @softs = Soft.work_search(@work).public_false.page(params[:page]).per(10)
      elsif @order == "true"
        @softs = Soft.work_search(@work).public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
    
    elsif @soft.present?
      @softs = Soft.company_search(@soft).page(params[:page]).per(10)
      
    elsif @work.present?
      @softs = Soft.work_search(@work).page(params[:page]).per(10)
      
    elsif @order.present?
      if @order == "new"
        @softs = Soft.create_search.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.view_search.page(params[:page]).per(10)
      elsif @order == "false"
        @softs = Soft.public_false.page(params[:page]).per(10)
      elsif @order == "true"
        @softs = Soft.public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
    
    else
      @softs = soft_all
    end
  end

  def show
    @soft = Soft.find(params[:id])
    @softcomments = Softcomment.where(soft_id: params[:id]).limit(5)
  end

  def edit
   @soft = Soft.find(params[:id])
  end


  def create
    @soft = Soft.new(soft_params)
    @soft.user_id = 99999999
    @soft.save!
    redirect_to admin_softs_path(@soft)
  end

  def update
    @soft = Soft.find(params[:id])
    @soft.update(soft_params)
    redirect_to admin_soft_path(@soft)
  end

  
  
  private
  
  def soft_all
    Soft.all.page(params[:page]).per(10)
  end
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :is_public, :logo_image)
  end
end
