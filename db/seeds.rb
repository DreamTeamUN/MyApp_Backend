# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

1.times do

  TipoUsuario.create(id: 0, nombre: "Sistema")
  TipoUsuario.create(nombre: "Tutor")
  TipoUsuario.create(nombre: "Docente")

  Programa.create(nombre: "Lectura")

  TipoActividad.create(nombre: "LogIn", descripcion: "Inicio de sesión en la aplicacion")
  TipoActividad.create(nombre: "LogOut", descripcion: "Finalizar sesión en la aplicacion")
  TipoActividad.create(nombre: "Inicio Leccion", descripcion: "Inicia una nueva repeticion de una leccion")
  TipoActividad.create(nombre: "Jugar", descripcion: "Empieza un nuevo juego")
  TipoActividad.create(nombre: "Crear entrada", descripcion: "Crea una nueva entrada para el foro")
  TipoActividad.create(nombre: "Publicar entrada", descripcion: "Publica una entrada previamente creada")
  TipoActividad.create(nombre: "Ver Estudiante", descripcion: "Revisa los datos relacionados a un estudiante")
  TipoActividad.create(nombre: "Dictar programa", descripcion: "Habilita un docente para dictar un nuevo programa")
  TipoActividad.create(nombre: "Crear aula", descripcion: "Crea una nueva aula para los estudiantes")
  TipoActividad.create(nombre: "Inscribir estudiante", descripcion: "Inscribe un estudiante a un aula creada")
  TipoActividad.create(nombre: "Eliminar estudiante", descripcion: "Elimina a un estudiante de un aula a la que esta inscrito")
  TipoActividad.create(nombre: "Eliminar Aula", descripcion: "Elimina un aula existente")

  Archivo.create(id: 0, nombre: "default", tipo_archivo: "imagen", extension: "png", ruta: "/")

  NivelAcceso.create(id: 0, nombre: "PUBLICO")

  Usuario.create(id: 0, user: "sistema", password:"sistema", password_confirmation:"sistema",
          nombre: "sistema", email:"localhost@localhost.com", tipo_usuario_id: 0, archivo_id:0)

  o = Entrada.new(
    id: 0,
    publicado: false,
    abierto: false,
    ramificacion: 0,
    archivo_id: 0,
    nivel_acceso_id:0,
    usuario_id: 0
  )
  o.save!(:validate => false)

end

i = 0
24.times do
  i = i+1
  Leccion.create(
    programa_id: 1,
    semana: i
  )
end
