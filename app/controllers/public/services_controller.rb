class Public::ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @search_service = params[:content]
    if @search_service.present?
      @services = Service.content_search(@search_service)
    else
      @services = Service.all
    end
  end
end
