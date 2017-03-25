delete from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0808' and id in (8081003,8081004,8081006);

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081004', 'MC1.4', '呼叫尝试次数-CS', 'SUM(nvl(CALL_ATT_CS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081006', 'MC1.6', '呼叫建立成功率-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT_CS,0)) = 0 THEN 0  WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT_CS,0)) THEN 99.99 ELSE   

ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT_CS,0)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081003', 'MC1.3', '呼叫建立成功率(%)', 'CASE WHEN (SUM(nvl(CALL_ATT_CS,0)) + SUM(nvl(CALL_ATT_PS,0))) = 0 THEN 0  WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl

(CALL_SETUP_SUCC_PS,0)))>=(SUM(CALL_ATT_CS) + SUM(CALL_ATT_PS)) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CALL_SETUP_SUCC_PS,0)))/(SUM(CALL_ATT_CS) + 

SUM(CALL_ATT_PS)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

commit;