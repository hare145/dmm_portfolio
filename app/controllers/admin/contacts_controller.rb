class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def index
    if params[:is_checked] == "false"
      @contacts = Contact.where(is_checked: false).page(params[:page]).per(15)
    else
      @contacts = Contact.all.page(params[:page]).per(20)
    end
  end

  def update
    @contact = Contact.find(params[:id])
     if @contact.update!(contact_params)
      redirect_to admin_contacts_path
     end
  end
  
  
  
  private
  
  def contact_params
    params.permit(:is_checked)
  end
end
