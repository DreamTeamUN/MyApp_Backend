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

        estudiantes = usuario.tutor.estudiante
        text "Tiene #{estudiantes.count} estudiantes registados"
        move_down @@fontsize
        estudiantes.each do |estudiante|
          text "#{estudiante.nombre}", :indent_paragraphs => @@ident
        end
        move_down @@fontsize

      when 2 #Docente

        aulas = usuario.docente.aula
        text "Tiene #{aulas.count} aulas a cargo"
        move_down @@fontsize/2
        aulas.each do |aula|
          text "Programa: #{aula.programa.nombre}, #{aula.estudiante.count} estudiantes", :indent_paragraphs => @@ident
        end
        move_down @@fontsize/2

      end

      entradas = usuario.entrada
      text "El usuario tiene #{entradas.count} entradas"
      move_down @@fontsize

      entradas.each do |entrada|
        text "#{entrada.titulo}", :indent_paragraphs => @@ident
        indent @@ident*1.5, @@ident*1.5 do #Para identar por ambos lados
          text "#{entrada.resumen}"
        end
        move_down @@fontsize
      end

    end
  end

end
