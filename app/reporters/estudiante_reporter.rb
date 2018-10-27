require 'fileutils'

class EstudianteReporter < Reporter

  def reporteBasicoEstudiante (estudiante_id)
    FileUtils::mkdir_p @@path

    estudiante = Estudiante.find(estudiante_id)

    Prawn::Document.generate("#{@@path}reporteBasicoEstudiante#{estudiante_id}.pdf") do
      font @@font
      font_size @@fontsize

      formatted_text [
        {text: "Este es el resumen del estudiante "},
        {text: "#{estudiante.nombre}", styles: [:bold]},
      ], align: :center

      move_down 2*@@fontsize

      text "Nombre: #{estudiante.nombre}"
      text "Tutor: #{estudiante.tutor.usuario.nombre}"
      text "Fecha Registro: #{estudiante.created_at}"
      move_down @@fontsize

      aulas = estudiante.aula
      text "El estudiante se encuentra registrado en #{aulas.count} aulas"
      move_down @@fontsize/2

      aulas.each do |aula|
        text "Programa: #{aula.programa.nombre}", :indent_paragraphs => @@ident
        text "Docente: #{aula.docente.usuario.nombre}", :indent_paragraphs => @@ident
        move_down @@fontsize/2
      end

      ##TODO: Progresos y Puntuaciones

    end
  end

end
