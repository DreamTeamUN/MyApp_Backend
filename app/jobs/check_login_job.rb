class CheckLoginJob < ApplicationJob
  queue_as :default

  def perform(user)
    RecordatorioMailer.with(usuario: user).recordatorio_email.deliver
  end
end
