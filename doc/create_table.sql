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
  is '������';
comment on column NBI_CFG_TASK.PERIOD
  is '�ϱ�����:m H D W M HY Y Ĭ��Ϊ����(��д����ʱ)';
comment on column NBI_CFG_TASK.CURR_DATA_TIME
  is '��������ʱ��';
comment on column NBI_CFG_TASK.DESCRIPTION
  is '��������';
comment on column NBI_CFG_TASK.CONFIGNAME
  is 'ģ�����·����������ݿ��¼Ϊ�գ���ô��Ϊ(nbi_�����.xml),�����Ϊ�ļ�����ô��Ϊ(����·��+�ļ���)�����Ϊ����·���Ͳ��øı�';
comment on column NBI_CFG_TASK.END_DATA_TIME
  is '������ִ�н���ʱ��';
comment on column NBI_CFG_TASK.ISUSED
  is '�����Ƿ����';
comment on column NBI_CFG_TASK.PCNAME
  is '��������';
comment on column NBI_CFG_TASK.REPORTOFFSET
  is '�ϱ�ʱ��ƫ��������λΪ����';
comment on column NBI_CFG_TASK.REPORTTIME
  is '�ϱ�ʱ��';

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
  is '����������';
comment on column NBI_CFG_RTASK.TASKID
  is '������';
comment on column NBI_CFG_RTASK.CURR_DATA_TIME
  is '��������ʱ��';
comment on column NBI_CFG_RTASK.COUNTER
  is '����������Ĭ��Ϊ0';
comment on column NBI_CFG_RTASK.STATE
  is '��������״̬��-1:ʧ�� 0:��Ҫ���� 1�������ɹ�';
comment on column NBI_CFG_RTASK.CAUSE
  is 'ÿ��ʧ�ܵ�ԭ�򣬰��չ̶���ʽ';
comment on column NBI_CFG_RTASK.ACTIONID
  is 'ÿ�β���ʱģ����action�ڵ��Ӧ��id�ţ������(,)�ָ������Ϊ�վͱ�ʾ��ģ������action�Ķ�Ҫ����';


-- Create sequence 
create sequence SEQ_NBI_CFG_RTASK
minvalue 1
maxvalue 9999999999999999
start with 1
increment by 1
cache 4;



-- NBI��¼��־�ı�
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
  is '�������ͣ�����¼';
comment on column NBI_LOG_REPORT.NET_TYPE
  is '�������ͣ�1��CDMA��2��GSM��3��WCDMA��';
comment on column NBI_LOG_REPORT.NET_GRAN
  is '��Ԫ���ȣ�0  ����
1  MSC
2  BSC
3 BTS
4  CELL
5  SECT
6  CARR
';
comment on column NBI_LOG_REPORT.TIME_GRAN
  is 'ʱ�����ȣ�1��Сʱ��2���죬3���ܣ�4���¡�';
comment on column NBI_LOG_REPORT.DATA_TIME
  is '����ʱ��';
comment on column NBI_LOG_REPORT.FILE_NAME
  is '�ϱ��ļ�����';
comment on column NBI_LOG_REPORT.FILE_FTP_DIR
  is '�ļ��ϱ��� ���ڵ�FTPĿ ¼��';
comment on column NBI_LOG_REPORT.FILE_SIZE_BYTES
  is '�ļ���С���� �ֽ�Ϊ��λ����';
comment on column NBI_LOG_REPORT.RECORD_COUNT
  is '�ļ��а����� ����������';
comment on column NBI_LOG_REPORT.FTP_IP
  is '�ϱ�FTP�ĵ�ַ��';
comment on column NBI_LOG_REPORT.FTP_PORT
  is '�ϱ�FTP�Ķ˿ڡ�';
comment on column NBI_LOG_REPORT.FTP_USER
  is '�ϱ�FTPʱʹ�õ��û� ����';
comment on column NBI_LOG_REPORT.UPLOAD_RESULT
  is '�ϴ������0���ϴ��ɹ���1��FTP����ʧ�ܣ�2���ϴ�����ʧ�ܣ�3���ϴ���ȫʧ�ܡ�';
comment on column NBI_LOG_REPORT.FAIL_REASON
  is '�ϴ����ɹ� ʱ���˴���дʧ�� ԭ ��';
comment on column NBI_LOG_REPORT.INSERT_TIME
  is '�������ݿ�ʱ��';



-- Add comments to the columns 
comment on column LOG_VALIDATE_RESULT.APP_ID
  is 'ϵͳ����(�磺1��NBI,2:IGP)';
comment on column LOG_VALIDATE_RESULT.VALIDATE_OBJ
  is '��������: ����¼�� ���������ϱ���NBI�������������Ͳο�';
comment on column LOG_VALIDATE_RESULT.DATA_TYPE
  is '�ɼ����ϱ��Ķ����ļ����������';
comment on column LOG_VALIDATE_RESULT.FILED_NAME
  is '�ֶ���';
comment on column LOG_VALIDATE_RESULT.FILED_VALUE
  is '�ֶ�ֵ';
comment on column LOG_VALIDATE_RESULT.RULE
  is '��ȷȡֵ��Χ';
comment on column LOG_VALIDATE_RESULT.NE_SYS_ID
  is '��Ԫ���';
comment on column LOG_VALIDATE_RESULT.NE_LEVEL
  is '��Ԫ����';
comment on column LOG_VALIDATE_RESULT.DATA_TIME
  is '����ʱ��';
comment on column LOG_VALIDATE_RESULT.CREATED_TIME
  is 'ʱ�����ʲôʱ������־��';

   -- ���ݺ˲�����
create table CFG_VALIDATE_RULES
(
  APP_ID     NUMBER not null,
  DATA_TYPE  NUMBER not null,
  FILED_NAME VARCHAR2(30) not null,
  RULE       VARCHAR2(200) not null
);
-- Add comments to the columns 
comment on column CFG_VALIDATE_RULES.APP_ID
  is 'ϵͳID(�磺NBIΪ1,ICPΪ2) ';
comment on column CFG_VALIDATE_RULES.DATA_TYPE
  is '�������ͣ����磺�����ϱ����ݣ��������ݣ�·�����ݵȡ��������͵���ֵ��ʾ�ο��������ͱ�';
comment on column CFG_VALIDATE_RULES.FILED_NAME
  is '��˲�����ݣ����ֶ��еľ���ֵ��˲�ϵͳ������ֵ���й���';
comment on column CFG_VALIDATE_RULES.RULE
  is '�������';
  
   
   -- ��������
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
   
   --bsa��־��
CREATE TABLE LOG_BSA_UPLOAD_FILE
   (	FILE_NAME VARCHAR2(100), 
  FILE_PATH VARCHAR2(500), 
  FILE_LENGTH NUMBER, 
  DATA_TIME DATE, 
  UPLOAD_TIME DATE DEFAULT SYSDATE NOT NULL ENABLE, 
  STATE NUMBER, 
  RECORD_COUNT NUMBER
   );
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_NAME IS '����  a.txt';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_PATH IS ' ���� /bsa/a.txt ��Ӧftp�ϵ�·��';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.FILE_LENGTH IS ' �ļ���С';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.DATA_TIME IS ' ���ļ���¼�ĸ�ʱ��������';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.UPLOAD_TIME IS ' �ļ��ϴ�ʱ��';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.STATE IS '�ɹ�:0 ʧ��:-1';
 
   COMMENT ON COLUMN LOG_BSA_UPLOAD_FILE.RECORD_COUNT IS '�ļ���¼����';
   
   
   --���bsa��־���Ѿ����ڣ�����һ���ֶ�
alter table  LOG_BSA_UPLOAD_FILE   add RECORD_COUNT  number ; 

comment on column LOG_BSA_UPLOAD_FILE.RECOUD_COUNT
  is '�ļ���¼����';

--bassql��
CREATE TABLE CFG_BSA_SYNC_UPLOAD_SQL 
   (  SYNCTYPE VARCHAR2(10) NOT NULL ENABLE, 
  SYNC_DESC VARCHAR2(200), 
  SQL_TYPE NUMBER NOT NULL ENABLE, 
  SYNC_SQL CLOB NOT NULL ENABLE, 
  CREATE_TIME DATE NOT NULL ENABLE, 
  UPDATE_TIME DATE DEFAULT sysdate, 
  DATA_TYPE VARCHAR2(20)
   );
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNCTYPE IS 'ͬ������ . �ƻ�ͬ����PLAN  ȫ��ͬ��:FULL ����ͬ��ADD  ����ͬ��:INS';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNC_DESC IS 'ͬ������';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SQL_TYPE IS 'sql�������  ��ѯ��1   �������»�ɾ��:2';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.SYNC_SQL IS 'ǰ��ƽ̨��ѯ����NBI�ϱ�sql���';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.CREATE_TIME IS '����ʱ��';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.UPDATE_TIME IS '����ʱ��';
 
   COMMENT ON COLUMN CFG_BSA_SYNC_UPLOAD_SQL.DATA_TYPE IS 'FULL,ADD ,MOD,DEL';
