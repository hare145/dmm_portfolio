class Public::DammesController < ApplicationController
  
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

private
  
  def soft_all
    Soft.all.public_true.page(params[:page]).per(10)
  end

end