class Public::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    @search_soft = params[:company]
    @search_work = params[:work_id]
    if @search_soft.present? && @search_work.present?
      @softs = Soft.where("company LIKE?","%#{@search_soft}%").where(work_id: @search_work)
    elsif @search_soft.present?
      @softs = Soft.where("company LIKE?","%#{@search_soft}%")
    elsif @search_work.present?
      @softs = Soft.where(work_id: @search_work)
    else
      @softs = Soft.all
    end
  end

  def show
    @soft = Soft.find(params[:id])
    @soft_comments = SoftComment.where(id: params[:id])
  end

  def create
    @soft = Soft.new(soft_params)
    @soft.user_id = current_user.id
    @soft.save
    redirect_to softs_notice_path
  end

  def notice
  end
  
  
  
  private
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :logo_image)
  end
  
end
