class CheckLoginJob < ApplicationJob
  queue_as :default

  def perform(user)
    RecordatorioMailer.with(usuario: @usuario).recordatorio_email.deliver
  end
end
