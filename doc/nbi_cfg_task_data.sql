prompt PL/SQL Developer import file
prompt Created on 2012��2��7�� by Administrator
set feedback off
set define off
prompt Disabling triggers for NBI_CFG_TASK...
alter table NBI_CFG_TASK disable all triggers;
prompt Deleting NBI_CFG_TASK...
delete from NBI_CFG_TASK;
commit;
prompt Loading NBI_CFG_TASK...
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (11, '5', to_date('07-02-2012 17:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'workĿ¼ɨ�貢�ϱ�', 'workĿ¼ɨ�貢�ϱ�.xml', null, 1, 'uway2', 3, to_date('07-02-2012 18:05:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (13, 'M', to_date('01-02-2012', 'dd-mm-yyyy'), '������Ϣ�����ϱ�', '������Ϣ�����ϱ�.xml', null, 1, 'uway2', 3, to_date('03-03-2012', 'dd-mm-yyyy'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (4, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '�������ݲ���', '������������.xml', null, 1, 'uway2', 1, to_date('08-02-2012 01:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (5, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '�������ݲ���', '�������������̨.xml', null, 1, 'uway2', 2, to_date('08-02-2012 04:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (7, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '���������ϱ�����', '���������ϱ�����.xml', null, 1, 'uway2', 1, to_date('08-02-2012 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (12, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '������������', '�����������ú�̨.xml', null, 1, 'uway2', 1, to_date('08-02-2012 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 6 records loaded
prompt Enabling triggers for NBI_CFG_TASK...
alter table NBI_CFG_TASK enable all triggers;
set feedback on
set define on
prompt Done.
