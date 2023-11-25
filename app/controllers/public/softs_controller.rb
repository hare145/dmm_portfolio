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
      end
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
    if @soft.save
      @soft.save_notification!(current_user, @soft.id)
      redirect_to softs_notice_path
    else
      flash[:notice_soft] = "投稿に失敗しました。"
      redirect_to softs_path
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
