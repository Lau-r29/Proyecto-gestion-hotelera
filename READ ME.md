# Gestión Hotelera (Caso de Uso 6) — Base de Datos

Proyecto desarrollado para el espacio académico **Bases de Datos** del programa de **Ingeniería de Datos e Inteligencia Artificial (IDIA)**.

El proyecto consiste en diseñar y desarrollar progresivamente una base de datos para la plataforma **Gestión Hotelera (`gestionHotelera`)**, un sistema orientado a administrar la operación integral de un hotel: huéspedes, disponibilidad de habitaciones, reservas, consumos de servicios adicionales, facturación y recaudo de pagos.

---

## 👥 Equipo de trabajo

| Integrante | Código/ID | Correo institucional |
|---|---|---|
| Laura Valentina Rincón Mantilla | 2614829 | laura.mantillarin@usantotomas.edu.co |

---

## 🎯 Descripción del proyecto

El sistema **Gestión Hotelera** permite llevar el control estructurado de:

- **Huéspedes:** Registro de titulares y acompañantes con validación de tipo y número de documento, datos de contacto y estado.
- **Habitaciones y categorías:** Administración de habitaciones físicas, número único, estado operativo (`Disponible`, `Ocupada`, `Mantenimiento`) y tipos de habitación con capacidad y tarifa base.
- **Reservas:** Control de estadías con validación cronológica de fechas de entrada y salida, asignación múltiple de habitaciones y estados de reserva.
- **Servicios y consumos:** Catálogo de servicios adicionales del hotel y registro transaccional de cantidades y tarifas aplicadas por reserva.
- **Facturación y pagos:** Emisión de facturas con cálculo de subtotal, impuestos y total, junto con el seguimiento de pagos totales o abonos parciales y su saldo pendiente.

El diseño de la base de datos se desarrolla progresivamente durante el semestre, pasando del **modelo conceptual (E-R)** al **modelo relacional normalizado hasta 3FN**, su implementación física y consultas en **SQL Server**, y una extensión documental NoSQL con **MongoDB**.

---

## 📁 Estructura del repositorio

```text
├── documentacion/
│   ├── diccionario_de_datos.xlsx     
│   └── decisiones_diseno.md          
├── modelos/
│   ├── diagrama_conceptual.drawio     
│   └── modelo_relacional.png          
├── scripts/
│   ├── 01_crear_base_y_tablas.sql    
│   ├── 02_insertar_datos.sql          
│   └── 03_consultas.sql              
├── mongodb/
│   ├── guia_mongodb_completa.html     
│   └── solucion_taller.js             
├── .gitignore
└── README.md
```

---

## ⚙️ Orden de ejecución (SQL Server)

Para desplegar y probar la base de datos `gestionHotelera` en **SQL Server Management Studio (SSMS)**, ejecutar los scripts en el siguiente orden estricto:

1. `Creacion de tablas proyecto integrador.sql` — Crea la estructura de tablas base, dependientes y puente con sus reglas de integridad.
2. `2_ Insercion de datos proyecto integrador.sql` — Inserta los registros de prueba respetando la jerarquía de claves foráneas.
3. `3_ Consultas proyecto integrador.sql` — Ejecuta las 10 consultas analíticas y operativas del caso de uso.

---

## 📌 Hito 0 — Configuración del repositorio

El Hito 0 corresponde a la creación y configuración inicial del repositorio.

### Actividades realizadas

- [x] Creación del repositorio.
- [x] Configuración de la estructura inicial.
- [x] Creación del archivo `README.md`.
- [x] Creación del archivo `.gitignore`.
- [x] Configuración de las carpetas del proyecto.
- [x] Primer commit.
- [x] Acceso de lectura configurado para el docente.

### Primer commit

```text
modelo: estructura base
```

