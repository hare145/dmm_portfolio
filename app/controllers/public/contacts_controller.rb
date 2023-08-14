class Public::ContactsController < ApplicationController
  
  def new
  end
  
  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save!
      redirect_to contacts_notice_path
    else
      redirect_to contacts_new_path
    end
  end
  
  
  private
  
  def contact_params
    params.require(:contact).permit(:user_id, :content)
  end
end
