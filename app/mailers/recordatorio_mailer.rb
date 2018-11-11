class RecordatorioMailer < ApplicationMailer


  def recordatorio_email
    @user = params[:usuario]
    @src = "#{Rails.root.join("/app/views/welcome_mailer")}"
    mail(to: @user.email, subject: "Te esperamos en Yo Soy Muy Inteligente")
  end

end
