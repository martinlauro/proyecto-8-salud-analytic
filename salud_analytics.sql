-- ================================================
-- PROYECTO: Análisis de Clínica - Sector Salud
-- Autor: Martin Lauro
-- Base de datos: SQL Server
-- ================================================

-- 1. CREAR BASE DE DATOS
CREATE DATABASE salud_analytics;
GO
USE salud_analytics;
GO

-- ================================================
-- 2. CREAR TABLAS
-- ================================================

CREATE TABLE especialidades (
    id_especialidad  INT PRIMARY KEY IDENTITY(1,1),
    nombre           VARCHAR(50) NOT NULL,
    descripcion      VARCHAR(200)
);

CREATE TABLE medicos (
    id_medico        INT PRIMARY KEY IDENTITY(1,1),
    nombre           VARCHAR(50) NOT NULL,
    apellido         VARCHAR(50) NOT NULL,
    id_especialidad  INT NOT NULL,
    matricula        VARCHAR(20) NOT NULL UNIQUE,
    pais             VARCHAR(30) DEFAULT 'Argentina',
    FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad)
);

CREATE TABLE pacientes (
    id_paciente      INT PRIMARY KEY IDENTITY(1,1),
    nombre           VARCHAR(50) NOT NULL,
    apellido         VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero           VARCHAR(10) CHECK (genero IN ('Masculino','Femenino')),
    pais             VARCHAR(30) DEFAULT 'Argentina',
    obra_social      VARCHAR(50)
);

CREATE TABLE turnos (
    id_turno         INT PRIMARY KEY IDENTITY(1,1),
    id_paciente      INT NOT NULL,
    id_medico        INT NOT NULL,
    fecha            DATE NOT NULL,
    hora             TIME NOT NULL,
    estado           VARCHAR(20) CHECK (estado IN ('Realizado','Cancelado','Ausente')),
    motivo           VARCHAR(100),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente