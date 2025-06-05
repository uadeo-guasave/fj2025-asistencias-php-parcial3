/* prompt: escribe el script DDL para una base de datos que llevará el control de asistencias grupales para docentes que imparten clases en diversos dias de la semana, contempla, docentes, alumnos, asignaturas, grupos y asistencias, la base de datos llamala asistenciasdb */

CREATE DATABASE IF NOT EXISTS asistenciasdb
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;
USE asistenciasdb;

-- Tabla de docentes
CREATE TABLE docentes (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    remember_token VARCHAR(255),
    id_docente INT,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente)
);

-- Tabla de alumnos
CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabla de asignaturas
CREATE TABLE asignaturas (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de grupos
CREATE TABLE grupos (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_asignatura INT NOT NULL,
    id_docente INT NOT NULL,
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura),
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente)
);

-- Tabla de relación alumnos-grupos
CREATE TABLE alumnos_grupos (
    id_alumno INT NOT NULL,
    id_grupo INT NOT NULL,
    PRIMARY KEY (id_alumno, id_grupo),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);

-- Tabla de asistencias
CREATE TABLE asistencias (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);


-- registros
-- Insertar 3 docentes
INSERT INTO docentes (nombre, apellido, email) VALUES
('Ana', 'García', 'ana.garcia@ejemplo.com'),
('Luis', 'Pérez', 'luis.perez@ejemplo.com'),
('Marta', 'López', 'marta.lopez@ejemplo.com');

-- Insertar 3 usuarios vinculados a los docentes
INSERT INTO usuarios (username, password, email, id_docente) VALUES
('ana.garcia', 'password1', 'ana.garcia@ejemplo.com', 1),
('luis.perez', 'password2', 'luis.perez@ejemplo.com', 2),
('marta.lopez', 'password3', 'marta.lopez@ejemplo.com', 3);