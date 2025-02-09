# Tablas
* modules: Contiene los diferentes tipos de modulos de cada tipo de courses, esto permite que cada course puede tener diferentes tipos de modulos o añadir nuevos modulos sin tocar la estructura.
* * module_id
* * module_name
* * descripcion
* * cost
* courses: Tabla que indica las ediciones de cada curso, que son las distintas ediciones
* * course_id
* * course_name
* * course_start
* * course_end
* * descripcion
* * course_tipoPres
* teachers: tabla que contiene a los diferentes docentes de cada curso y sus datos
* * teach_id
* * teach_firstname
* * teach_lastname
* * teach_email
* * teach_phone
* alumns: Contiene la información de los alumnos
* * alum_id
* * a_firstname
* * a_lastname
* * a_email
* * a_phone
* alumnsCourse: Contiene la información de los alumnos inscritos en cada curso
* * ac_id
* * FK --> alum_id
* * FK --> course_id
* courseModule: Almacena las relaciones de cada modulo en el course y el profesor, en cada edición estos tres datos pueden cambiar, se pueden tener diferentes modulos por cada curso, así como diferentes profesores y diferentes fechas, así que por eso he creado una tabla independiente. Ademas el identificador único de esta tabla sirve para que los alumnos en cada modulo puedan luego vincularse para la nota y para su asistencia. Este es como el indice de actividaes.
* * cm_id
* * FK --> teach_id 
* * FK --> module_id
* * FK --> course_id
* * start_date
* * end_date
* * course_tipoPres
* asistmodalum: Contiene la asistencia del alumno a cada actividad de cada curso
* * amd_id
* * percentAsist
* * FK --> cm_id
* * FK --> alum_id
* notasAlumModul: Notas de cada alumno por cada modulo
* * nam_id
* * notaalum
* * FK --> cm_id
* * FK --> alum_id



