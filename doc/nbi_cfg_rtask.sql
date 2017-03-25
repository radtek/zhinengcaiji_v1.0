 
  -- Create table
create table NBI_CFG_RTASK
(
  ID             NUMBER not null,
  TASKID         NUMBER not null,
  CURR_DATA_TIME DATE not null,
  COUNTER        NUMBER default 0,
  STATE          NUMBER default 0,
  CAUSE          CLOB,
  ACTIONID       VARCHAR2(100)
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
-- Add comments to the columns 
comment on column NBI_CFG_RTASK.STATE
  is '-1:失败 0:需要补报 1：补报成功';
comment on column NBI_CFG_RTASK.CAUSE
  is '每次失败的原因，按照固定格式';
comment on column NBI_CFG_RTASK.ACTIONID
  is '如果为空就表示全都要补采';