select * from cfg_provice_perf t where t.datatype= 2 and classCode=2 and vendor='ZY0000' /*and t.id=1002023*/ order by id;
select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0808' /*and t.chian_name like '%D2.1%'*/ order by id;
select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0804' order by id;
select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0810' order by id
--HW
--D2.6 AT������������ӳɹ����� SUM(nvl(AT_CONN_SUC_DO,0)) D2.7 AN������������ӳɹ����� SUM(nvl(AN_CONN_SUC_DO,0))
--D2.4 AT�������������������� SUM(nvl(AT_CONN_ATT_DO,0)) D2.5 AN��������������������SUM(nvl(AN_CONN_ATT_DO,0))
--ZTE
--D2.6 AT������������ӳɹ�����SUM(nvl(AT_CONN_SUC_DO,0)) D2.7 AN������������ӳɹ����� SUM(nvl(AN_CONN_SUC_DO,0))
--D2.4 AT�������������������� SUM(nvl(AT_CONN_ATT_DO,0)) D2.5 AN�������������������� SUM(nvl(AN_CONN_ATT_DO,0))
--D2.1 �������ӳɹ���
--CASE WHEN SUM(nvl(DO_CONN_ATT,0))=0 THEN 0 WHEN SUM(nvl(DO_SUC_CONN_NUM,0))>=SUM(nvl(DO_CONN_ATT,0)) THEN 99.99 ELSE 
--ROUND(SUM(nvl(DO_SUC_CONN_NUM,0)) / SUM(nvl(DO_CONN_ATT,0)) * 100, 2) END
