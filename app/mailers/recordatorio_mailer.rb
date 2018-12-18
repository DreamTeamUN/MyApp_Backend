class RecordatorioMailer < ApplicationMailer


  def recordatorio_email
    @user = params[:usuario]
    @src = "#{Rails.root.join("/app/views/recordatorio_mailer")}"
    mail(to: @user.email, subject: "#{@user.nombre} no pares de aprender")
  end

end
