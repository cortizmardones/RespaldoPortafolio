
--CONSULTAS PARA TRABAJAR TIPICAS
SELECT * FROM EMPRESA;
SELECT * FROM CONTRATO_EMPRESA;

INSERT INTO CONTRATO_PROFESIONAL VALUES (1,SYSDATE,SYSDATE,1,1);
INSERT INTO CONTRATO_PROFESIONAL VALUES (2,SYSDATE,SYSDATE,1,2);
INSERT INTO CONTRATO_PROFESIONAL VALUES (3,SYSDATE,SYSDATE,1,3);

UPDATE PROFESIONAL
SET TELEFONO = 12345678
WHERE ID_PROFESIONAL = 4;

DELETE FROM EMPRESA WHERE ID_EMPRESA = 5;  
DELETE FROM CONTRATO_EMPRESA WHERE ID_CONTRATO = 5;  

INSERT INTO CONTRATO VALUES(4,'PRUEBA',SYSDATE,4,1,SYSDATE);

ALTER TABLE CONTRATO_EMPRESA
ADD CONSTRAINT CONTRATO_EMPRESA
FOREIGN KEY (ID_EMPRESA)
REFERENCES EMPRESA (ID_EMPRESA);

--AGREGAR RESTRICCIONES A CAMPOS DE TIPO UNICO
ALTER TABLE EMPRESA
ADD UNIQUE (RUT_EMPRESA);

--AGREGAR CAMPOS A UNA TABLA
ALTER TABLE EMPRESA
ADD REPRESENTANTE VARCHAR2(250);

--ELIMINAR CAMPOS DE UNA TABLA
ALTER TABLE REPRESENTANTE
DROP (ID_LOGIN);


--Ejemplos de JOIN
SELECT U.NOMBRE_USUARIO , U.CLAVE , U.ID_PERFIL , E.RAZON_SOCIAL , R.NOMBRE
FROM USUARIO U JOIN EMPRESA E
ON U.ID_EMPRESA = E.ID_EMPRESA
JOIN REPRESENTANTE R
ON U.ID_EMPRESA = R.ID_EMPRESA;



--CURSO PL-SQL UDEMY (Video 28)
SET SERVEROUTPUT ON;
BEGIN

DBMS_OUTPUT.PUT_LINE('Prueba de impresi�n de caracteres por pantalla');

END;

--Variables (Video 29)
SET SERVEROUTPUT ON;
DECLARE
    NOMBRE VARCHAR2(100);
    APELLIDO VARCHAR2(100);
BEGIN
    NOMBRE:='CARLOS';
    APELLIDO:='ORTIZ';
    DBMS_OUTPUT.PUT_LINE(NOMBRE || ' ' || APELLIDO );
END;


--Variables CONSTANTES Y NO NULAS (Video 30)
SET SERVEROUTPUT ON;
DECLARE
    NOMBRE CONSTANT VARCHAR2(100):= 'CARLOS';
    APELLIDO VARCHAR2(100) NOT NULL := 'ORTIZ' ;
BEGIN
    DBMS_OUTPUT.PUT_LINE(NOMBRE || ' ' || APELLIDO );
END;

--Video 32(VARIABLES BOOLEANAS)
SET SERVEROUTPUT ON;
DECLARE
    NOMBRE BOOLEAN;
BEGIN
    NOMBRE := TRUE;
    NOMBRE := FALSE;
    NOMBRE := NULL;
END;

--Video 33 (VARIABLES %TYPE) YA LAS OCUPO DE ANTES
SET SERVEROUTPUT ON;
DECLARE
    NOMBRE EMPLOYEES.SALARY%TYPE;
BEGIN
    NOMBRE := 100;
END;


--Video 37 (BLOQUES ANIDADOS)
SET SERVEROUTPUT ON;
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('EN EL PRIMER BLOQUE'); --OJO QUE LAS VARIABLES DE AC� SON GLOBALES
    DECLARE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('EN EL SEGUNDO BLOQUE'); --OJO QUE LAS VARIABLES DE AC� SON LOCALES (existen solo en este ambito)
    END;
END;


--VIDEO 43 (COMANDO IF)
SET SERVEROUT ON;
DECLARE
 NUMERO NUMBER:= 10;
BEGIN
    IF
        NUMERO > 20
    THEN
        --Condici�n si se cumple lo de arriba
        DBMS_OUTPUT.PUT_LINE('EL NUMERO ES MAYOR QUE ');
    ELSE
        --Condici�n si no se cumple
        DBMS_OUTPUT.PUT_LINE('EL NUMERO ES MENOR QUE ');
    END IF;
END;

/* Por si quieres poner m�s de una condici�n
IF
        sales > 50000
    THEN
        bonus := 1500;
    ELSIF sales > 35000 
    THEN
        bonus := 500;
    ELSIF sales > 20000 
    THEN
        bonus := 150;
    ELSE
        bonus := 100;
    END IF;
*/

--VIDEO 55(INTO / Para guardar los resultados de los select en variables (DEVUELVEN LOS DATOS DE UNA SOLA FILA)
SET SERVEROUT ON;
DECLARE
 ID_EMPRESA EMPRESA.ID_EMPRESA%TYPE;
 NOMBRE EMPRESA.NOMBRE%TYPE;
BEGIN
    SELECT ID_EMPRESA , NOMBRE INTO ID_EMPRESA , NOMBRE FROM EMPRESA WHERE ID_EMPRESA = 2;
    DBMS_OUTPUT.PUT_LINE(ID_EMPRESA);
    DBMS_OUTPUT.PUT_LINE(NOMBRE);
END;

--VIDEO 56 (%ROWTYPE) FORMA + PRO PARA NO TENER QUE CREAR UNA CANTIDAD DE VARIABLES IGUALES A LA CANTIDAD DE COLUMNAS EN LA TABLA.
SET SERVEROUT ON;
DECLARE
 LISTA_EMPRESA EMPRESA%ROWTYPE;
BEGIN
    SELECT * INTO LISTA_EMPRESA FROM EMPRESA WHERE ID_EMPRESA = 1;
    DBMS_OUTPUT.PUT_LINE(LISTA_EMPRESA.NOMBRE);
    DBMS_OUTPUT.PUT_LINE(LISTA_EMPRESA.RUT_EMPRESA);
END;

SELECT * FROM EMPRESA;







