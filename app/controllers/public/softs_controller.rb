class Public::SoftsController < ApplicationController
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
        @softs = Soft.company_search(@search_soft).work_search(@search_work).create_search.public_true.page(params[:page]).per(10)
      else @search_oreder = "view" 
        @softs = Soft.company_search(@search_soft).work_search(@search_work).view_search.public_true.page(params[:page]).per(10)
      end
      
    elsif @search_soft.present? && @search_work.present?
      @softs = Soft.company_search(@search_soft).work_search(@search_work).public_true.page(params[:page]).per(10)
      
    elsif @search_soft.present? && @search_order.present?
      if @search_order == "new"
        @softs = Soft.company_search(@search_soft).create_search.public_true.page(params[:page]).per(10)
      else @search_oreder = "view" 
        @softs = Soft.company_search(@search_soft).view_search.public_true.page(params[:page]).per(10)
      end
      
    elsif @search_work.present? && @search_order.present?
      if @search_order == "new"
        @softs = Soft.work_search(@search_work).create_search.public_true.page(params[:page]).per(10)
      else @search_oreder = "view" 
        @softs = Soft.work_search(@search_work).view_search.public_true.page(params[:page]).per(10)
      end
    
    elsif @search_soft.present?
      @softs = Soft.company_search(@search_soft).public_true.page(params[:page]).per(10)
      
    elsif @search_work.present?
      @softs = Soft.work_search(@search_work).public_true.page(params[:page]).per(10)
      
    elsif @search_order.present?
      if @search_order == "new"
        @softs = Soft.create_search.public_true.page(params[:page]).per(10)
      else @search_oreder = "view" 
        @softs = Soft.view_search.public_true.page(params[:page]).per(10)
      end
    
    else
      @softs = Soft.all.public_true.page(params[:page]).per(10)
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
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :logo_image)
  end
  
end
