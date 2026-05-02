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

     Integridad referencial:  

     Facilidad de mantenimiento: 

     Ahorro de espacio: A

¿Cuándo conviene desnormalizarla?
  La desnormalización es una técnica avanzada que se aplica principalmente por razones de rendimiento:

 Optimización de lectura: 

 Reportabilidad: 

 