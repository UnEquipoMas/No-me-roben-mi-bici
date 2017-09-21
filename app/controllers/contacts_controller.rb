class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(message_params)

    if @contact.valid?
      MessageMailer.new_message(@contact).deliver
      redirect_to contact_path, notice: "Tu mensaje ha sido enviado."
    else
      flash[:alert] = "Se ha producido un error la envair tu mensaje @contact."
      render :new
    end
  end

  private

  def message_params
    params.require(:contact).permit(:name, :email, :content)
  end

end