class PaswordMailer < ApplicationMailer


  def password_email
    @user = params[:usuario]
    @src = "#{Rails.root.join("/app/views/welcome_mailer")}"
    mail(to: @user.email, subject: "Se ha detectado un cambio de contraseña")
  end

end
