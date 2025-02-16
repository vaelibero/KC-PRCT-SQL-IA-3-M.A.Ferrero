# Ejercicio 11
Como en el ejercicio anterior queremos tener un registro por cada llamada y dos 
flags que indiquen si el calls_phone_number tiene una llamada las anteriores 24 
horas o en las siguientes 24 horas. En caso afirmativo pondremos un 1 en estos 
flag, de lo contrario llevará un 0.

Se que se han de utilizar lag y luego he buscado información y me he encontrado con el comando lead, que debería hacer el efecto de mostrar la posterior.

Voy a utilizar primero los campos de recall, luego voy a genereran un campo before y uno post a la llamada, luego gneraré un campo bef_24 y post_24 con el fin de ver cual es la diferncia de tiempo(aqui he encontrado el comando timestamp_diff para big_query), luego lo que hago es generar un flag si esta diferencia es menor de 24 tanto en la llamada previa como posterior.


