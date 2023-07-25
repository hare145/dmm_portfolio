class Public::SoftsController < ApplicationController
  def new
    @soft = Soft.new
  end
  
  def index
    @works = Work.all
    if params[:work_id] == "1"
      @softs = Soft.where(work_id: 1, is_public: true)
    elsif params[:work_id] == "2"
      @softs = Soft.where(work_id: 2, is_public: true)
    elsif params[:work_id] == "3"
      @softs = Soft.where(work_id: 3, is_public: true)
    else  
     @softs = Soft.where(is_public: true)
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
