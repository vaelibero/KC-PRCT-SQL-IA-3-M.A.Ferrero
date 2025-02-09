# Ejercicio 4 apuntes
* Se procede a explorar el campo vdn_label
  ```

  SELECT
  `calls_vdn_label`
FROM
  `keepcoding-450409.keepcoding.ivr_details` ;
  
  ```
Valor           Recuento
ATC_B2C_ESP     14525
TECH_B2C_ESP    7814
ABSORPTION      1185
TECH_B2C_CAT    840
ATC_B2C_CAT     742
VENTAS_B2C      702
RECOBROS_B2C    420
CEX_B2C         361
TECH_B2B_ESP    210
ATC_B2B_ESP     105

* Procedemos a realizar la modificación en el select para añadir ese campo de agregación procedente del campo vdn_label y luego generamos una llamada solo con dos campos, dejamos indicados todos los campos.

