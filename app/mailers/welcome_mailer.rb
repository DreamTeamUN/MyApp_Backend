class WelcomeMailer < ApplicationMailer

  default from: 'adcorredorm@unal.edu.co'

  def welcome_email
    @user = params[:usuario]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
