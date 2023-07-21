class Public::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    @softs = Soft.all
  end

  def show
    @soft = Soft.find(params[:id])
    @soft_comments = SoftComment.where(id: params[:id])
    
  end

  def create
    @soft = Soft.new
    @soft.save(soft_parans)
    redirect_to softs_notice_path
  end

  def notice
  end
  
  
  
  private
  
  def soft_parans
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function)
  end
  
end
