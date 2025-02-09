-- Creación de la bbdd (se crea con pgadmin y propietario root)
CREATE DATABASE "practSQLMAF"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- creamos la tabla teachers
create table teachers (
    teach_id serial primary key,
    teach_firstname varchar(255),
    teach_lastname varchar(255),
    teach_email varchar(255),
    teach_phone varchar(255)
);

ALTER TABLE teachers
ADD CONSTRAINT unique_teach_email UNIQUE(teach_email);
ALTER TABLE teachers
ALTER COLUMN teach_email SET NOT NULL;

ALTER TABLE teachers
ADD CONSTRAINT unique_teach_phone UNIQUE(teach_phone);
ALTER TABLE teachers
ALTER COLUMN teach_phone SET NOT NULL;


-- creamos la tabla alumns
create table alumns (
    alumn_id serial primary key,
    alumn_firstname varchar(255),
    alumn_lastname varchar(255),
    alumn_email varchar(255),
    alumn_phone varchar(255)
);

ALTER TABLE alumns
ADD CONSTRAINT unique_alumn_email UNIQUE(alumn_email);
ALTER TABLE alumns
ALTER COLUMN alumn_email SET NOT NULL;

ALTER TABLE alumns
ADD CONSTRAINT unique_alumn_phone UNIQUE(alumn_phone);
ALTER TABLE alumns
ALTER COLUMN alumn_phone SET NOT NULL;


-- creamos la tabla modules
create table modules (
    module_id serial primary key,
    module_name varchar(255),
    descripcion TEXT,
    cost numeric(10,2)
);



-- creamos la tabla courses
create table courses (
    course_id serial primary key,
    course_name varchar(255),
    course_start DATE,
    course_end DATE,
    descripcion TEXT
);

-- creamos la tabla courseModule
create table courseModule (
    cm_id serial primary key,
    teach_id INT,
    module_id INT,
    course_id INT,
    FOREIGN KEY (teach_id) REFERENCES teachers(teach_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    start_date_module DATE,
    end_date_module DATE,
    course_tipoPres varchar(255)
);


-- creamos la tabla alumnsCourse
create table alumnsCourse (
    ac_id serial primary key,
    course_id INT,
    alumn_id INT, 
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (alumn_id) REFERENCES alumns(alumn_id)
);


-- creamos la tabla notaslAlumModul
create table notaslAlumModul (
    nam_id serial primary key,
    notaalumn INT,
    cm_id INT,
    alumn_id INT,
    FOREIGN KEY (cm_id) REFERENCES courseModule(cm_id),
    FOREIGN KEY (alumn_id) REFERENCES alumns(alumn_id)
);


-- creamos la tabla asistmodalum
create table xxx (
    amd_id serial primary key,
    percentAsist INT,
    cm_id INT,
    alumn_id INT,
    FOREIGN KEY (cm_id) REFERENCES courseModule(cm_id),
    FOREIGN KEY (alumn_id) REFERENCES alumns(alumn_id)
);


