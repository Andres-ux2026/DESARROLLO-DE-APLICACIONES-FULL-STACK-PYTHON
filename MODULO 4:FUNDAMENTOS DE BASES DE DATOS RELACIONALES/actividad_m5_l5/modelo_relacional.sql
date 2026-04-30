create table cursos (
	id serial primary key, 
	codigo varchar (10) not null unique,
	nombre varchar (50)not null,
    docente_responsable varchar (50) 
);

create table estudiantes(
	id serial primary key,
	rut varchar(12) not  null unique,
	nombre varchar (50) not null,
	correo varchar (50) unique
);

create table matriculas (
	id_matricula serial primary key,
	fecha date default current_date,
	anio integer, 
    rut_estudiante varchar (12),
    codigo_curso varchar (10),

	foreign key (rut_estudiante) references estudiantes(rut) on delete cascade,
	foreign key (codigo_curso) references cursos(codigo)
);