USE gestionHotelera;
GO

CREATE TABLE tipo_habitacion (
    codigo_tipohabitacion INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    capacidad INT NOT NULL CONSTRAINT CHK_tipo_habitacion_capacidad CHECK (capacidad > 0),
    tarifa_base FLOAT NOT NULL CONSTRAINT CHK_tipo_habitacion_tarifa CHECK (tarifa_base >= 0)
);
GO

CREATE TABLE huesped (
    id_huesped INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tipo_documento VARCHAR(5) NOT NULL DEFAULT 'cc' CONSTRAINT CHK_huesped_tipo_doc CHECK (tipo_documento IN ('ti', 'cc', 'rc', 'pp')),
    documento_huesped INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NULL,
    telefono VARCHAR(20) NULL,
    fecha_nacimiento DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    estado VARCHAR(20) NOT NULL DEFAULT 'activo' CONSTRAINT CHK_huesped_estado CHECK (estado IN ('activo', 'inactivo'))

);
GO

CREATE TABLE Servicio (
    id_servicio INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tipo_servicio VARCHAR(50) NOT NULL,
    observacion VARCHAR(200) NULL
);
GO
 
CREATE TABLE Habitacion (
    id_habitacion INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    numero_habitacion VARCHAR(10) NOT NULL UNIQUE,
    codigo_tipohabitacion INT NOT NULL,
    CONSTRAINT FK_Habitacion_TipoHabitacion FOREIGN KEY (codigo_tipohabitacion) 
        REFERENCES tipo_habitacion(codigo_tipohabitacion)

);
GO

CREATE TABLE Reserva (
    id_reserva INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    fecha_entrada DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    fecha_salida DATE NOT NULL,
    id_responsable INT NOT NULL,
estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CONSTRAINT CHK_Reserva_estado CHECK (estado IN ('Pendiente', 'Confirmada', 'cotizada', 'planeada', 'en mora', 'finalizada')),
    CONSTRAINT CHK_Reserva_fechas CHECK (fecha_salida > fecha_entrada),
    CONSTRAINT FK_Reserva_HuespedResponsable FOREIGN KEY (id_responsable) 
        REFERENCES huesped(id_huesped)
);
GO

CREATE TABLE Factura (
    id_factura INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_reserva INT NOT NULL,
    fecha_emision DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    subtotal DECIMAL(10,2) NOT NULL CONSTRAINT CHK_Factura_subtotal CHECK (subtotal >= 0),
    impuestos DECIMAL(10,2) NOT NULL CONSTRAINT CHK_Factura_impuestos CHECK (impuestos >= 0),
    total DECIMAL(10,2) NOT NULL CONSTRAINT CHK_Factura_total CHECK (total >= 0),
    CONSTRAINT FK_Factura_Reserva FOREIGN KEY (id_reserva) 
        REFERENCES Reserva(id_reserva)
);
GO


CREATE TABLE pagos (
    id_pago INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_factura INT NOT NULL, 
    fecha_pago DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    monto DECIMAL(10,2) NOT NULL CONSTRAINT CHK_pagos_monto CHECK (monto > 0),
    tipo_pago VARCHAR(20) NOT NULL CONSTRAINT CHK_pagos_tipo CHECK (tipo_pago IN ('abono', 'pago total')),
    referencia_pago VARCHAR(100) NOT NULL,
    saldo_pendiente FLOAT NOT NULL CONSTRAINT CHK_pagos_saldo CHECK (saldo_pendiente >= 0),
    CONSTRAINT FK_pagos_Factura FOREIGN KEY (id_factura) 
        REFERENCES Factura(id_factura)
);
GO


CREATE TABLE habitacion_reserva (
    id_reserva INT NOT NULL,
    id_habitacion INT NOT NULL,
    CONSTRAINT PK_habitacion_reserva PRIMARY KEY (id_reserva, id_habitacion),
    CONSTRAINT FK_habitacion_reserva_Reserva FOREIGN KEY (id_reserva) 
        REFERENCES Reserva(id_reserva),
    CONSTRAINT FK_habitacion_reserva_Habitacion FOREIGN KEY (id_habitacion) 
        REFERENCES Habitacion(id_habitacion)
);
GO


CREATE TABLE reserva_huesped (
    id_huesped INT NOT NULL,
    id_reserva INT NOT NULL,
    CONSTRAINT PK_reserva_huesped PRIMARY KEY (id_reserva, id_huesped),
    CONSTRAINT FK_reserva_huesped_Huesped FOREIGN KEY (id_huesped) 
        REFERENCES huesped(id_huesped),
    CONSTRAINT FK_reserva_huesped_Reserva FOREIGN KEY (id_reserva) 
        REFERENCES Reserva(id_reserva)
);
GO

CREATE TABLE Consumo (
    id_consumo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_reserva INT NOT NULL,
    id_servicio INT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT CHK_Consumo_cantidad CHECK (cantidad > 0),
    tarifa_aplicada FLOAT NOT NULL CONSTRAINT CHK_Consumo_tarifa CHECK (tarifa_aplicada >= 0),
    CONSTRAINT FK_Consumo_Reserva FOREIGN KEY (id_reserva) 
        REFERENCES Reserva(id_reserva),
    CONSTRAINT FK_Consumo_Servicio FOREIGN KEY (id_servicio) 
        REFERENCES Servicio(id_servicio)
);
GO