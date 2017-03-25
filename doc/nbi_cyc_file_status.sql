-- Create table
create table NBI_CYC_FILE_STATUS
(
  task_id     NUMBER,
  data_time   DATE,
  insert_time DATE default sysdate,
  file_name   VARCHAR2(100 CHAR),
  status      NUMBER
)
tablespace NOAPJS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table NBI_CYC_FILE_STATUS
  is '非周期上报文件状态表';
-- Add comments to the columns 
comment on column NBI_CYC_FILE_STATUS.task_id
  is '任务编号';
comment on column NBI_CYC_FILE_STATUS.data_time
  is '数据时间';
comment on column NBI_CYC_FILE_STATUS.insert_time
  is '入库时间';
comment on column NBI_CYC_FILE_STATUS.file_name
  is '文件名';
comment on column NBI_CYC_FILE_STATUS.status
  is '0 = 上报未成功，1=上报成功 ';
