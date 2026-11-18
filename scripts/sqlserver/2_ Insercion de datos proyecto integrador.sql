USE gestionHotelera;
GO

-- Datos tabla tipo_habitacion
INSERT INTO tipo_habitacion (capacidad, tarifa_base) VALUES
(1, 120000.00), 
(2, 180000.00), 
(4, 320000.00), 
(6, 550000.00); 
GO


-- Datos tabla Huésped
INSERT INTO huesped (tipo_documento, documento_huesped, nombre, apellido, correo, telefono, fecha_nacimiento, estado) VALUES
('cc', 1018456123, 'Laura', 'Rincon', 'laura.rincon@email.com', '3104567890', '2002-06-29', 'activo'),
('cc', 1020789456, 'Carlos', 'Mendoza', 'cmendoza@email.com', '3112345678', '1995-03-14', 'activo'),
('pp', 89456123, 'Elena', 'Rostova', 'elena.rostova@mail.com', '3159876543', '1988-11-02', 'activo'),
('cc', 79852369, 'Andres', 'Gomez', 'agomez@empresa.co', '3001122334', '1982-08-19', 'activo'),
('ti', 1098765432, 'Sofia', 'Mendoza', 'sofia.m@email.com', '3112345679', '2010-04-25', 'activo'),
('cc', 52413698, 'Martha', 'Mantilla', 'martha.mantilla@email.com', '3126549870', '1975-09-10', 'activo'),
('rc', 1102345678, 'Mateo', 'Rincon', NULL, NULL, '2018-01-30', 'activo'),
('pp', 99887766, 'Jean', 'Dupont', 'j.dupont@france.fr', '3205556677', '1991-07-14', 'activo'),
('cc', 1032456987, 'Camila', 'Torres', 'ctorres@email.com', '3187778899', '1999-12-05', 'inactivo'),
('cc', 80123456, 'Jorge', 'Castillo', 'jcastillo@email.com', '3142223344', '1970-02-18', 'inactivo');
GO

-- Datos tabla Servicio
INSERT INTO Servicio (tipo_servicio, observacion) VALUES
('Desayuno Buffet', 'Incluye estaciones calientes, frutas y bebidas de 6:30 AM a 10:00 AM'),
('Spa y Masaje Relajante', 'Sesión de 60 minutos en zona húmeda'),
('Lavanderia Express', 'Servicio de lavado y planchado por prenda'),
('Cena Romantica', 'Menú de 3 tiempos en terraza con copa de vino'),
('Transporte Aeropuerto', 'Traslado privado hotel - aeropuerto'),
('Alquiler Sala Conferencias', 'Por hora, incluye proyector y estación de café');
GO

-- Datos tabla Habitacion
INSERT INTO Habitacion (numero_habitacion, codigo_tipohabitacion, estado) VALUES
('101', 1, 'Disponible'),
('102', 1, 'Ocupada'),
('201', 2, 'Disponible'),
('202', 2, 'Ocupada'),
('301', 3, 'Disponible'),
('302', 3, 'Disponible'),
('401', 4, 'Disponible'),
('402', 4, 'Mantenimiento');
GO

-- Datos tabla Reserva
INSERT INTO Reserva (fecha_entrada, fecha_salida, id_responsable, estado) VALUES
('2026-10-05', '2026-10-08', 1, 'finalizada'),  -- ID 1
('2026-10-15', '2026-10-17', 2, 'finalizada'),  -- ID 2
('2026-10-20', '2026-10-25', 3, 'finalizada'),  -- ID 3
('2026-11-02', '2026-11-05', 4, 'finalizada'),  -- ID 4
('2026-11-16', '2026-11-20', 6, 'Confirmada'),  -- ID 5
('2026-11-17', '2026-11-21', 8, 'en mora'),     -- ID 6
('2026-12-10', '2026-12-15', 1, 'Pendiente'),   -- ID 7
('2026-12-22', '2026-12-26', 2, 'cotizada');    -- ID 8
GO

-- Datos tabla Factura 
INSERT INTO Factura (id_reserva, fecha_emision, subtotal, impuestos, total) VALUES
(1, '2026-10-08', 420000.00, 79800.00, 499800.00),
(2, '2026-10-17', 450000.00, 85500.00, 535500.00),
(3, '2026-10-25', 1750000.00, 332500.00, 2082500.00),
(4, '2026-11-05', 600000.00, 114000.00, 714000.00),
(5, '2026-11-16', 1400000.00, 266000.00, 1666000.00),
(6, '2026-11-17', 720000.00, 136800.00, 856800.00);
GO

-- Datos tabla Pagos 
INSERT INTO pagos (id_factura, fecha_pago, monto, tipo_pago, referencia_pago, saldo_pendiente) VALUES
(1, '2026-10-08', 499800.00, 'pago total', 'TRX-20261008-01', 0.00),
(2, '2026-10-17', 535500.00, 'pago total', 'TRX-20261017-02', 0.00),
(3, '2026-10-20', 1000000.00, 'abono', 'TRX-20261020-03A', 1082500.00),
(3, '2026-10-25', 1082500.00, 'pago total', 'TRX-20261025-03B', 0.00),
(4, '2026-11-05', 714000.00, 'pago total', 'TRX-20261105-04', 0.00),
(5, '2026-11-16', 1666000.00, 'pago total', 'TRX-20261116-05', 0.00),
(6, '2026-11-17', 300000.00, 'abono', 'TRX-20261117-06A', 556800.00);
GO

-- Datos tabla habitacion_reserva
INSERT INTO habitacion_reserva (id_reserva, id_habitacion) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 3),
(5, 6),
(5, 1),
(6, 4),
(7, 2),
(8, 5);
GO

-- Datos tabla reserva_huesped
INSERT INTO reserva_huesped (id_huesped, id_reserva) VALUES
(1, 1),
(2, 2),
(5, 2),
(3, 3),
(4, 4),
(6, 5),
(1, 5),
(7, 5),
(8, 6),
(1, 7),
(2, 8);
GO

-- Datos tabla Consumo
INSERT INTO Consumo (id_reserva, id_servicio, cantidad, tarifa_aplicada) VALUES
(1, 1, 3, 20000.00),
(2, 1, 4, 22500.00),
(3, 2, 2, 75000.00),
(4, 3, 4, 15000.00),
(5, 4, 1, 120000.00),
(5, 1, 6, 20000.00),
(6, 2, 1, 80000.00);
GO