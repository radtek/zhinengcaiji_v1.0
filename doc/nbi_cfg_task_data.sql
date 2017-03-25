prompt PL/SQL Developer import file
prompt Created on 2012年2月7日 by Administrator
set feedback off
set define off
prompt Disabling triggers for NBI_CFG_TASK...
alter table NBI_CFG_TASK disable all triggers;
prompt Deleting NBI_CFG_TASK...
delete from NBI_CFG_TASK;
commit;
prompt Loading NBI_CFG_TASK...
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (11, '5', to_date('07-02-2012 17:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'work目录扫描并上报', 'work目录扫描并上报.xml', null, 1, 'uway2', 3, to_date('07-02-2012 18:05:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (13, 'M', to_date('01-02-2012', 'dd-mm-yyyy'), '测评信息数据上报', '测评信息数据上报.xml', null, 1, 'uway2', 3, to_date('03-03-2012', 'dd-mm-yyyy'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (4, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '配置数据测试', '配置数据任务.xml', null, 1, 'uway2', 1, to_date('08-02-2012 01:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (5, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '性能数据测试', '性能数据任务后台.xml', null, 1, 'uway2', 2, to_date('08-02-2012 04:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (7, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '其他数据上报配置', '其他数据上报配置.xml', null, 1, 'uway2', 1, to_date('08-02-2012 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into NBI_CFG_TASK (ID, PERIOD, CURR_DATA_TIME, DESCRIPTION, CONFIGNAME, END_DATA_TIME, ISUSED, PCNAME, REPORTOFFSET, REPORTTIME)
values (12, 'D', to_date('07-02-2012', 'dd-mm-yyyy'), '话单数据配置', '话单数据配置后台.xml', null, 1, 'uway2', 1, to_date('08-02-2012 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 6 records loaded
prompt Enabling triggers for NBI_CFG_TASK...
alter table NBI_CFG_TASK enable all triggers;
set feedback on
set define on
prompt Done.
