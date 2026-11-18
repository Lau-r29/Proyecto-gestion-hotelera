--- CPNSULTA 1
SELECT 
    h.id_habitacion,
    h.numero_habitacion,
    h.estado,
    th.codigo_tipohabitacion,
    th.capacidad,
    th.tarifa_base
FROM Habitacion h
INNER JOIN tipo_habitacion th 
    ON h.codigo_tipohabitacion = th.codigo_tipohabitacion;
GO

--CONSULTA 2
ELECT 
    r.id_reserva,
    r.estado,
    r.fecha_entrada,
    r.fecha_salida,
    h.nombre + ' ' + h.apellido AS huesped_responsable
FROM Reserva r
INNER JOIN huesped h 
    ON r.id_responsable = h.id_huesped
ORDER BY r.estado, r.fecha_entrada;
GO

-- CONSULTA 3
SELECT 
    MONTH(r.fecha_entrada) AS mes,
    th.codigo_tipohabitacion,
    COUNT(r.id_reserva) AS total_reservas
FROM Reserva r
INNER JOIN habitacion_reserva hr ON r.id_reserva = hr.id_reserva
INNER JOIN Habitacion h ON hr.id_habitacion = h.id_habitacion
INNER JOIN tipo_habitacion th ON h.codigo_tipohabitacion = th.codigo_tipohabitacion
GROUP BY MONTH(r.fecha_entrada), th.codigo_tipohabitacion
ORDER BY mes, th.codigo_tipohabitacion;
GO

--CONSULTA 4


SELECT SUM(total) AS ingresos_totales_facturados
FROM Factura;


SELECT SUM(cantidad * tarifa_aplicada) AS ingresos_totales_servicios
FROM Consumo;
GO


--CONSULTA 5
SELECT 
    r.id_reserva,
    r.fecha_entrada,
    r.fecha_salida,
    hu.nombre + ' ' + hu.apellido AS huesped,
    h.numero_habitacion,
    s.tipo_servicio,
    c.cantidad
FROM Reserva r
INNER JOIN reserva_huesped rh ON r.id_reserva = rh.id_reserva
INNER JOIN huesped hu ON rh.id_huesped = hu.id_huesped
INNER JOIN habitacion_reserva hr ON r.id_reserva = hr.id_reserva
INNER JOIN Habitacion h ON hr.id_habitacion = h.id_habitacion
LEFT JOIN Consumo c ON r.id_reserva = c.id_reserva
LEFT JOIN Servicio s ON c.id_servicio = s.id_servicio
ORDER BY r.id_reserva;
GO


--CONSULTA 6
SELECT 
    h.id_habitacion,
    h.numero_habitacion,
    h.estado
FROM Habitacion h
WHERE h.id_habitacion NOT IN (
    SELECT hr.id_habitacion
    FROM habitacion_reserva hr
    INNER JOIN Reserva r ON hr.id_reserva = r.id_reserva
    WHERE r.fecha_entrada BETWEEN '2026-10-01' AND '2026-11-30'
);
GO

--CONSULTA 7 

SELECT 
    hu.id_huesped,
    hu.nombre,
    hu.apellido,
    hu.correo
FROM huesped hu
LEFT JOIN reserva_huesped rh ON hu.id_huesped = rh.id_huesped
WHERE rh.id_reserva IS NULL;
GO

--CONSULTA 8 

SELECT 
    th.codigo_tipohabitacion,
    COUNT(hr.id_reserva) AS total_reservas
FROM tipo_habitacion th
LEFT JOIN Habitacion h ON th.codigo_tipohabitacion = h.codigo_tipohabitacion
LEFT JOIN habitacion_reserva hr ON h.id_habitacion = hr.id_habitacion
GROUP BY th.codigo_tipohabitacion
HAVING COUNT(hr.id_reserva) > (
    SELECT AVG(CAST(conteo AS FLOAT))
    FROM (
        SELECT COUNT(hr2.id_reserva) AS conteo
        FROM tipo_habitacion th2
        LEFT JOIN Habitacion h2 ON th2.codigo_tipohabitacion = h2.codigo_tipohabitacion
        LEFT JOIN habitacion_reserva hr2 ON h2.id_habitacion = hr2.id_habitacion
        GROUP BY th2.codigo_tipohabitacion
    ) AS subconsulta
);
GO

--CONSULTA 9

SELECT 
    f.id_reserva,
    f.id_factura,
    MONTH(f.fecha_emision) AS mes,
    f.total
FROM Factura f
WHERE f.total > (
    SELECT AVG(f2.total)
    FROM Factura f2
    WHERE MONTH(f2.fecha_emision) = MONTH(f.fecha_emision)
);
GO

--CONSULTA 10

SELECT 
    s.tipo_servicio,
    SUM(c.cantidad * c.tarifa_aplicada) AS ingresos_totales
FROM Servicio s
INNER JOIN Consumo c ON s.id_servicio = c.id_servicio
GROUP BY s.tipo_servicio
ORDER BY ingresos_totales DESC;


SELECT 
    s.id_servicio,
    s.tipo_servicio
FROM Servicio s
LEFT JOIN Consumo c ON s.id_servicio = c.id_servicio
WHERE c.id_consumo IS NULL;
GO
