class Admin::ContactsController < ApplicationController
  def index
    if params[:is_cheacked] == false
      @contacts = Contact.where(is_cheacked: false)
    else
      @contacts = Contact.all
    end
  end

  def update
    @contact = Contact.find(params[:id])
     if @contact.update!(contact_params)
      redirect_to admin_contacts
     end
  end
  
  
  
  private
  
  def contact_params
    params.require(:contact).permit(:is_cheacked)
  end
end
