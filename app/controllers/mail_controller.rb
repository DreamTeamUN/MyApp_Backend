class MailController < ApplicationController

  def send
    WelcomeMailer.welcome_email.deliver
    render html: "<h1>#{ENV['gmail_username']} -- #{ENV['gmail_password']}</h1>"
  end
end
