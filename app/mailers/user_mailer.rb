class UserMailer < ActionMailer::Base
  default :from => "contact@daysandnights.nl"

  def welcome_email(user)
    @user = user
    @url  = 'http://daysandnights.nl'
    mail(to: @user.email, subject: 'New event on Days&Nights')
  end
end
