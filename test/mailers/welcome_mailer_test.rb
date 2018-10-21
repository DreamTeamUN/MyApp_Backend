require 'test_helper'

class WelcomeMailerTest < ActionMailer::Preview
  def mail_preview
    WelcomeMailer.mail_preview(User.first)
  end
end
