class UserMailer < ApplicationMailer
  default from: 'notifications@bakebook.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.bakebook.com'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end
