class Admin::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    if params[:company].present?
      @softs = Soft.where("name LIKE?","%#{params[:company]}%")
      if params[:work_id] == "#{params[:id]}"
        @softs.where(work_id: params[:id])
      else  
       @softs = Soft.all
      end
    else
      @softs = Soft.all
      if params[:work_id] == "#{params[:id]}"
        @softs.where(work_id: params[:id])
      else  
       @softs = Soft.all
      end
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
    @soft = Soft.new(soft_params)
    @soft.user_id = current_admin.id
    @soft.save
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
    :introduction, :first_cost, :month_cost, :year_cost, :function, :founding, :is_public, :logo_image)
  end
end
