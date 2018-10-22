class PdfController < ApplicationController

  def reporteUsuario
    UsuarioReporter.new.reporteBasicoUsuario(params[:usuario_id])
    render html: "El reporte del usuario #{params[:usuario_id]} fue generado exitosamente"
  end
end
