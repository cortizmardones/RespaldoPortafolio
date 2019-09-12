--PROCEDIMIENTO 1 (INSERTAR EMPRESA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_EMPRESA
(--Parametros para llenar la tabla EMPRESA
ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE,
NOMBRE_EMPRESA_PARAMETRO IN EMPRESA.NOMBRE%TYPE,
DESCRIPCION_PARAMETRO IN EMPRESA.DESCRIPCION%TYPE,
ID_RUBRO_EMPRESA_PARAMETRO IN RUBRO_EMPRESA.ID_RUBRO_EMPRESA%TYPE,
RUT_EMPRESA_PARAMETRO IN EMPRESA.RUT_EMPRESA%TYPE,
ESTADO_PARAMETRO IN EMPRESA.ESTADO%TYPE,
LOGO_PARAMETRO IN EMPRESA.LOGO%TYPE,
CORREO_PARAMETRO IN EMPRESA.CORREO%TYPE,
RAZON_SOCIAL_PARAMETRO IN EMPRESA.RAZON_SOCIAL%TYPE,
DIRECCION_PARAMETRO IN EMPRESA.DIRECCION%TYPE,
--Parametros para llenar la tabla CONTRATO--
ID_CONTRATO_EMPRESA_PARAMETRO IN CONTRATO_EMPRESA.ID_CONTRATO%TYPE,
DESCRIPCION_CONTRATO_PARAMETRO IN CONTRATO_EMPRESA.DESCRIPCION%TYPE,
FECHA_INICIO_PARAMETRO IN CONTRATO_EMPRESA.FECHA_INICIO%TYPE,
ESTADO_CONTRATO_PARAMETRO IN CONTRATO_EMPRESA.ESTADO_CONTRATO%TYPE,
FECHA_TERMINO_PARAMETRO IN CONTRATO_EMPRESA.FECHA_TERMINO%TYPE)
IS
ID_RESCATADO EMPRESA.ID_EMPRESA%TYPE;
BEGIN
  INSERT INTO EMPRESA VALUES (ID_EMPRESA_PARAMETRO,NOMBRE_EMPRESA_PARAMETRO,DESCRIPCION_PARAMETRO,ID_RUBRO_EMPRESA_PARAMETRO,
  RUT_EMPRESA_PARAMETRO,ESTADO_PARAMETRO,LOGO_PARAMETRO,CORREO_PARAMETRO,RAZON_SOCIAL_PARAMETRO,DIRECCION_PARAMETRO);
  
  SELECT ID_EMPRESA 
  INTO ID_RESCATADO 
  FROM EMPRESA 
  WHERE RUT_EMPRESA = RUT_EMPRESA_PARAMETRO;
  
  INSERT INTO CONTRATO_EMPRESA VALUES (ID_CONTRATO_EMPRESA_PARAMETRO,DESCRIPCION_CONTRATO_PARAMETRO,FECHA_INICIO_PARAMETRO,ID_RESCATADO,ESTADO_CONTRATO_PARAMETRO,FECHA_TERMINO_PARAMETRO);
END SP_INSERTAR_EMPRESA;

--LLamando al procedimiento.
exec SP_INSERTAR_EMPRESA(SECUENCIA_ID_EMPRESA.NEXTVAL,'PRUEBA STORE PROCEDURE','DESCRIPCION PRUEBA',2,705686421,1,'\IMG\LOGO4','PRUEBA@PRUEBA.CL','PRUEBA_RAZON_SOCIAL','EJERCITO 215',SECUENCIA_ID_CONTRATO_EMPRESA.NEXTVAL,'DESCRIPCION CONTRATO PRUEBA',SYSDATE,1,SYSDATE);

--Validar Resultados
SELECT * FROM EMPRESA;
SELECT * FROM CONTRATO_EMPRESA;

--Creo la secuencia para los campos autoincrementables.
CREATE SEQUENCE SECUENCIA_ID_EMPRESA
START WITH 4
INCREMENT BY 1;

CREATE SEQUENCE SECUENCIA_ID_CONTRATO_EMPRESA
START WITH 4
INCREMENT BY 1;






--PROCEDIMIENTO 2 (ACTUALIZAR EMPRESA)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_EMPRESA
(NOMBRE_EMPRESA_PARAMETRO IN EMPRESA.NOMBRE%TYPE,
DESCRIPCION_PARAMETRO IN EMPRESA.DESCRIPCION%TYPE,
ID_RUBRO_EMPRESA_PARAMETRO IN EMPRESA.ID_RUBRO_EMPRESA%TYPE,
RUT_EMPRESA_PARAMETRO_NUEVO IN EMPRESA.RUT_EMPRESA%TYPE,
ESTADO_PARAMETRO IN EMPRESA.ESTADO%TYPE,
LOGO_PARAMETRO IN EMPRESA.LOGO%TYPE,
CORREO_PARAMETRO IN EMPRESA.CORREO%TYPE,
RAZON_SOCIAL_PARAMETRO IN EMPRESA.RAZON_SOCIAL%TYPE,
DIRECCION_PARAMETRO IN EMPRESA.DIRECCION%TYPE,
ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE)
IS
BEGIN
  UPDATE EMPRESA
  SET NOMBRE = NOMBRE_EMPRESA_PARAMETRO,
  DESCRIPCION = DESCRIPCION_PARAMETRO,
  ID_RUBRO_EMPRESA = ID_RUBRO_EMPRESA_PARAMETRO,
  RUT_EMPRESA = RUT_EMPRESA_PARAMETRO_NUEVO,
  ESTADO = ESTADO_PARAMETRO,
  LOGO = LOGO_PARAMETRO,
  CORREO = CORREO_PARAMETRO,
  RAZON_SOCIAL = RAZON_SOCIAL_PARAMETRO,
  DIRECCION = DIRECCION_PARAMETRO
  WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO;
END SP_ACTUALIZAR_EMPRESA;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_EMPRESA('SERBIMA','SERBIMA DESCRIPCION',1,16123456,0,'\LOGO\PRUEBA01','CORREO@PRUEBA.CL','SERBIMA S.A','PRUEBA 123',4);

--Validar Resultados
SELECT * FROM EMPRESA;





--PROCEDIMIENTO 3 (ELIMINAR EMPRESA (ELIMINACI�N FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_EMPRESA
(ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE) 
IS
BEGIN
  DELETE FROM EMPRESA WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO ;
END SP_ELIMINAR_EMPRESA;

--LLamando al procedimiento.
exec SP_ELIMINAR_EMPRESA(4);

--Validar Resultados
SELECT * FROM EMPRESA;



--PROCEDIMIENTO 3.1 (ELIMINAR EMPRESA (ELIMINACI�N LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_EMPRESA_LOGICA
(ID_EMPRESA_PARAMETRO IN EMPRESA.ID_EMPRESA%TYPE) 
IS
BEGIN
  UPDATE EMPRESA
  SET ESTADO = 0
  WHERE ID_EMPRESA = ID_EMPRESA_PARAMETRO;
END SP_ELIMINAR_EMPRESA_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_EMPRESA_LOGICA(4);

--Validar Resultados
SELECT * FROM EMPRESA;







--PROCEDIMIENTO 4 (INSERTAR PROFESIONAL)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_INSERTAR_PROFESIONAL
(--Parametros para llenar la tabla PROFESIONAL
ID_PROFESIONAL_PARAMETRO IN PROFESIONAL.ID_PROFESIONAL%TYPE,
PRIMER_NOMBRE_PARAMETRO IN PROFESIONAL.PRIMER_NOMBRE%TYPE,
APELLIDO_PATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_PATERNO%TYPE,
APELLIDO_MATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_MATERNO%TYPE,
FECHA_NACIMIENTO_PARAMETRO IN PROFESIONAL.FECHA_NACIMIENTO%TYPE,
ESTADO_PARAMETRO IN PROFESIONAL.ESTADO%TYPE,
RUT_PROFESIONAL_PARAMETRO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
SEGUNDO_NOMBRE_PARAMETRO IN PROFESIONAL.SEGUNDO_NOMBRE%TYPE,
CORREO_ELECTRONICO_PARAMETRO IN PROFESIONAL.CORREO_ELECTRONICO%TYPE,
DIRECCION_PARAMETRO IN PROFESIONAL.DIRECCION%TYPE,
TELEFONO_PARAMETRO IN PROFESIONAL.TELEFONO%TYPE,
--Parametros para llenar la tabla CONTRATO_PROFESIONAL
ID_CONTRATO_PARAMETRO IN CONTRATO_PROFESIONAL.ID_CONTRATO%TYPE,
FECHA_INICIO_PARAMETRO IN CONTRATO_PROFESIONAL.FECHA_INICIO%TYPE,
FECHA_TERMINO_PARAMETRO IN CONTRATO_PROFESIONAL.FECHA_TERMINO%TYPE,
ESTADO_PROF_PARAMETRO IN CONTRATO_PROFESIONAL.ESTADO%TYPE) 
IS
ID_RESCATADO PROFESIONAL.ID_PROFESIONAL%TYPE;
BEGIN
  INSERT INTO PROFESIONAL VALUES (ID_PROFESIONAL_PARAMETRO,PRIMER_NOMBRE_PARAMETRO,APELLIDO_PATERNO_PARAMETRO,APELLIDO_MATERNO_PARAMETRO,FECHA_NACIMIENTO_PARAMETRO,
  ESTADO_PARAMETRO,RUT_PROFESIONAL_PARAMETRO,SEGUNDO_NOMBRE_PARAMETRO,CORREO_ELECTRONICO_PARAMETRO,DIRECCION_PARAMETRO,TELEFONO_PARAMETRO);
  
  SELECT ID_PROFESIONAL 
  INTO ID_RESCATADO 
  FROM PROFESIONAL 
  WHERE RUT_PROFESIONAL = RUT_PROFESIONAL_PARAMETRO;
  
  INSERT INTO CONTRATO_PROFESIONAL VALUES (ID_CONTRATO_PARAMETRO,FECHA_INICIO_PARAMETRO,FECHA_TERMINO_PARAMETRO,ESTADO_PROF_PARAMETRO,ID_RESCATADO); 
END SP_INSERTAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_INSERTAR_PROFESIONAL(SECUENCIA_ID_PROFESIONAL.NEXTVAL,'NOMBRE 1','APELLIDO 1','APELLIDO 2',SYSDATE,1,227156155,'NOMBRE 2','PRUEBA@PRUEBA.CL','DIRECCION_PRUEBA',12345678,SECUENCIA_ID_CONTRATO_PROF.NEXTVAL,SYSDATE,SYSDATE,1);

--Validar Resultados
SELECT * FROM PROFESIONAL;
SELECT * FROM CONTRATO_PROFESIONAL;

--Creo la secuencia para los campos autoincrementables.
CREATE SEQUENCE SECUENCIA_ID_PROFESIONAL
START WITH 4
INCREMENT BY 1;

CREATE SEQUENCE SECUENCIA_ID_CONTRATO_PROF
START WITH 4
INCREMENT BY 1;



--PROCEDIMIENTO 5 (ACTUALIZAR PROFESIONAL)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_PROFESIONAL
(PRIMER_NOMBRE_PARAMETRO IN PROFESIONAL.PRIMER_NOMBRE%TYPE,
APELLIDO_PATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_PATERNO%TYPE,
APELLIDO_MATERNO_PARAMETRO IN PROFESIONAL.APELLIDO_MATERNO%TYPE,
FECHA_NACIMIENTO_PARAMETRO IN PROFESIONAL.FECHA_NACIMIENTO%TYPE,
ESTADO_PARAMETRO IN PROFESIONAL.ESTADO%TYPE,
RUT_PROFESIONAL_PARAMETRO IN PROFESIONAL.RUT_PROFESIONAL%TYPE,
SEGUNDO_NOMBRE_PARAMETRO IN PROFESIONAL.SEGUNDO_NOMBRE%TYPE,
CORREO_ELECTRONICO_PARAMETRO IN PROFESIONAL.CORREO_ELECTRONICO%TYPE,
DIRECCION_PARAMETRO IN PROFESIONAL.DIRECCION%TYPE,
TELEFONO_PARAMETRO IN PROFESIONAL.TELEFONO%TYPE,
ID_PROFESIONAL_PARAMETRO IN PROFESIONAL.ID_PROFESIONAL%TYPE) 
IS
BEGIN
  UPDATE PROFESIONAL
  SET PRIMER_NOMBRE = PRIMER_NOMBRE_PARAMETRO,
  APELLIDO_PATERNO = APELLIDO_PATERNO_PARAMETRO,
  APELLIDO_MATERNO = APELLIDO_MATERNO_PARAMETRO,
  FECHA_NACIMIENTO = FECHA_NACIMIENTO_PARAMETRO,
  ESTADO = ESTADO_PARAMETRO,
  RUT_PROFESIONAL = RUT_PROFESIONAL_PARAMETRO,
  SEGUNDO_NOMBRE = SEGUNDO_NOMBRE_PARAMETRO,
  CORREO_ELECTRONICO = CORREO_ELECTRONICO_PARAMETRO,
  DIRECCION = DIRECCION_PARAMETRO,
  TELEFONO = TELEFONO_PARAMETRO
  WHERE ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO;
END SP_ACTUALIZAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_ACTUALIZAR_PROFESIONAL('SOL','PATERNO','MATERNO',SYSDATE,1,208463279,'LUNA','SOL@LUNA.CL','PERICO LOS PALOTES 123',958586705,4);

--Validar Resultados
SELECT * FROM PROFESIONAL;





--PROCEDIMIENTO 6 (ELIMINAR PROFESIONAL (ELIMINACI�N FISICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_PROFESIONAL
(ID_PROFESIONAL_PARAMETRO IN PROFESIONAL.ID_PROFESIONAL%TYPE) 
IS
BEGIN
  DELETE FROM PROFESIONAL WHERE ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO ;
END SP_ELIMINAR_PROFESIONAL;

--LLamando al procedimiento.
exec SP_ELIMINAR_PROFESIONAL(4);

--Validar Resultados
SELECT * FROM PROFESIONAL;





--PROCEDIMIENTO 6.1 (ELIMINAR PROFESIONAL (ELIMINACI�N LOGICA))
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_PROFESIONAL_LOGICA
(ID_PROFESIONAL_PARAMETRO IN PROFESIONAL.ID_PROFESIONAL%TYPE) 
IS
BEGIN
  UPDATE PROFESIONAL
  SET ESTADO = 0
  WHERE ID_PROFESIONAL = ID_PROFESIONAL_PARAMETRO;
END SP_ELIMINAR_PROFESIONAL_LOGICA;

--LLamando al procedimiento.
exec SP_ELIMINAR_PROFESIONAL_LOGICA(4);

--Validar Resultados
SELECT * FROM PROFESIONAL;




--PROCEDIMIENTO 7.0 (LOGGIN)
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SP_LOGGIN
(--Parametros para llenar la tabla PROFESIONAL
USUARIO_PARAMETRO IN USUARIO.NOMBRE_USUARIO%TYPE,
CLAVE_PARAMETRO IN USUARIO.CLAVE%TYPE,
ID_PERFIL_PARAMETRO IN USUARIO.ID_PERFIL%TYPE)
IS
USUARIO_RESCATADO USUARIO.NOMBRE_USUARIO%TYPE;
CLAVE_RESCATADO USUARIO.CLAVE%TYPE;
PERFIL_RESCATADO USUARIO.ID_PERFIL%TYPE;
BEGIN
  
  SELECT NOMBRE_USUARIO , CLAVE , ID_PERFIL
  INTO USUARIO_RESCATADO ,  CLAVE_RESCATADO , PERFIL_RESCATADO 
  FROM USUARIO
  WHERE NOMBRE_USUARIO = USUARIO_PARAMETRO AND CLAVE = CLAVE_PARAMETRO AND ID_PERFIL = ID_PERFIL_PARAMETRO;
  
    IF
        USUARIO_PARAMETRO = USUARIO_RESCATADO AND CLAVE_PARAMETRO = CLAVE_RESCATADO AND  PERFIL_RESCATADO = 1
    THEN
        DBMS_OUTPUT.PUT_LINE('USUARIO ADMINISTRADOR');
        
    ELSIF USUARIO_PARAMETRO = USUARIO_RESCATADO AND CLAVE_PARAMETRO = CLAVE_RESCATADO AND  PERFIL_RESCATADO = 2
    THEN
        DBMS_OUTPUT.PUT_LINE('USUARIO PROFESIONAL');
        
    ELSIF USUARIO_PARAMETRO = USUARIO_RESCATADO AND CLAVE_PARAMETRO = CLAVE_RESCATADO AND  PERFIL_RESCATADO = 3 
    THEN
        DBMS_OUTPUT.PUT_LINE('USUARIO NORMAL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('ERROR DE CREDENCIALES / REINTENTAR');
    END IF;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EXISTE EL USUARIO EN LA BDD');
       
END SP_LOGGIN;

--LLamando al procedimiento.
exec SP_LOGGIN('CSANDOVAL','DILAN',4);

--Validar Resultados
SELECT * FROM USUARIO;
SELECT * FROM PERFIL;

UPDATE USUARIO
SET NOMBRE_USUARIO = 'CSANDOVAL',
CLAVE = 'EXODIA123'
WHERE ID_USUARIO = 3;













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

ALTER TABLE EMPRESA
ADD UNIQUE (RUT_EMPRESA);






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







