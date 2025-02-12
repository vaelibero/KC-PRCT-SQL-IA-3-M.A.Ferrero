-- Ejemplo de coalece
select coalesce(null, 999999)

-- Ejemplo de creación de función (primero la he cogido de uno de sql-server y la he tratado de transcribir a sql)

create or replace function clean_integer_int(number INT)
returns int as $$
declare
    result INT;
begin
    -- Deberia de cambiar NULL por -999999
    result := coalesce(number, -999999); 
    RETURN result;
end;
$$ language plpgsql;


-- Uso de la función en PostgreSQL
select clean_integer_int(null); -- -999999 
select clean_integer_int(10.1);   -- Devuelve 10;


---------------------------------------------------------------
-- Función con retorno de texto y vale para cualquier valor
create or replace function clean_integer(number text)
return text as $$
declare
    result TEXT;
begin
    -- Trato de pasarlo a entero
    begin
        result := number::INT;
    exception
        when others then
            result := 'error';  -- Devuelve 'error' si no puede cambiarlo, ahora puedo por que es texto lo que devuelve
    end;

    -- deberia de pasar NULL con -999999
    result := COALESCE(result, '-999999');
    
    return result;
end;
$$ language plpgsql;


-- Ejemplos
select clean_integer(null);
select clean_integer(10.1);
select clean_integer(42);
select clean_integer(3.14);
select clean_integer('99');
select clean_integer('hola');
select clean_integer(NULL);

-- A veces me funcionaba mal, y erá por que parece ser que postgresql admite funciones de sobrecarga
-- no se muy bien lo que es, creo que es que almacena todas las funciones en memoria.
-- El caso es que he buscado como eliminar mis ejemplos anteriores y me lo dejo como apunte
DROP FUNCTION IF EXISTS clean_integer(ANYELEMENT);
DROP FUNCTION IF EXISTS clean_integer(TEXT);
DROP FUNCTION IF EXISTS clean_integer(INT);



