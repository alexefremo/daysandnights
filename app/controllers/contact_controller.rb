class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(contact_params)
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(contact_path, :notice => "Message was successfully sent.")
    else
      redirect_to(contact_path, :notice => "Please fill all fields.")
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:message).permit(:name, :email, :position, :comment, :form_sender)
    end

end
