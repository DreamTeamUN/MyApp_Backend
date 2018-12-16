# Yo Soy Muy Inteligente (BackEnd)

Navigation: [Website][1] | [FrontEnd repository][2] | **BackEnd repository**

  [1]: https://github.com/DreamTeamUN
  [2]: https://github.com/DreamTeamUN/YoSoyMuyInteligente_FrontEnd

* Ruby  version 2.4.0
* Rails version 5.2.1

**Uso:**

* **Estudiantes**
Los estudiantes son entidades asiciadas a un tutor los cuales pueden inscribirse en las aulas y tomar las diferentes lecciones.
  * Creación
Para crear una entrada se utiliza la ruta:
`/tutors/:tutor_id/estudiantes`
    * ***:tutor_id*** es el id del tutor del nuevo estudiante (no olvidar que el id del tutor no es necesariamente igual al id de usuario).

    Adicionalmente es necesario pasar un objeto *JSON* llamado estudiante con los campos:
    * **nombre** Nombre del nuevo estudiante (Entre 3 a 45 caracteres).
    * **fecha_nacimiento** (*opcional*) Fecha de nacimiento del nuevo estudiante.
    * **archivo_id** (*opcional*) Es el archivo usado como imagen de perfil del usuario, el usado por default es el id de archivo *0*.
    
* **Foro**
El foro se maneja haciendo uso de entradas.
Existe una entrada con id *0* la cual funciona como raiz de todas las demas entradas funcionan como comentarios de otras entradas (la máxima ramificación es de 3).
  * Creación
Para crear una entrada se utiliza la ruta:
`/usuarios/:usuario_id/entradas/:entrada_id/entradas`
    * ***:usuario_id*** es el id del usuario autor de la entrada.
    * ***:entrada_id*** es el id de la entrada sobre la cual será comentada, en caso de ser el inicio de un nuevo tema el id debe ser *0*.

    Adicionalmente es necesario pasar un objeto *JSON* llamado entrada con los campos:
    * **nivel_acceso_id** id referente a el nivel de acceso que tendrán los demas usuarios sobre la entrada, si el acceso será publico el id debe ser *0*.
    * **titulo** es el titulo que aparecerá en la entrada
    (No puede ser menor a 5 caracteres, ni mayor a 20 caracteres).
    * **resumen** es un breve resumen de lo que trata la entrada
    (No puede ser mayor a 40 caracteres).
    * **texto** el texto a almacenar en la entrada, en caso de no pasar este parametro el texto guardado será vacio.

    En caso de ser necesario se pueden adicionar los campos de *abierto* y *publicado* los cuales son del tipo booleano, o estos mismos campos pueden ser modificados posteriormente con un *Patch*

  * **Index**
Para poder listar las entradas se hace uso de la ruta:
`/entradas/:tipo/:id/:page`
    * **:tipo** Hace referencia al filtro que será aplicado en la busqueda de entradas, estos pueden ser:
      * **1** Por nivel de acceso.
      * **2** Por autor (usuario).
      * **3** Por entrada padre.
     * **:id** Es el id del objeto referenciado por **:tipo**.
     * **:page** Es la pagina solicitada para las entradas, estas tienen un tamaño de 10 entradas.
