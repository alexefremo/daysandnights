class NotificationsMailer < ActionMailer::Base
  default :from => "noreply@daysandnights.nl"
  default :to => "contact@daysandnights.nl"

  def new_message(message)
    @message = message
    mail(:subject => "[DN] #{message.subject}")
  end
end
