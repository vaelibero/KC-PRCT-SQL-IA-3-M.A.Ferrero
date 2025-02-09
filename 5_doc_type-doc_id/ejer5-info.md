# Ejercicio 5.
No entiendo muy bien esta pregunta, los campos document_identificatio y document_type ya estan generados, pero están en unknown o en otro estado.
* Explorando los campos de la documentación nos damos cuenta de que el document identification y el document type, estan vinculados y son únicos apra cada ivr_id.
* Procedemos entonces a generar un nuevo cte y sobre el realizar un right join que muestre los campos de documentación que no sean unknown vinculandolos al ivr_id y realizando un distinct de cada ivr_id. Creo que eso es lo que se busca.
* Dejamos los datos generados en un el fichero ejer5.csv
