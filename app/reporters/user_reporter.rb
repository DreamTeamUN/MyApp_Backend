require 'fileutils'

class UserReporter

  @@size = 15
  @@ident = 20

  def basic_report (usuario_id)
    FileUtils::mkdir_p "public/PDFs/test/"

    usuario = Usuario.find(usuario_id)

    Prawn::Document.generate("public/PDFs/test/test.pdf") do
      font "Times-Roman"
      font_size @@size
      formatted_text [
        {text: "Este es el resumen del usuario "},
        {text: "#{usuario.nombre}", styles: [:bold]},

      ], align: :center

      move_down 2*@@size

      text "User:   #{usuario.user}"
      text "Nombre: #{usuario.nombre}"
      text "Correo: #{usuario.email}"
      text "Fecha Registro #{usuario.created_at}"
      text "Su tipo de Usuario es: #{usuario.tipo_usuario.nombre}"
      move_down @@size

      case usuario.tipo_usuario_id
      when 1 #Tutor

        text "Tiene #{usuario.tutor.estudiante.count} estudiantes registados"
        move_down @@size
        usuario.tutor.estudiante.each do |estudiante|
          text "#{estudiante.nombre}", :indent_paragraphs => 20
        end
        move_down @@size

      when 2

        text "Las aulas que tiene a cargo son:"

        DocentePrograma.where("docente_id == ?", usuario.docente.id).find_each do |relacion|
          text "#{relacion.programa.nombre}: #{relacion.aula.count} aulas", :indent_paragraphs => @@ident
          move_down @@size/2

          i = 1
          relacion.aula.each do |aula|
            estudiantes = EstudianteAula.where("aula_id == ?", aula.id).count
            text "- Aula #{i}: #{estudiantes} estudiantes", :indent_paragraphs => 1.5*@@ident
            i += 1
          end
          move_down @@size/2

        end
        move_down @@size

      end

      text "El usuario tiene #{usuario.entrada.count} entradas"

    end
  end

end
