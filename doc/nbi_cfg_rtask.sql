 
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
  is '-1:ʧ�� 0:��Ҫ���� 1�������ɹ�';
comment on column NBI_CFG_RTASK.CAUSE
  is 'ÿ��ʧ�ܵ�ԭ�򣬰��չ̶���ʽ';
comment on column NBI_CFG_RTASK.ACTIONID
  is '���Ϊ�վͱ�ʾȫ��Ҫ����';