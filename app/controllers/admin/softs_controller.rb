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
    
    @softs = soft_all
    if @soft.present?
      @softs = @softs.company_search(@soft)
    end
    if @work.present?
      @softs = @softs.work_search(@work)
    end
    if @order.present?
      if @order == "new"
        @softs = @softs.new_search
      elsif @order == "old"
        @softs = @softs.old_search
      elsif @order == "view_many"
        @softs = @softs.view_many_search
      elsif @order == "view_few"
        @softs = @softs.view_few_search
      elsif @order == "true"
        @softs = @softs.public_true
      elsif @order == "false"
        @softs = @softs.public_false
      end
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
