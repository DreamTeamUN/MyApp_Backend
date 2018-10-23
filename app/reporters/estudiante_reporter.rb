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
      #TODO: text "Fecha Registro #{estudiante.created_at}"
      move_down @@fontsize

      EstudianteAula.where("estudiante_id == ?", estudiante_id).find_each do |aula|
        nombre_programa = Programa.find(DocentePrograma.find(Aula.find(aula.aula_id).docente_programa_id).programa_id).nombre
        text("El estudiante se encuentra registrado en #{nombre_programa}")
      end

    end
  end

end
