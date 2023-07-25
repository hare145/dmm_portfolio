class Public::FacilitiesController < ApplicationController
  def index
    if params[:name].present?
      @users = User.where("name LIKE?","%#{params[:name]}%")
    else
      @users = User.all
    end
  end

  def show
  #   @viwe = User.find(params[:id])
  # 　impressionist(@view, nil, unique: [:ip_address]) 閲覧
  end
end
