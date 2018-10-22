require 'fileutils'

class UsuarioReporter < Reporter

  def reporteBasicoUsuario (usuario_id)
    FileUtils::mkdir_p @@path

    usuario = Usuario.find(usuario_id)

    Prawn::Document.generate("#{@@path}reporteBasicoUsuario#{usuario_id}.pdf") do
      font @@font
      font_size @@fontsize

      formatted_text [
        {text: "Este es el resumen del usuario "},
        {text: "#{usuario.nombre}", styles: [:bold]},
      ], align: :center

      move_down 2*@@fontsize

      text "User:   #{usuario.user}"
      text "Nombre: #{usuario.nombre}"
      text "Correo: #{usuario.email}"
      text "Fecha Registro #{usuario.created_at}"
      text "Su tipo de Usuario es: #{usuario.tipo_usuario.nombre}"
      move_down @@fontsize

      case usuario.tipo_usuario_id
      when 1 #Tutor

        text "Tiene #{usuario.tutor.estudiante.count} estudiantes registados"
        move_down @@fontsize
        usuario.tutor.estudiante.each do |estudiante|
          text "#{estudiante.nombre}", :indent_paragraphs => @@ident
        end
        move_down @@fontsize

      when 2

        text "Las aulas que tiene a cargo son:"
        move_down @@fontsize/2
        DocentePrograma.where("docente_id == ?", usuario.docente.id).find_each do |relacion|
          text "#{relacion.programa.nombre}: #{relacion.aula.count} aulas", :indent_paragraphs => @@ident
        end
        move_down @@fontsize/2

      end

      text "El usuario tiene #{usuario.entrada.count} entradas"

    end
  end

end
