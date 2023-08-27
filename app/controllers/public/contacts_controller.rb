class Public::ContactsController < ApplicationController
  
  def new
    if user_signed_in?
      @contact = current_user.contacts.new
    end
  end
  
  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save!
      redirect_to contacts_notice_path
    else
      redirect_to contacts_new_path
    end
  end
  
  def notice
    
  end
  
  
  private
  
  def contact_params
    params.require(:contact).permit(:content, :user_id)
  end
end
