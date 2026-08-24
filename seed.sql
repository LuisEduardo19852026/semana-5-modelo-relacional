INSERT INTO prestatario (nombre, correo) VALUES
('Juan Pérez', 'juan.perez@universidad.edu'),
('María López', 'maria.lopez@universidad.edu');

INSERT INTO equipo (codigo_equipo, nombre, categoria) VALUES
('EQ-101', 'Proyector Epson EB-X06', 'Proyectores'),
('EQ-102', 'Cámara Canon EOS Rebel T7', 'Fotografía'),
('EQ-103', 'Micrófono Shure SM58', 'Audio'),
('EQ-104', 'Trípode Manfrotto 290', 'Accesorios');

INSERT INTO prestamo (numero_prestamo, id_prestatario, fecha_prestamo, fecha_devolucion_prevista, estado) VALUES
('PRES-001', 1, '2026-08-01', '2026-08-05', 'DEVUELTO'),
('PRES-002', 2, '2026-08-20', '2026-08-25', 'ACTIVO'),
('PRES-003', 1, '2026-08-22', '2026-08-27', 'PARCIAL');

INSERT INTO detalle_prestamo (id_prestamo, id_equipo, cantidad, fecha_devolucion_real) VALUES
(1, 1, 1, '2026-08-05'),
(1, 3, 2, '2026-08-05'),
(2, 2, 1, NULL),
(2, 4, 1, NULL),
(3, 1, 1, '2026-08-23');