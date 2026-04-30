## 3. Diccionario de Datos

### Tabla: `cursos`
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **id** | SERIAL | No | Sí | No | Identificador interno autoincremental. |
| **codigo** | VARCHAR(10) | No | No | No | Código único identificador del curso. |
| **nombre** | VARCHAR(50) | No | No | No | Nombre descriptivo de la asignatura. |
| **docente_responsable** | VARCHAR(50) | Sí | No | No | Nombre del profesor a cargo. |

---

### Tabla: `estudiantes`
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **id** | SERIAL | No | Sí | No | Identificador interno autoincremental. |
| **rut** | VARCHAR(12) | No | No | No | RUT único del estudiante. |
| **nombre** | VARCHAR(50) | No | No | No | Nombre completo del alumno. |
| **correo** | VARCHAR(50) | Sí | No | No | Email institucional o personal (único). |

---

### Tabla: `matriculas`
| Campo | Tipo de Dato | Permite Nulos | Clave Primaria | Clave Foránea | Observaciones |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **id_matricula** | SERIAL | No | Sí | No | Identificador único de la matrícula. |
| **fecha** | DATE | No | No | No | Fecha de registro (default current_date). |
| **anio** | INTEGER | Sí | No | No | Año académico correspondiente. |
| **rut_estudiante** | VARCHAR(12) | Sí | No | **Sí** | Referencia a estudiantes(rut) con DELETE CASCADE. |
| **codigo_curso** | VARCHAR(10) | Sí | No | **Sí** | Referencia a cursos(codigo). |


¿Cuál fue la mayor dificultad al transformar el modelo conceptual al relacional?

    La mayor dificultad fue identificar  las relaciones como por ejemplo el  muchos a muchos .Otro desafío importante es la definición de claves únicas y foráneas

• ¿Qué ventajas tiene normalizar una base de datos? ¿Y cuándo conviene desnormalizarla?
    Normalizar una base de datos ofrece beneficios críticos para la integridad de la información:

     Reducción de la redundancia: Se evita almacenar el mismo dato en múltiples lugares.

     Integridad referencial: Asegura que las relaciones entre tablas sean consistentes (por ejemplo, que no exista una matrícula sin un estudiante válido).

     Facilidad de mantenimiento: Si un dato cambia (como el nombre de un curso), solo se debe actualizar en un lugar.

     Ahorro de espacio: Al eliminar datos duplicados, el tamaño físico de la base de datos es menor.

¿Cuándo conviene desnormalizarla?
  Aunque la normalización es la regla de oro, la desnormalización es una técnica avanzada que se aplica principalmente por razones de rendimiento:

 Optimización de lectura: En sistemas con volúmenes masivos de datos (como Big Data o Data Warehousing), donde las uniones (joins) entre muchas tablas son demasiado lentas.

 Reportabilidad: Cuando se necesitan generar reportes complejos de forma frecuente y se prefiere tener los datos "pre-calculados" o repetidos para evitar procesamientos costosos.

 Sistemas OLAP: En bases de datos destinadas al análisis y no a la transacción diaria, donde la velocidad de consulta es más importante que el ahorro de espacio.