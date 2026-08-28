Sistema de Gestión de Préstamos Audiovisuales - Semana 5
Solución relacional normalizada en 3FN para la gestión de préstamos de equipo audiovisual con PostgreSQL y Docker Compose.

Guía de Despliegue de mis nalgas de pene
Generar archivo de configuración local:
cp .env.example .env

Encender contenedor PostgreSQL:
docker compose up -d

Ejecución ordenada de scripts:
Get-Content schema.sql | docker exec -i postgres_prestamos psql -U app_user -d prestamos_db
Get-Content seed.sql | docker exec -i postgres_prestamos psql -U app_user -d prestamos_db
Get-Content validation.sql | docker exec -i postgres_prestamos psql -U app_user -d prestamos_db

Comprobar la base de datos y usuario activos del pendejo:
docker exec -i postgres_prestamos psql -U app_user -d prestamos_db -c "SELECT current_database(), current_user;"
## Decisiones Importantes del Modelo
* **Normalización (3FN):** Se dividió la tabla plana original en 4 entidades (`prestatario`, `equipo`, `prestamo`, `detalle_prestamo`) para evitar anomalías de inserción, actualización y eliminación.
* **Integridad de Datos:** Se implementaron restricciones `UNIQUE` para correos y códigos de equipos, `CHECK (cantidad > 0)` en detalles y `FOREIGN KEY` con integridad referencial.
* **Flexibilidad de Estados:** Se utilizó un campo `estado` restringido a valores válidos (`ACTIVO`, `DEVUELTO`, `PARCIAL`) y se permite `fecha_devolucion_real NULL` para préstamos en curso.
