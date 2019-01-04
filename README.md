# Yo Soy Muy Inteligente (BackEnd)

Navigation: [Website][1] | [FrontEnd repository][2] | **BackEnd repository**

  [1]: https://github.com/DreamTeamUN
  [2]: https://github.com/DreamTeamUN/YoSoyMuyInteligente_FrontEnd

* Ruby  version 2.4.0
* Rails version 5.2.1

**Uso:**
* **Aulas**
Las aulas son las entidades donde se agrupan a los estudiantes para poder impartir las lecciones designadas, cada aula esta asignada a un *Programa* unico y esta a cargo de un *Docente*.

  * **Create**
Para crear un *Aula* es necesario hacer una peticion *POST* a la ruta:
`/docente_programas/:docente_programa_id/aulas`
    * ***:docente_programa_id*** Es el id de la entidad que verifica que un docente determinado imparte un programa.

  * **Index**
Para poder listar las aulas se hace una peticion *GET* a la ruta:
`/aulas/:tipo/:id/:page`
    * **:tipo** Hace referencia al filtro que será aplicado en la busqueda de aulas, estos pueden ser:
      * **1** Por programa.
      * **2** Por docente.
     * **:id** Es el id del objeto referenciado por **:tipo**.
     * **:page** Es la pagina solicitada para las aulas, estas tienen un tamaño de 10 aulas.

  * **Show**
Para visualizar un *Aula* en particular se hace una petición *GET* a la ruta:
`/aulas/:id`
    * **:id** Es el id

    *(Al visualizar un Aula, uno de los campos devueltos por el **API** es el de estudiante el cual es un objeto *JSON* con los estudiantes matriculados al Aula.)*

* **Docente_Programa**
Las entidades *Docente_Programa* existen para confirmar que un docente dado tiene permitido dar cierto programa, por lo que es necesario que exista esta entidad para que crear posteriormente un *Aula*.

  * **Create**
Para crear esta entidad se hace una peticion *POST* a la ruta:
`/programas/:programa_id/docentes/:docente_id/docente_programas`
    * ***:programa_id*** Programa al cual se va a hacer la autorizacion.
    * ***:docente_id*** Docente al cual se va a hacer la autorizacion.

* **Estudiantes**
Los estudiantes son entidades asiciadas a un tutor los cuales pueden inscribirse en las aulas y tomar las diferentes lecciones.
  * **Create**
Para crear una entrada se hace una peticion *POST* a la ruta:
`/tutors/:tutor_id/estudiantes`
    * ***:tutor_id*** es el id del tutor del nuevo estudiante (no olvidar que el id del tutor no es necesariamente igual al id de usuario).

    Adicionalmente es necesario pasar un objeto *JSON* llamado estudiante con los campos:
    * **nombre** Nombre del nuevo estudiante (Entre 3 a 45 caracteres).
    * **fecha_nacimiento** (*opcional*) Fecha de nacimiento del nuevo estudiante.
    * **archivo_id** (*opcional*) Es el archivo usado como imagen de perfil del usuario, el usado por default es el id de archivo *0*.

  * **Index**
Los estudiantes son listados para un tutor en particular, para hacer esto se hace una peticion *GET* a la ruta:
`/tutors/:tutor_id/estudiantes`
    * ***:tutor_id*** es el id del tutor a los que se les van a listar los estudiantes.

* **Estudiante_Aula**
Esta entidad crea la relacion *Estudiante_Aula* la cual valida hace que un *Estudiante* se encuentre matriculado a un *Aula* particular.

  * **Create**
Para crear un *Estudiante_Aula* se hace una peticion *POST* a la ruta:
`/estudiantes/:estudiante_id/aulas/:aula_id/estudiante_aulas`

    * **:estudiante_id** Es el id del estudiante que va a ser matriculado.
    * **:aula_id** Es el id del aula a la cual será matriculado.

* **Foro**
El foro se maneja haciendo uso de entradas.
Existe una entrada con id *0* la cual funciona como raiz de todas las demas entradas funcionan como comentarios de otras entradas (la máxima ramificación es de 3).
  * **Create**
Para crear una entrada se envia una peticion *POST* a la ruta:
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
Para poder listar las entradas se hace una peticion *GET* a la ruta:
`/entradas/:tipo/:id/:page`
    * **:tipo** Hace referencia al filtro que será aplicado en la busqueda de entradas, estos pueden ser:
      * **1** Por nivel de acceso.
      * **2** Por autor (usuario).
      * **3** Por entrada padre.
     * **:id** Es el id del objeto referenciado por **:tipo**.
     * **:page** Es la pagina solicitada para las entradas, estas tienen un tamaño de 10 entradas.
