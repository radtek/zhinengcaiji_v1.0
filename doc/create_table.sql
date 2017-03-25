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
);
-- Add comments to the columns 
comment on column NBI_CFG_TASK.ID
  is '任务编号';
comment on column NBI_CFG_TASK.PERIOD
  is '上报周期:m H D W M HY Y 默认为分钟(填写数字时)';
comment on column NBI_CFG_TASK.CURR_DATA_TIME
  is '任务数据时间';
comment on column NBI_CFG_TASK.DESCRIPTION
  is '任务描述';
comment on column NBI_CFG_TASK.CONFIGNAME
  is '模板绝对路径：如果数据库记录为空，那么就为(nbi_任务号.xml),如果仅为文件名那么就为(配置路径+文件名)，如果为绝对路径就不用改变';
comment on column NBI_CFG_TASK.END_DATA_TIME
  is '本任务执行结束时间';
comment on column NBI_CFG_TASK.ISUSED
  is '任务是否可用';
comment on column NBI_CFG_TASK.PCNAME
  is '机器名称';
comment on column NBI_CFG_TASK.REPORTOFFSET
  is '上报时间偏移量，单位为分钟';
comment on column NBI_CFG_TASK.REPORTTIME
  is '上报时间';

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
);
-- Add comments to the columns 
comment on column NBI_CFG_RTASK.ID
  is '补报任务编号';
comment on column NBI_CFG_RTASK.TASKID
  is '任务编号';
comment on column NBI_CFG_RTASK.CURR_DATA_TIME
  is '任务数据时间';
comment on column NBI_CFG_RTASK.COUNTER
  is '补报次数，默认为0';
comment on column NBI_CFG_RTASK.STATE
  is '补报任务状态：-1:失败 0:需要补报 1：补报成功';
comment on column NBI_CFG_RTASK.CAUSE
  is '每次失败的原因，按照固定格式';
comment on column NBI_CFG_RTASK.ACTIONID
  is '每次补报时模板中action节点对应的id号，多个用(,)分隔，如果为空就表示此模板所有action的都要补报';


-- Create sequence 
create sequence SEQ_NBI_CFG_RTASK
minvalue 1
maxvalue 9999999999999999
start with 1
increment by 1
cache 4;



-- NBI记录日志的表
create table NBI_LOG_REPORT
(
  DATA_TYPE       NUMBER(2) not null,
  NET_TYPE        NUMBER(2) not null,
  NET_GRAN        NUMBER(2) not null,
  TIME_GRAN       NUMBER(2) not null,
  DATA_TIME       DATE not null,
  FILE_NAME       VARCHAR2(512) not null,
  FILE_FTP_DIR    VARCHAR2(512) not null,
  FILE_SIZE_BYTES NUMBER not null,
  RECORD_COUNT    NUMBER not null,
  FTP_IP          VARCHAR2(256) not null,
  FTP_PORT        NUMBER(6) not null,
  FTP_USER        VARCHAR2(256) not null,
  UPLOAD_RESULT   NUMBER(2) not null,
  FAIL_REASON     VARCHAR2(1024),
  INSERT_TIME     DATE
);
-- Add comments to the columns 
comment on column NBI_LOG_REPORT.DATA_TYPE
  is '数据类型，见附录';
comment on column NBI_LOG_REPORT.NET_TYPE
  is '网络类型，1：CDMA，2：GSM，3：WCDMA。';
comment on column NBI_LOG_REPORT.NET_GRAN
  is '网元粒度：0  其它
1  MSC
2  BSC
3 BTS
4  CELL
5  SECT
6  CARR
';
comment on column NBI_LOG_REPORT.TIME_GRAN
  is '时间粒度：1：小时，2：天，3：周，4：月。';
comment on column NBI_LOG_REPORT.DATA_TIME
  is '数据时间';
comment on column NBI_LOG_REPORT.FILE_NAME
  is '上报文件名。';
comment on column NBI_LOG_REPORT.FILE_FTP_DIR
  is '文件上报后， 所在的FTP目 录。';
comment on column NBI_LOG_REPORT.FILE_SIZE_BYTES
  is '文件大小（以 字节为单位）。';
comment on column NBI_LOG_REPORT.RECORD_COUNT
  is '文件中包含的 数据条数。';
comment on column NBI_LOG_REPORT.FTP_IP
  is '上报FTP的地址。';
comment on column NBI_LOG_REPORT.FTP_PORT
  is '上报FTP的端口。';
comment on column NBI_LOG_REPORT.FTP_USER
  is '上报FTP时使用的用户 名。';
comment on column NBI_LOG_REPORT.UPLOAD_RESULT
  is '上传结果，0：上传成功，1：FTP连接失败，2：上传部分失败，3：上传完全失败。';
comment on column NBI_LOG_REPORT.FAIL_REASON
  is '上传不成功 时，此处填写失败 原 因。';
comment on column NBI_LOG_REPORT.INSERT_TIME
  is '插入数据库时间';



-- Add comments to the columns 
comment on column LOG_VALIDATE_RESULT.APP_ID
  is '系统名称(如：1：NBI,2:IGP)';
comment on column LOG_VALIDATE_RESULT.VALIDATE_OBJ
  is '数据类型: 将附录” 电信数据上报（NBI）具体数据类型参考';
comment on column LOG_VALIDATE_RESULT.DATA_TYPE
  is '采集或上报的对象，文件名或表名。';
comment on column LOG_VALIDATE_RESULT.FILED_NAME
  is '字段名';
comment on column LOG_VALIDATE_RESULT.FILED_VALUE
  is '字段值';
comment on column LOG_VALIDATE_RESULT.RULE
  is '正确取值范围';
comment on column LOG_VALIDATE_RESULT.NE_SYS_ID
  is '网元编号';
comment on column LOG_VALIDATE_RESULT.NE_LEVEL
  is '网元级别';
comment on column LOG_VALIDATE_RESULT.DATA_TIME
  is '数据时间';
comment on column LOG_VALIDATE_RESULT.CREATED_TIME
  is '时间戳（什么时候插的日志）';

   -- 数据核查规则表
create table CFG_VALIDATE_RULES
(
  APP_ID     NUMBER not null,
  DATA_TYPE  NUMBER not null,
  FILED_NAME VARCHAR2(30) not null,
  RULE       VARCHAR2(200) not null
);
-- Add comments to the columns 
comment on column CFG_VALIDATE_RULES.APP_ID
  is '系统ID(如：NBI为1,ICP为2) ';
comment on column CFG_VALIDATE_RULES.DATA_TYPE
  is '数据类型，比如：性能上报数据，话单数据，路测数据等。数据类型的数值标示参考数据类型表';
comment on column CFG_VALIDATE_RULES.FILED_NAME
  is '需核查的数据，此字段中的具体值与核查系统中输入值进行关联';
comment on column CFG_VALIDATE_RULES.RULE
  is '具体规则';
  
   
   -- 规则结果表
  CREATE TABLE LOG_VALIDATE_RESULT
   (  APP_ID NUMBER NOT NULL ENABLE, 
  VALIDATE_OBJ VARCHAR2(128) NOT NULL ENABLE, 
  DATA_TYPE NUMBER NOT NULL ENABLE, 
  FILED_NAME VARCHAR2(30) NOT NULL ENABLE, 
  FILED_VALUE VARCHAR2(30) NOT NULL ENABLE, 
  RULE VARCHAR2(200) NOT NULL ENABLE, 
  NE_SYS_ID VARCHAR2(20), 
  NE_LEVEL NUMBER, 
  DATA_TIME DATE, 
  CREATED_TIME DATE
   );
   
   --bsa日志表
CREATE TABLE LOG_BSA_UPLOAD_FILE
   (	FILE_NAME VARCHAR2(100), 
  FILE_PATH VARCHAR2(500), 
  FILE_LENGTH NUMBER, 
  DATA_TIME DATE, 
  UPLOAD_TIME DATE DEFAULT SYSDATE NOT NULL ENABLE, 
  STATE NUMBER, 
  RECORD_COUNT NUMBER
   );
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_NAME IS '例如  a.txt';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_PATH IS ' 例如 /bsa/a.txt 对应ftp上的路径';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_LENGTH IS ' 文件大小';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.DATA_TIME IS ' 此文件记录哪个时间点的数据';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.UPLOAD_TIME IS ' 文件上传时间';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.STATE IS '成功:0 失败:-1';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.RECORD_COUNT IS '文件记录条数';
   
   
   --如果bsa日志表已经存在，增加一个字段
alter table  LOG_BSA_UPLOAD_FILE   add RECORD_COUNT  number ; 

comment on column LOG_BSA_UPLOAD_FILE.RECOUD_COUNT
  is '文件记录条数';

--bassql表
CREATE TABLE CFG_BSA_SYNC_UPLOAD_SQL 
   (  SYNCTYPE VARCHAR2(10) NOT NULL ENABLE, 
  SYNC_DESC VARCHAR2(200), 
  SQL_TYPE NUMBER NOT NULL ENABLE, 
  SYNC_SQL CLOB NOT NULL ENABLE, 
  CREATE_TIME DATE NOT NULL ENABLE, 
  UPDATE_TIME DATE DEFAULT sysdate, 
  DATA_TYPE VARCHAR2(20)
   );
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNCTYPE IS '同步类型 . 计划同步：PLAN  全量同步:FULL 增量同步ADD  立即同步:INS';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNC_DESC IS '同步描述';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SQL_TYPE IS 'sql语句类型  查询：1   插入或更新或删除:2';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNC_SQL IS '前端平台查询或者NBI上报sql语句';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.CREATE_TIME IS '创建时间';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.UPDATE_TIME IS '更新时间';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.DATA_TYPE IS 'FULL,ADD ,MOD,DEL';
