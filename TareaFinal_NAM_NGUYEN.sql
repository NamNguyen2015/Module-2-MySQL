DROP DATABASE TareaFinal;

CREATE DATABASE TareaFinal;
USE TareaFinal;



CREATE TABLE CATEGORIAS (
					ID_CATEGORIA varchar(125),
					DESCUENTO float(2),
                    VOL_MIN FLOAT(2),
					VOL_MAX FLOAT(2),
					PRIMARY KEY (ID_CATEGORIA)                    
);
DESCRIBE CATEGORIAS;

CREATE TABLE TIENDA (
					ID_TIENDA varchar(125) NOT NULL UNIQUE,
                    Nombre varchar(50) NOT NULL,
                    calle varchar(50),
                    numero int,
                    poblacion varchar(125),
                    ciudad varchar(125),
                    Tel varchar(12), 
                    Email varchar(125),
                    ID_CATEGORIA varchar(125),
                    Limite_Credito FLOAT(2),
					PRIMARY KEY (ID_TIENDA),					
                    FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIAS (ID_CATEGORIA)
);
DESCRIBE TIENDA;


-- product
CREATE TABLE ARTICULO (
				ID_ARTICULO varchar(125), 
                DESCRIPCION VARCHAR(100),
				PRECIO FLOAT(2),
                -- MARCA_BANCA VARCHAR(25),
				PRIMARY KEY (ID_ARTICULO)                    
);
DESCRIBE ARTICULO;

CREATE TABLE PEDIDO (
					ID_PEDIDO varchar(125),
                    FECHA_PEDIDO DATE,
					ID_TIENDA varchar(125),
					PRIMARY KEY ( ID_PEDIDO, FECHA_PEDIDO ),
                    CONSTRAINT FK_PEDIDO FOREIGN KEY (ID_TIENDA) REFERENCES TIENDA (ID_TIENDA)
                    
);
DESCRIBE PEDIDO;

CREATE TABLE PROVEEDOR (
					ID_PROVEEDOR varchar(125) NOT NULL UNIQUE ,
                    NOMBRE VARCHAR(125),
                    -- ID_CATEGORIA varchar(125),
                    calle varchar(150),
                    numero int,
                    poblacion varchar(125),
                    ciudad varchar(125),
                    Tel varchar(12), 
                    Email varchar(125),
                    PRIMARY KEY (ID_PROVEEDOR)
                    -- FOREIGN KEY  (ID_CATEGORIA) REFERENCES CATEGORIAS_P (ID_CATEGORIA)
                
);
DESCRIBE PROVEEDOR;

-- ***************
-- LINEA_PEDIDO: ORDER_ITEMS: THIS IS ONE TABLE WHICH CONTAINS THE INFORMATION OF ORDER CODE,PRODUCTS, QUANTITY, PRICE AND SHIPPING COMPANY

CREATE TABLE LINEA_PEDIDO (
				ID_LINEA_PEDIDO INT,
                ID_ARTICULO varchar(125),  
                ID_PEDIDO varchar(125),
                CANTIDAD INT,
				PRIMARY KEY (ID_LINEA_PEDIDO,ID_ARTICULO,ID_PEDIDO), 
                FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO (ID_ARTICULO),
                FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO (ID_PEDIDO)
                -- FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR (ID_PROVEEDOR)
                
);
DESCRIBE LINEA_PEDIDO;

CREATE TABLE DISTRIBUCION (
                    FECHA_DIST DATE,
					ID_LINEA_PEDIDO INT,
                    ID_PROVEEDOR varchar(125), 
					PRIMARY KEY (FECHA_DIST,ID_LINEA_PEDIDO,ID_PROVEEDOR),
					FOREIGN KEY (ID_LINEA_PEDIDO) REFERENCES  LINEA_PEDIDO (ID_LINEA_PEDIDO),
					FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR (ID_PROVEEDOR)
                  
);
DESCRIBE DISTRIBUCION;

-- **********************************************************************-- **********************************************************************
-- **********************************************************************-- **********************************************************************
-- **********************************************************************-- **********************************************************************






-- set globally:
SET GLOBAL FOREIGN_KEY_CHECKS=0;
-- **********************************************************************
-- 2. Utilizar la instrucción SQL de inserción de datos para insertar una fila en la tabla de pedidos.
-- **********************************************************************
-- delete from articulo;
SELECT * FROM ARTICULO;
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0001', 'Pantalones',29.5);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0002', 'Camiseta',15.2);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0003', 'Mesa de escritorio',120.5);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0004', 'TV Sony',650.9);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0005', 'Sofa', 1025.99);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0006', 'Libreria',550.2);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0007', 'movil',995.5);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0008', 'Ipad 9',1200.99);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('0009', 'Aire Condicionador',690.5);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00010', 'Silla',45.5);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00011', 'Raton',22.95);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00012', 'Cama Infantil',1500.00);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00013', 'Conchon',850.00);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00014', 'Cojin',53.99);
INSERT INTO ARTICULO (ID_ARTICULO, DESCRIPCION, PRECIO) VALUES ('00015', 'Zapatos',80.50);

 commit;
-- **********************************************************************
SELECT * FROM CATEGORIAS;
INSERT INTO CATEGORIAS(ID_CATEGORIA, DESCUENTO,  VOL_MIN,  VOL_MAX) VALUE ('VIP1', 0.2, 20000,100000);
INSERT INTO CATEGORIAS(ID_CATEGORIA, DESCUENTO,  VOL_MIN,  VOL_MAX) VALUE ('VIP2', 0.1,10000,20000);
INSERT INTO CATEGORIAS(ID_CATEGORIA, DESCUENTO,  VOL_MIN,  VOL_MAX) VALUE ('VIP3', 0.05,0,10000);

-- **********************************************************************
SELECT* FROM TIENDA;
INSERT INTO TIENDA (ID_TIENDA,NOMBRE , CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('ZARA01', 'ZARA', 'GRAN VIA','10','MADRID','MADRID','091234567','ZARA01GRANVIA@GMAIL.COM',25500);
INSERT INTO TIENDA (ID_TIENDA,NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('ZARA02', 'ZARA', 'PRECIADO','30','MADRID','MADRID','091357901','ZARA02PRECIADO@GMAIL.COM',20500);
INSERT INTO TIENDA (ID_TIENDA,NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('MG01', 'MANGO', 'ARGUELLES','23','MADRID','MADRID','623456789','MANGO01ARGUELLES@GMAIL.COM',10900);
    
INSERT INTO TIENDA (ID_TIENDA,NOMBRE ,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('ECI01', 'EL CORTE INGLES', 'N. MINISTERIO','79','MADRID','MADRID','091234569','ECI01NM@GMAIL.COM',29000);
INSERT INTO TIENDA (ID_TIENDA,NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('ECI02', 'EL CORTE INGLES', 'CALLAO','36','MADRID','MADRID','091357907','ECI02CL@GMAIL.COM',20500);
INSERT INTO TIENDA (ID_TIENDA,NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL, LIMITE_CREDITO) 
	VALUE ('ECI03', 'EL CORTE INGLES', 'ARGUELLES','110','MADRID','MADRID','623456759','ECI02AL@GMAIL.COM',12900);    
 
 -- **********************************************************************
 SELECT* FROM PROVEEDOR;
 INSERT INTO PROVEEDOR(ID_PROVEEDOR, NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL)
	VALUE('DHL01','DHL','LA PESETA', 1, 'MADRID', 'MADRID', '630390499','DHL01@HOTMAIL.COM');
   
INSERT INTO PROVEEDOR(ID_PROVEEDOR, NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL)
	VALUE('SEUR01','SEUR','LUSIA', 110, 'MADRID', 'MADRID', '630390589','SEUR01@HOTMAIL.COM');

INSERT INTO PROVEEDOR(ID_PROVEEDOR, NOMBRE,CALLE, NUMERO, POBLACION, CIUDAD,TEL, EMAIL)
	VALUE('C_EXPRESS','CORREOS EXPRESS','PROSPERIDAD', 94, 'MADRID', 'MADRID', '630335589','CORREOSEXPRESS@GMAIL.COM');  

	-- **********************************************************************
 SELECT * FROM PEDIDO;
  INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('01', '2022-10-01','ZARA01');
  INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('02', '2022-10-02','ZARA01');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('03', '2022-10-03','ZARA01');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('04', '2022-10-04','ZARA01');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('05', '2022-10-01','ZARA01');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('06', '2022-10-06','MG01');
   INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('07', '2021-10-01','ECI01');
  INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('08', '2021-10-02','ECI01');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('09', '2021-06-03','ECI02');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('10', '2021-07-04','ECI02');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('11', '2020-03-01','ECI03');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('12', '2024-10-06','ECI03');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('13', '2022-07-04','ECI02');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('14', '2022-03-01','ECI03');
 INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('15', '2022-10-25','ECI03');


 -- **********************************************************************
 SELECT* FROM LINEA_PEDIDO;
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('1', '0001', '01', '20');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('2', '0002', '01', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('3', '0003', '02', '2');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('4', '0005', '02', '20');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('5', '0006', '03', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('6', '0005', '03', '2');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('7', '00010', '03', '20');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('8', '00012', '04', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('9', '00015', '04', '2');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('10', '0007', '05', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('11', '0008', '05', '2');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('12', '00010', '06', '20');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('13', '00013', '07', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('14', '00015', '08', '120');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('15', '00013', '09', '9');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('16', '00015', '10', '2');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('17', '00013', '11', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('18', '00015', '12', '70');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('19', '00013', '09', '5');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('20', '00015', '10', '2');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('21', '00013', '11', '3');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('22', '00015', '12', '2');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('23', '00013', '13', '8');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('24', '00015', '14', '9');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('25', '00013', '15', '20');
INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('26', '00015', '15', '2');


 -- **********************************************************************
SELECT* FROM DISTRIBUCION;
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2021-10-22', '1', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2020-10-22', '2','C_EXPRESS' );
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-10-22', '3', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-10-22', '4','C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-10-22', '5', 'DHL01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2023-07-10', '6', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-10-22', '7', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-07-22', '8', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2025-06-22', '9', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2027-10-22', '10', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-02-27', '11', 'DHL01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2021-05-22', '12', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2023-10-25', '13', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2026-11-24', '14', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2025-10-22', '15', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2023-07-10', '16', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-10-22', '17', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-03-25', '18', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2025-06-06', '19', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2027-09-12', '20', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-02-17', '21', 'DHL01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2021-05-02', '22', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2023-07-25', '23', 'SEUR01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2022-05-17', '24', 'DHL01');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2021-02-02', '25', 'C_EXPRESS');
INSERT INTO `TareaFinal`.`DISTRIBUCION` (`FECHA_DIST`, `ID_LINEA_PEDIDO`, `ID_PROVEEDOR`) VALUES ('2023-01-25', '26', 'SEUR01');




-- **********************************************************************-- **********************************************************************
-- **********************************************************************-- **********************************************************************
-- **********************************************************************-- **********************************************************************



-- ***********************
-- BEFORE STARTING


--  *** I. update one column imorte_tot to the table PEDIDO which returns values of each order

-- first create one tablle to view
DROP VIEW IF EXISTS v_pedido;
CREATE VIEW v_pedido AS 
	SELECT tienda.nombre, pedido.ID_PEDIDO, PEDIDO.FECHA_PEDIDO,
			concat(  tienda.calle,', ',tienda.numero, ', ',tienda.poblacion,', ',tienda.ciudad) as 'direction',
			(select sum(lp.CANTIDAD*a.PRECIO) from LINEA_PEDIDO lp,ARTICULO a  where lp.ID_PEDIDO=PEDIDO.ID_PEDIDO and a.ID_ARTICULO=lp.ID_ARTICULO ) as Imp 
	FROM TIENDA, PEDIDO where tienda.ID_tienda=Pedido.ID_tienda   ORDER BY ID_PEDIDO;
    
-- Second, ADD column importe_tot
ALTER TABLE  PEDIDO ADD COLUMN importe_tot FLOAT(2);
-- third, UPDATE datas to the colum
UPDATE pedido,v_pedido SET importe_tot= v_pedido.imp WHERE v_pedido.id_pedido=pedido.id_pedido; 


 -- *** II. update 2 column VOLUMEN_TOTAL and VOLUMEM_22  to the table TIENDA which calculate the total amount of  all orders  or only the orders in 2022
DROP VIEW IF EXISTS TD; 
DROP VIEW IF EXISTS TD_22; 

CREATE VIEW TD AS  
SELECT ID_TIENDA, SUM(importe_tot) AS VOLUMEN_TOTAL  FROM PEDIDO group by ID_TIENDA;

CREATE VIEW TD_22 AS  
SELECT ID_TIENDA, SUM(importe_tot) AS VOLUMEN_22  FROM PEDIDO WHERE PEDIDO.FECHA_PEDIDO
BETWEEN '2022-10-01' AND '2022-10-31'  group by ID_TIENDA;

ALTER TABLE  TIENDA DROP column  VOLUMEN_TOTAL;  
ALTER TABLE  TIENDA DROP COLUMN   VOLUMEN_22;  

ALTER TABLE  TIENDA add column VOLUMEN_TOTAL float(2) DEFAULT  0.0;
ALTER TABLE  TIENDA add COLUMN VOLUMEN_22  float(2) DEFAULT  0.0;

-- update column VOLUMEN_TOTAL into table TIENDA	
UPDATE TIENDA, TD 
SET TIENDA.VOLUMEN_TOTAL= (SELECT TD.VOLUMEN_TOTAL FROM TD WHERE TD.ID_TIENDA =tienda.ID_TIENDA) ; 

-- update column VOLUMEN_22 into table TIENDA
UPDATE TIENDA, TD_22 
SET TIENDA.VOLUMEN_22= (SELECT TD_22.VOLUMEN_22 FROM TD_22 WHERE TD_22.ID_TIENDA =tienda.ID_TIENDA) ; 

UPDATE TIENDA SET TIENDA.VOLUMEN_22 = 0.0 WHERE TIENDA.VOLUMEN_22= NULL;

-- *** III. Setting the LIMITATION of CATEGORIA for each type of TIENDA

UPDATE TIENDA 
SET TIENDA.ID_CATEGORIA= (SELECT CATEGORIAS.ID_CATEGORIA FROM CATEGORIAS  WHERE TIENDA.VOLUMEN_22> CATEGORIAS.VOL_MIN AND TIENDA.VOLUMEN_22< CATEGORIAS.VOL_MAX);
-- ******* Anuall DISCOUNT bases on the order amount

ALTER TABLE TIENDA ADD COLUMN DISCOUNT FLOAT(2);
UPDATE TIENDA, CATEGORIAS 
SET TIENDA.DISCOUNT = (TIENDA.VOLUMEN_22*CATEGORIAS.DESCUENTO) WHERE TIENDA.ID_CATEGORIA=CATEGORIAS.ID_CATEGORIA;
-- ***************************************
-- 2. Utilizar la instrucción SQL de inserción de datos para insertar una fila en la tabla de pedidos.
SELECT * FROM PEDIDO, LINEA_PEDIDO;
  INSERT INTO `TareaFinal`.`PEDIDO` (`ID_PEDIDO`, `FECHA_PEDIDO`,`ID_TIENDA`) VALUES ('16', curdate(),'ECI03');

INSERT INTO `TareaFinal`.`LINEA_PEDIDO` (`ID_LINEA_PEDIDO`, `ID_ARTICULO`, `ID_PEDIDO`, `CANTIDAD`) VALUES ('27', '00014', '16', '500');

-- ***************************************
-- 3. Visualizar mediante una instrucción SQL todas las tiendas que componen la red de distribución de la fábrica, se deberán detallar: nombre de la tienda, dirección, descripción de la categoría, descuento y límite de crédito asociado a la tienda.
-- CREATE VIEW SELECCION_COMPRA AS SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra

CREATE VIEW ALL_TIENDAS AS
	SELECT TIENDA.ID_TIENDA,TIENDA.NOMBRE,
        concat(TIENDA.calle,', ',TIENDA.numero, ', ',TIENDA.poblacion,', ',TIENDA.ciudad) as 'direction',
        TIENDA.TEL, TIENDA.EMAIL, TIENDA.ID_Categoria, TIENDA.LIMITE_CREDITO 
	FROM TIENDA ; 
    
 CREATE VIEW ALL_TIENDAS_1 AS
	SELECT TIENDA.ID_TIENDA,TIENDA.NOMBRE,
        concat(TIENDA.calle,', ',TIENDA.numero, ', ',TIENDA.poblacion,', ',TIENDA.ciudad) as 'direction',
        TIENDA.TEL, TIENDA.EMAIL, TIENDA.ID_Categoria,TIENDA.VOLUMEN_TOTAL, VOLUMEN_22, DISCOUNT AS 'A.DISCOUNT',  TIENDA.LIMITE_CREDITO 
	FROM TIENDA ;    

-- ***************************************											
-- 4. Visualizar mediante una instrucción SQL los pedidos suministrados a cada una de las tiendas en un período determinado (último año). Se deberán obtener los siguientes datos:
--  número de pedido, fecha de suministro, dirección de entrega, y el importe total del pedido.
-- CREATE VIEW TODOS_PEDIDOS_2022_OCT AS SELECT * from PEDIDO where FECHA_PEDIDO between '2022-10-01' and '2022-10-31' order by FECHA_PEDIDO;
drop view if exists COMPRA_22_OCT;
CREATE VIEW COMPRA_22_Oct AS 
	SELECT tienda.ID_TIENDA, pedido.ID_PEDIDO, PEDIDO.FECHA_PEDIDO,
			concat(  tienda.calle,', ',tienda.numero, ', ',tienda.poblacion,', ',tienda.ciudad) as 'direction',
			(select cast(sum(lp.CANTIDAD*a.PRECIO)as float) from LINEA_PEDIDO lp,ARTICULO a  where lp.ID_PEDIDO=PEDIDO.ID_PEDIDO and a.ID_ARTICULO=lp.ID_ARTICULO ) as Imp 
	FROM TIENDA, PEDIDO where tienda.ID_tienda=Pedido.ID_tienda  AND PEDIDO.FECHA_PEDIDO 
    BETWEEN '2022-10-01' AND '2022-10-31'  order by ID_PEDIDO;
 
 
-- *************************************

-- 5. Identificar mediante una consulta SQL los repartos realizados por cada uno de los proveedores destinados a ello. 
-- Se deberá identificar al menos: Nombre del proveedor de reparto, su dirección y la relación de los artículos suministrados en cada reparto. 


CREATE VIEW PROVEEDOR_ENTREGA AS 
	SELECT 
		pr.ID_PROVEEDOR,	pr.nombre,
		concat(  pr.calle,', ',pr.numero, ', ',pr.poblacion,', ',pr.ciudad) as 'direction proveedor',
        -- lp.ID_LINEA_PEDIDO, lp.ID_ARTICULO, 
           sum(lp.CANTIDAD) as cantidad 
        -- lp.CANTIDAD*a.precio as importe
    FROM PROVEEDOR pr,LINEA_PEDIDO lp, ARTICULO a, DISTRIBUCION d
    WHERE  (lp.ID_ARTICULO=a.ID_ARTICULO and  lp.ID_LINEA_PEDIDO=d.ID_LINEA_PEDIDO 
			and d.ID_PROVEEDOR=pr.ID_PROVEEDOR) group by pr.ID_PROVEEDOR;
		
	

-- 6. Totalizar los repartos anuales realizados por cada proveedor de reparto.
drop view if exists Q6a;
drop view if exists Q6b;
CREATE VIEW Q6a AS SELECT 
  EXTRACT(year FROM d.FECHA_DIST) AS year,
  sum(lp.CANTIDAD) as 'tot(und)'
FROM  PROVEEDOR pr,LINEA_PEDIDO lp, ARTICULO a, DISTRIBUCION d
WHERE  ( lp.ID_LINEA_PEDIDO=d.ID_LINEA_PEDIDO and d.ID_PROVEEDOR=pr.ID_PROVEEDOR)	
GROUP BY EXTRACT(year FROM d.FECHA_DIST);

CREATE VIEW Q6b AS SELECT 
	pr.ID_PROVEEDOR,
	sum(lp.CANTIDAD) as 'cantidad_2022' 
FROM  PROVEEDOR pr,LINEA_PEDIDO lp, ARTICULO a, DISTRIBUCION d
WHERE  ( lp.ID_LINEA_PEDIDO=d.ID_LINEA_PEDIDO and d.ID_PROVEEDOR=pr.ID_PROVEEDOR and d.FECHA_DIST between '2022-01-01' and '2022-12-31') 	
GROUP BY pr.ID_PROVEEDOR;

-- 7. Identificar los cambios a realizar en el modelo relacional y en BBDD para clasificar a los proveedores de reparto en categorías, 
-- de la misma forma que clasificamos las tiendas por categorías.

DROP TABLE IF EXISTS CATEGORIAS_P;
CREATE TABLE CATEGORIAS_P (
			ID_CATEGORIA varchar(125),
			DESCUENTO float(2), 
			VOL_MIN INT,
			VOL_MAX INT,
			PRIMARY KEY (ID_CATEGORIA)    
);

ALTER TABLE PROVEEDOR
ADD COLUMN ID_CATEGORIA varchar(125),
ADD COLUMN VOLUMEN INT,
ADD FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS_P (ID_CATEGORIA);

SELECT* FROM CATEGORIAS_P;
INSERT INTO CATEGORIAS_P(ID_CATEGORIA, DESCUENTO, VOL_MIN, VOL_MAX) VALUE ('A', 0.2, 501,10000);
INSERT INTO CATEGORIAS_P(ID_CATEGORIA, DESCUENTO, VOL_MIN, VOL_MAX) VALUE ('B', 0.1, 301,500);
INSERT INTO CATEGORIAS_P(ID_CATEGORIA, DESCUENTO, VOL_MIN, VOL_MAX) VALUE ('C', 0.05, 100,300);

-- UPDATE COLUMN VOLUMEN IN TABLE PROVEDOR
UPDATE PROVEEDOR,Q6B SET PROVEEDOR.VOLUMEN = Q6B.CANTIDAD_2022 WHERE PROVEEDOR.ID_PROVEEDOR=Q6B.ID_PROVEEDOR ;

-- UPDATE A COLUMN ID_CATEGORIA IN TABLE PROVEDOR
UPDATE PROVEEDOR
 SET PROVEEDOR.ID_CATEGORIA = (SELECT CATEGORIAS_P.ID_CATEGORIA FROM CATEGORIAS_P
 WHERE PROVEEDOR.VOLUMEN>CATEGORIAS_P.VOL_MIN AND PROVEEDOR.VOLUMEN<CATEGORIAS_P.VOL_MAX) ; 



-- 8. Necesitamos introducir nuevos atributos en la tabla de artículos, 
-- la fábrica ha descubierto que puede comprar un artículo de parecidas características al nuestro y distribuirlo como marca blanca.

ALTER TABLE ARTICULO
ADD COLUMN MARCA_BLANCA VARCHAR(25);


-- 9. Queremos ampliar la información del proveedor de suministro, 
-- para ello necesitaríamos incorporar los datos relativos a las zonas de cobertura de este (Países y Regiones). 
-- Determinar los cambios a realizar a nivel físico y lógico.

CREATE TABLE ZONAS (
			codZona int,
			Pais varchar(50),
            Region varchar(50),
			PRIMARY KEY (codZona)    
);
DESCRIBE ZONAS;

CREATE TABLE PRO_ZONAS (
			ID_PRO_ZONAS VARCHAR(50),
			ID_PROVEEDOR varchar(125),
            codZona int,
			PRIMARY KEY (ID_PRO_ZONAS, codZona,ID_PROVEEDOR),
            FOREIGN KEY (codZona) REFERENCES ZONAS (codZona),
            FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR (ID_PROVEEDOR)
);
DESCRIBE PRO_ZONAS;

-- 10. ¿Qué podríamos hacer para realizar un backup de la tabla de pedidos / líneas de pedido?
--  Esto es, necesitamos hacer todos los días un proceso de backup a otra Base de Datos 
-- en las que se consolida toda la venta del grupo (pedidos, líneas de pedido).

CREATE TABLE DAILY_BACK_UP AS
	SELECT  
			p.ID_PEDIDO,curdate(),(sum(lp.CANTIDAD*a.precio))as 'amount'  
		FROM LINEA_PEDIDO lp, ARTICULO a, PEDIDO p
		WHERE  lp.ID_ARTICULO=a.ID_ARTICULO and  lp.ID_PEDIDO=p.ID_PEDIDO and p.FECHA_PEDIDO=current_date() 
        GROUP BY p.ID_PEDIDO ;
ALTER TABLE DAILY_BACK_UP MODIFY amount FLOAT(2);
        






