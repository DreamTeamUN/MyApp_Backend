class WelcomeMailer < ApplicationMailer

  default from: 'adcorredorm@unal.edu.co'

  def welcome_email
    mail(to: 'adcorredorm@unal.edu.co', subject: 'Welcome to My Awesome Site')
  end

end
