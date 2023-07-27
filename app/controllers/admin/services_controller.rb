class Admin::ServicesController < ApplicationController
  def index
    @service = Service.new
    @services = Service.all
  end

  def edit
  end
  
  def create
    @service = Service.new(service_params)
    @service.save
    redirect_to admin_services_path
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def service_params
    params.require(:service).permit(:content)
  end
  
end
