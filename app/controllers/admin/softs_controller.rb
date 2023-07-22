class Admin::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    if params[:work_id] == "1"
      @softs = Soft.where(work_id: 1)
    elsif params[:work_id] == "2"
      @softs = Soft.where(work_id: 2)
    elsif params[:work_id] == "3"
      @softs = Soft.where(work_id: 3)
    else  
     @softs = Soft.all
    end
  end

  def show
    @soft = Soft.find(params[:id])
    @soft_comments = SoftComment.where(id: params[:id])
    
  end

  def edit
   @soft = Soft.find(params[:id])
  end


  def create
    @soft = Soft.new
    @soft.user_id = current_admin.id
    @soft.save(soft_params)
    redirect_to admin_softs_path(@soft)
  end

  def update
    @soft = Soft.find(params[:id])
    @soft.update(soft_parans)
    redirect_to admin_softs_path(@soft)
  end

  
  
  private
  
  def soft_params
    params.require(:soft).permit(:user_id, :work_id, :company, :address, :url,
    :introduction, :first_cost, :month_cost, :year_cost, :function, :is_public)
  end
end
