CREATE TABLE DEPARTAMENTO (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100)
);

CREATE TABLE MUNICIPIO (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    departamento_id NUMBER,
    FOREIGN KEY (departamento_id) REFERENCES DEPARTAMENTO(id)
);

CREATE TABLE SUCURSALES_AGENCIAS (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    direccion VARCHAR2(255),
    municipio_id NUMBER,
    departamento_id NUMBER,
    FOREIGN KEY (municipio_id) REFERENCES MUNICIPIO(id),
    FOREIGN KEY (departamento_id) REFERENCES DEPARTAMENTO(id)
);

CREATE TABLE CLIENTES (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    numero_cuenta VARCHAR2(100)
);

CREATE TABLE EMPLEADOS (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    sucursal_id NUMBER,
    departamento_id NUMBER,
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSALES_AGENCIAS(id),
    FOREIGN KEY (departamento_id) REFERENCES DEPARTAMENTO(id)
);

CREATE TABLE CUENTAS (
    id NUMBER PRIMARY KEY,
    tipo_cuenta VARCHAR2(50),
    saldo NUMBER,
    cliente_id NUMBER,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id)
);

CREATE TABLE TARJETAS_DE_CREDITO (
    id NUMBER PRIMARY KEY,
    numero_tarjeta VARCHAR2(100),
    fecha_vencimiento DATE,
    cliente_id NUMBER,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id)
);

CREATE TABLE PRESTAMOS (
    id NUMBER PRIMARY KEY,
    monto NUMBER,
    fecha_inicio DATE,
    cliente_id NUMBER,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id)
);

CREATE TABLE TRANSACCIONES (
    id NUMBER PRIMARY KEY,
    monto NUMBER,
    fecha DATE,
    cuenta_id NUMBER,
    sucursal_id NUMBER,
    FOREIGN KEY (cuenta_id) REFERENCES CUENTAS(id),
    FOREIGN KEY (sucursal_id) REFERENCES SUCURSALES_AGENCIAS(id)
);
