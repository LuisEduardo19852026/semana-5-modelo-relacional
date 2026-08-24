-- PRUEBA 1: Violación UNIQUE (Correo duplicado)
INSERT INTO prestatario (nombre, correo)
VALUES ('Carlos Gómez', 'juan.perez@universidad.edu');

-- PRUEBA 2: Violación CHECK (Cantidad igual a 0)
INSERT INTO detalle_prestamo (id_prestamo, id_equipo, cantidad)
VALUES (2, 3, 0);

-- PRUEBA 3: Violación FOREIGN KEY (Prestatario inexistente)
INSERT INTO prestamo (numero_prestamo, id_prestatario, fecha_prestamo, fecha_devolucion_prevista, estado)
VALUES ('PRES-999', 999, '2026-08-24', '2026-08-28', 'ACTIVO');