DROP TABLE IF EXISTS detalle_prestamo CASCADE;
DROP TABLE IF EXISTS prestamo CASCADE;
DROP TABLE IF EXISTS equipo CASCADE;
DROP TABLE IF EXISTS prestatario CASCADE;

CREATE TABLE prestatario (
    id_prestatario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE equipo (
    id_equipo SERIAL PRIMARY KEY,
    codigo_equipo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE prestamo (
    id_prestamo SERIAL PRIMARY KEY,
    numero_prestamo VARCHAR(50) UNIQUE NOT NULL,
    id_prestatario INT NOT NULL REFERENCES prestatario(id_prestatario) ON DELETE RESTRICT,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion_prevista DATE NOT NULL,
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('ACTIVO', 'DEVUELTO', 'PARCIAL', 'ATRASADO')),
    CONSTRAINT chk_fechas CHECK (fecha_devolucion_prevista >= fecha_prestamo)
);

CREATE TABLE detalle_prestamo (
    id_prestamo INT NOT NULL REFERENCES prestamo(id_prestamo) ON DELETE CASCADE,
    id_equipo INT NOT NULL REFERENCES equipo(id_equipo) ON DELETE RESTRICT,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_devolucion_real DATE,
    PRIMARY KEY (id_prestamo, id_equipo),
    CONSTRAINT chk_fecha_devolucion CHECK (fecha_devolucion_real IS NULL OR fecha_devolucion_real >= '2020-01-01')
);