-- Create table
create table NBI_CFG_TASK
(
  ID             NUMBER not null,
  PERIOD         VARCHAR2(100 CHAR),
  CURR_DATA_TIME DATE,
  DESCRIPTION    VARCHAR2(100 CHAR),
  CONFIGNAME     VARCHAR2(100 CHAR),
  END_DATA_TIME  DATE,
  ISUSED         NUMBER,
  PCNAME         VARCHAR2(100 CHAR),
  REPORTOFFSET   NUMBER,
  REPORTTIME     DATE
)
tablespace CONET
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    minextents 1
    maxextents unlimited
  );