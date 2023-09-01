class Admin::ServicesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @service = Service.new
    @search_service = params[:content]
    if @search_service.present?
      @services = Service.content_search(@search_service)
    else
      @services = Service.all
    end
  end

  def edit
    @service = Service.find(params[:id])
  end
  
  def create
    @service = Service.new(service_params)
    @service.save
    redirect_to admin_services_path
  end
  
  def update
    @service = Service.find(params[:id])
    @servive.update(service_params)
    redirect_to :index
  end
  
  def destroy
    
  end
  
  
  private
  
  def service_params
    params.require(:service).permit(:content)
  end
  
end
