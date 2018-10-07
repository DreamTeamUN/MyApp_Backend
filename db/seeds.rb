# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do
  TipoUsuario.create(nombre: "Tutor")
  TipoUsuario.create(nombre: "Docente")
  TipoUsuario.create(nombre: "Estudiante")
end
1.times do
  Programa.create(nombre: "Lectura")
end


1.times do
  TipoActividad.create(nombre: "Login", descripcion: "Hacer Login en la app")

  TipoActividad.create(nombre: "Logout", descripcion: "Hacer Logout en la app")

  TipoActividad.create(nombre: "Jugar", descripcion: "Jugar juego de retroalimentacion de las sesiones")

  TipoActividad.create(nombre: "Inicio Leccion", descripcion: "empezar la leccion semanal")

  TipoActividad.create(nombre: "crear foro", descripcion: "postear en foro")
end





i = 0
24.times do
  i = i+1
  Leccion.create(
    programa_id: 1,
    semana: i
  )
end
