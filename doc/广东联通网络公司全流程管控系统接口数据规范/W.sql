select t1.BTS_NAME as "��վ����",
       t1.CELL_NAME as "С������",
       t1.PRIMARYSCRAMBLINGCODE as "����",
       t2.CSERLTRAFFIC as "CS������(Erl)",
       t2.RLCUPTRAFFIC as "RLC����������KB��",
       t2.RLCDOWNTRAFFIC as "RLC��������(KB)",
       case
         when (t2.NBRPAGINGSENDSUCC) >
              (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL) then
          100
         else
          ROUND(t2.NBRPAGINGSENDSUCC /
                (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL + 0.00000001) * 100,
                3)
       END as "Ѱ���ɹ���(%)",
       DECODE(t2.NBRCSRELERAB,
              0,
              0,
              ROUND((t2.NBRCSUNNORMRELERAB / ((t2.NBRCSRELERAB))) * 100, 3)) as "���������(%)",
       DECODE(t2.NBRRRCCONNREQ * t2.NBRRABASSIGNREQ,
              0,
              100,
              ROUND((t2.NBRRRCCONNSUCC / ((t2.NBRRRCCONNREQ))) *
                    (t2.NBRRABASSIGNSUCC / ((t2.NBRRABASSIGNREQ))) * 100,
                    3)) as "����ϵͳ��ͨ��(%)",
       DECODE((t2.nbrCs3gto2gHoOutReq),
              0,
              100,
              ROUND((t2.nbrCs3gto2gHoOutSucc) / (t2.nbrCs3gto2gHoOutReq) * 100,
                    3)) as "ϵͳ��CS���г��ɹ���(%)",
       case
         when (t2.NBRCS3GTO2GHOOUTSUCC) > (t2.NBRCSRABASSIGNSUCC) then
          100
         else
          round(t2.NBRCS3GTO2GHOOUTSUCC / (t2.NBRCSRABASSIGNSUCC + 0.0000001) * 100,
                3)
       end as "CS���г�����(%)"
  from NE_CELL_W t1, PERF_CELL_W_D t2
 where t1.ne_cell_id = t2.ne_cell_id;
