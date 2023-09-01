class Public::SoftsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
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
        @softs = Soft.company_search(@soft).work_search(@work).create_search.public_true.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.company_search(@soft).work_search(@work).view_search.public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
      
    elsif @soft.present? && @work.present?
      @softs = Soft.company_search(@soft).work_search(@work).public_true.page(params[:page]).per(10)
      
    elsif @soft.present? && @order.present?
      if @order == "new"
        @softs = Soft.company_search(@soft).create_search.public_true.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.company_search(@soft).view_search.public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
      
    elsif @work.present? && @order.present?
      if @order == "new"
        @softs = Soft.work_search(@work).create_search.public_true.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.work_search(@work).view_search.public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
    
    elsif @soft.present?
      @softs = Soft.company_search(@soft).public_true.page(params[:page]).per(10)
      
    elsif @work.present?
      @softs = Soft.work_search(@work).public_true.page(params[:page]).per(10)
      
    elsif @order.present?
      if @order == "new"
        @softs = Soft.create_search.public_true.page(params[:page]).per(10)
      elsif @order == "view" 
        @softs = Soft.view_search.public_true.page(params[:page]).per(10)
      else
        @softs = soft_all
      end
    
    else
      @softs = soft_all
    end
  end

  def show
    @soft = Soft.find(params[:id])
    impressionist(@soft, nil, unique: [:ip_address])
    if user_signed_in?
      @softcomment = current_user.softcomments.new
    end
    @comments = Softcomment.where(soft_id: params[:id], is_public: false).limit(5)
  end

  def create
    @soft = Soft.new(soft_params)
    @soft.user_id = current_user.id
    if @soft.save!
      @soft.save_notification!(current_user, @soft.id)
      redirect_to softs_notice_path
    else
      redirect_to soft_path(@soft)
    end
  end

  
  
  private
  
  def soft_all
    Soft.all.public_true.page(params[:page]).per(10)
  end
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :logo_image)
  end
  
end
