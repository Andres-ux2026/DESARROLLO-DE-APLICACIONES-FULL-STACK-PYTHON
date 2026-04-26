3. Eliminación de datos (DELETE)
   • Intentar eliminar un cliente que  tiene pedidos asociados y documentar  el resultado (debe fallar si hay
   restricción de integridad referencial).
  
    ![alt text](<error delete.png>)

    El error dice que no se puede borrar ni modificar al cliente con ID 2 (Carmen Caceres) porque ese cliente tiene pedidos registrados en la tabla pedidos.
4. Transacciones

   • ¿Qué es una transacción en bases de datos y por qué es importante?

       Es una unidad de trabajo lógica que agrupa una o más operaciones de SQL (como INSERT, UPDATE o DELETE). La regla de oro es: o se hacen todas, o no se hace ninguna.Es improtante por lo siguiente:
         Integridad de los datos: Evita que queden "datos a medias" o inconsistentes (como el dinero perdido en el ejemplo del banco).

         Recuperación de errores: Si algo sale mal en mitad de un proceso complejo, puedes simplemente volver atrás como si nada hubiera pasado.

         Manejo de concurrencia: Permite que miles de personas compren entradas para un concierto al mismo tiempo sin que se venda el mismo asiento dos veces.

    • Describe brevemente qué significa:

         • Atomicidad: Se refiere a la propiedad de "todo o nada". Una transacción puede tener múltiples pasos ,pero la base de datos los trata como una única unidad indivisible. Si un solo paso falla, se deshacen todos los cambios realizados hasta ese momento para que no queden datos a medias.

         • Consistencia:Garantiza que la base de datos pase de un estado válido a otro estado válido. Esto significa que cualquier operación debe respetar todas las reglas establecidas: llaves foráneas, tipos de datos, restricciones de valor único y checks. Si una transacción rompe una regla, la base de datos la rechaza.

         • Aislamiento: Asegura que las operaciones que ocurren al mismo tiempo no se estorben entre sí. Aunque haya miles de transacciones ejecutándose simultáneamente, cada una debe sentirse como si fuera la única en el sistema. Esto evita que una transacción lea datos "sucios" o incompletos que otra transacción aún no ha terminado de procesar.

         • Durabilidad: Una vez que el sistema confirma que la transacción se completó con éxito (mediante un COMMIT), los cambios son permanentes. Incluso si hay, un corte de energía o el servidor se reinicia justo después, los datos no se perderán porque ya han sido grabados en un almacenamiento no volátil (disco duro).

Realiza el siguiente ejercicio en SQL y documenta lo ocurrido:

 begin;
 update pedidos 
 set total = 0,
 where id = 1,
 rollback;
	
--Repite con:

 begin;
 delete from pedidos
 where id = 2,
 commit; 


 Comenta qué diferencia notaste entre ROLLBACK y COMMIT.

 Con el roolback le ordenamos a la base de datos que ignore todo lo que acaba de pasar. El cambio se descarta y el total del pedido vuelve a su valor original.

 con el commit Le confirmamos a la base de datos que el cambio es correcto. El motor escribe la instrucción en el disco duro de forma permanente.