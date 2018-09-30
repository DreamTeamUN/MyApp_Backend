# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
array_archivos = ["archivo","imagen","audio"]
array_extension = ["mp3","html","png","jpg","jpeg","pdf"]
30.times do
  ext = array_extension.sample
  nomb = Faker::Cat.name
  Archivo.create(
    nombre: nomb,
    tipo_archivo: array_archivos.sample,
    extension: ext,
    ruta: Faker::File.file_name('foo/bar', nomb, ext)
  )
end
30.times do
  Usuario.create(
   user: Faker::Pokemon.unique.name,
    password: Faker::Alphanumeric.alphanumeric(255),
    nombre: Faker::OnePiece.character,
    correo: Faker::Internet.unique.email,
    fecha_nacimiento: Faker::Date.birthday(3, 65),
    archivo_id: Faker::Number.unique.within(1..30),
    tipo_usuario_id: Faker::Number.within(1..3)
  )
end

30.times do
  FrasePnl.create(
    frase: Faker::Lorem.unique.sentence,
    tipo_usuario_id: Faker::Number.within(1..3)
  )
end

10.times do
  Docente.create(
    usuario_id: Faker::Number.unique.within(1..20)
  )

end

10.times do
  Tutor.create(
    usuario_id: Faker::Number.unique.within(1..20)
  )
end
10.times do
  Estudiante.create(
    tutor_id: Faker::Number.within(1..10),
    usuario_id: Faker::Number.unique.within(21..30)
  )
end
30.times do
  RegistroActividad.create(
    usuario_id: Faker::Number.within(1..30),
    tipo_actividad_id: Faker::Number.within(1..5)
  )
end

24.times do
  Leccion.create(
    programa_id: 1,
    semana: Faker::Number.within(1..24)
  )
end

30.times do
  Frase.create(
    leccion_id: Faker::Number.within(1..24),
    frase: Faker::Lorem.unique.sentence,
  )
end

30.times do
  ArchivoJuego.create(
    tipo_juego_id: Faker::Number.within(1..3),
    archivo_id: Faker::Number.unique.within(2..31),
    frase_id: Faker::Number.within(1..30)
  )
end

30.times do
  Puntuacion.create(
    puntuacion_obtenida: Faker::Number.within(1..10),
    tipo_juego_id: Faker::Number.within(1..3),
    estudiante_id: Faker::Number.within(1..10),
    leccion_id: Faker::Number.within(1..24)
  )
end

10.times do
  Progreso.create(
    repeticion_completada: Faker::Number.within(0..5),
    estudiante_id: Faker::Number.unique.within(1..10),
    leccion_id: Faker::Number.unique.within(1..24)
  )
end

10.times do
  DocentePrograma.create(
    docente_id: Faker::Number.unique.within(1..10),
    programa_id: 1
  )
end

10.times do
  Aula.create(
    docente_programa_id: Faker::Number.unique.within(1..10)
  )
end

10.times do
  EstudianteAula.create(
    aula_id: Faker::Number.within(1..10),
    estudiante_id: Faker::Number.within(1..10)
  )
end



30.times do
  NivelAcceso.create(
    nombre: Faker::ChuckNorris.unique.fact
  )
end
10.times do
  Entrada.create(
    publicado: Faker::Boolean.boolean,
    abierto: Faker::Boolean.boolean,
    ramificacion: Faker::Number.within(1..3),
    archivo_id: Faker::Number.unique.within(2..31),
    nivel_acceso_id:Faker::Number.within(1..10),
    usuario_id: Faker::Number.within(1..30),
    entrada_id: Faker::Number.within(1..2),
  )
end
