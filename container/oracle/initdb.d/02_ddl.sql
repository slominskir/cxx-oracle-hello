alter session set container = XEPDB1;

CREATE TABLE ORALIB.TEST
(
    KEY                VARCHAR2(128 CHAR)  NOT NULL,
    VALUE              VARCHAR2(4000 BYTE) NOT NULL
);