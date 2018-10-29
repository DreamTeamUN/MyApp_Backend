class WelcomeMailer < ApplicationMailer


  def welcome_email
    @user = params[:usuario]
    @src = "#{Rails.root.join("/app/views/welcome_mailer")}"
    mail(to: @user.email, subject: "Bienvenido #{@user.nombre} a Yo Soy Muy Inteligente")
  end

end
