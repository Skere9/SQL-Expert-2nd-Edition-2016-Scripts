SET ECHO ON

REM
REM 6. Reporting Aggregated Data Using the Group Functions
REM
REM Setup
REM


REM
REM CREATE TABLE EMPLOYEES
REM

DROP   TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES
(  EMPLOYEE_ID         NUMBER(7)
 , SHIP_ID             NUMBER(7)
 , FIRST_NAME          VARCHAR2(20)
 , LAST_NAME           VARCHAR2(30)
 , POSITION_ID         NUMBER
 , SSN                 VARCHAR2(11)
 , DOB                 DATE
 , PRIMARY_PHONE       VARCHAR2(20)
 , CONSTRAINT          PK_EMPLOYEES 
                       PRIMARY KEY (EMPLOYEE_ID)
); 

REM
REM CREATE TABLE PAY_HISTORY
REM

DROP   TABLE PAY_HISTORY;
CREATE TABLE PAY_HISTORY
(  PAY_HISTORY_ID      NUMBER
 , EMPLOYEE_ID         NUMBER
 , SALARY              NUMBER(10,2)
 , START_DATE          DATE
 , END_DATE            DATE
 , CONSTRAINT          PK_PAY_HISTORY_ID 
                       PRIMARY KEY (PAY_HISTORY_ID)
);

REM
REM CREATE TABLE VENDORS
REM

DROP   TABLE VENDORS;
CREATE TABLE VENDORS
(  VENDOR_ID           NUMBER
 , VENDOR_NAME         VARCHAR2(20)
 , STATUS              NUMBER(3)
 , CATEGORY            VARCHAR2(10)
 , CONSTRAINT          PK_VENDOR_ID
                       PRIMARY KEY (VENDOR_ID)
);

REM
REM CREATE TABLE SHIP_CABINS
REM

DROP   TABLE SHIP_CABINS;
CREATE TABLE SHIP_CABINS
(  SHIP_CABIN_ID       NUMBER
 , SHIP_ID             NUMBER(7)
 , ROOM_NUMBER         VARCHAR2(5)
 , ROOM_STYLE          VARCHAR2(10)
 , ROOM_TYPE           VARCHAR2(20)
 , WINDOW              VARCHAR2(10)
 , GUESTS              NUMBER(3)
 , SQ_FT               NUMBER(6)
 , BALCONY_SQ_FT       NUMBER(6)
 , CONSTRAINT          PK_SHIP_CABIN_ID 
                       PRIMARY KEY (SHIP_CABIN_ID)
 , CONSTRAINT          CK_WINDOW 
                       CHECK (WINDOW IN ('Ocean',
                              'Balcony', 'None'))
);

REM
REM CREATE TABLE ORDERS
REM

DROP   TABLE ORDERS;
CREATE TABLE ORDERS
(  ORDER_ID             NUMBER
 , ORDER_DATE           DATE
 , SUBTOTAL             NUMBER
 , CONSTRAINT PK_ORDER_ID 
              PRIMARY KEY (ORDER_ID)
);

REM
REM CREATE SEQUENCE SEQ_EMPLOYEE_ID
REM

DROP   SEQUENCE SEQ_EMPLOYEE_ID;
CREATE SEQUENCE SEQ_EMPLOYEE_ID;

REM
REM CREATE SEQUENCE SEQ_PAY_HISTORY_ID
REM

DROP   SEQUENCE SEQ_PAY_HISTORY_ID;
CREATE SEQUENCE SEQ_PAY_HISTORY_ID;

REM
REM CREATE SEQUENCE SEQ_SHIP_CABIN_ID
REM

DROP   SEQUENCE SEQ_SHIP_CABIN_ID;
CREATE SEQUENCE SEQ_SHIP_CABIN_ID;

REM
REM CREATE SEQUENCE SEQ_VENDOR_ID
REM

DROP   SEQUENCE SEQ_VENDOR_ID;
CREATE SEQUENCE SEQ_VENDOR_ID;

REM
REM CREATE SEQUENCE SEQ_ORDER_ID
REM

DROP   SEQUENCE SEQ_ORDER_ID;
CREATE SEQUENCE SEQ_ORDER_ID;

REM
REM INSERT INTO ORDERS 
REM

INSERT INTO ORDERS VALUES
(SEQ_ORDER_ID.NEXTVAL, (SYSDATE-3), 230);

INSERT INTO ORDERS VALUES
(SEQ_ORDER_ID.NEXTVAL, (SYSDATE-5), 4750);

INSERT INTO ORDERS VALUES
(SEQ_ORDER_ID.NEXTVAL, (SYSDATE+3), 5000);

INSERT INTO ORDERS VALUES
(SEQ_ORDER_ID.NEXTVAL, (SYSDATE-9), 87);

INSERT INTO ORDERS VALUES
(SEQ_ORDER_ID.NEXTVAL, (SYSDATE+2), 119);

REM
REM INSERT INTO EMPLOYEES AND PAY_HISTORY 
REM

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Howard','Hoddlestein'
 , 2, 1);

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 73922
 , '04-JUN-01'
 , '');

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Joe','Smith'
 , 2, 3); 

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 47000
 , '04-JUN-01'
 , '12-DEC-07');

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 58000
 , '13-JUL-09'
 , '');

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Mike','West'
 , 2, 4);

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 37450
 , '04-JUN-01'
 , '08-APR-05');

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 91379
 , '05-FEB-12'
 , '');

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Alice','Lindon'
 , 2, 3);

INSERT INTO PAY_HISTORY
(  PAY_HISTORY_ID
 , EMPLOYEE_ID
 , SALARY
 , START_DATE
 , END_DATE)
VALUES 
(  SEQ_PAY_HISTORY_ID.NEXTVAL
 , SEQ_EMPLOYEE_ID.CURRVAL
 , 45500
 , '04-JUN-01'
 , '');

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Al','Smith'
 , 2, 1);

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Trish','West'
 , 2, 2);

INSERT INTO EMPLOYEES
(  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 , POSITION_ID, SHIP_ID)
VALUES
(  SEQ_EMPLOYEE_ID.NEXTVAL
 , 'Buffy','Worthington'
 , 2, 1);

REM
REM INSERT INTO SHIP_CABINS
REM

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 102        , 'Suite'    , 'Standard', 'Ocean',      4,   533, 139);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 103        , 'Stateroom', 'Standard', 'Ocean',      2,   160, NULL);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 104        , 'Suite'    , 'Standard', 'None' ,      4,   533, 139);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 105        , 'Stateroom', 'Standard', 'Ocean',      3,   205, NULL);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 106        , 'Suite'    , 'Standard', 'None' ,      6,   586, 193);
  
INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 107        , 'Suite'    , 'Royal'   , 'Ocean',      5,  1524, 843);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 108        , 'Stateroom', 'Large'   , 'None' ,      2,   211, NULL);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 109        , 'Stateroom', 'Standard', 'None' ,      2,   180, NULL);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 110        , 'Stateroom', 'Large'   , 'None' ,      2,   225, NULL);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 702        , 'Suite'    , 'Presidential','None',    5,  1142, 476);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 703        , 'Suite'    , 'Royal'   , 'Ocean' ,      5,  1745, 974);

INSERT INTO SHIP_CABINS
  (  SHIP_CABIN_ID, SHIP_ID, ROOM_NUMBER, ROOM_STYLE , ROOM_TYPE ,  WINDOW, GUESTS, SQ_FT, BALCONY_SQ_FT)
VALUES               
  (  SEQ_SHIP_CABIN_ID.NEXTVAL
                  , 1      , 704        , 'Suite'    , 'Skyloft' , 'Ocean' ,      8,   722, 410);

REM
REM INSERT INTO VENDORS
REM

INSERT INTO VENDORS 
  (VENDOR_ID, VENDOR_NAME, STATUS, CATEGORY)
  VALUES
  (SEQ_VENDOR_ID.NEXTVAL, 'Acme Steaks', 17, NULL);

INSERT INTO VENDORS 
  (VENDOR_ID, VENDOR_NAME, STATUS, CATEGORY)
  VALUES
  (SEQ_VENDOR_ID.NEXTVAL, 'Acme Poker Chips', NULL, NULL);

COMMIT;

REM
REM You are ready to begin.
REM 
