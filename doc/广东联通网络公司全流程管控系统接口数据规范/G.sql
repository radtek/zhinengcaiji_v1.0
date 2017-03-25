select t3.CHINA_NAME as "��վ����",
       t1.CHINA_NAME as "С������",
       t1.GSM_CELL_ID as "CGI",
       t2.T_TRAFFIC as "������(Erl)",
       t2.UL_GPRS_TRAFFIC + t2.DL_GPRS_TRAFFIC as "GPRS����(MB)",
       ' ' as "Ѱ���ɹ���(%)",
       t2.T_ASSIGN_SUC_RATE as "TCH����ɹ���(%)",
       t2.S_CALL_BLOCK_RATE as "SDCCHӵ����(%)",
       CASE
         WHEN NVL(t2.T_CALL_ATT, 0) = 0 THEN
          0
         ELSE
          ROUND(t2.T_CALL_BLOCK / t2.T_CALL_ATT * 100, 4)
       END as "TCHӵ����(%)",
       t2.T_CALL_UN_DROP_RATE as "ҵ���ŵ�������(%)",
       t2.HO_SUC_RATE as "�л��ɹ���(%)"
  from NE_CELL_G t1, PERF_CELL_G_DAY t2,NE_BTS_G t3
 where t1.ne_sys_id = t2.ne_sys_id and 
       t3.ne_sys_id = t1.related_bts;
