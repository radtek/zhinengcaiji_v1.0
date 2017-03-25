select t1.BTS_NAME as "基站名称",
       t1.CELL_NAME as "小区名称",
       t1.PRIMARYSCRAMBLINGCODE as "扰码",
       t2.CSERLTRAFFIC as "CS域话务量(Erl)",
       t2.RLCUPTRAFFIC as "RLC上行流量（KB）",
       t2.RLCDOWNTRAFFIC as "RLC下行流量(KB)",
       case
         when (t2.NBRPAGINGSENDSUCC) >
              (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL) then
          100
         else
          ROUND(t2.NBRPAGINGSENDSUCC /
                (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL + 0.00000001) * 100,
                3)
       END as "寻呼成功率(%)",
       DECODE(t2.NBRCSRELERAB,
              0,
              0,
              ROUND((t2.NBRCSUNNORMRELERAB / ((t2.NBRCSRELERAB))) * 100, 3)) as "网络掉话率(%)",
       DECODE(t2.NBRRRCCONNREQ * t2.NBRRABASSIGNREQ,
              0,
              100,
              ROUND((t2.NBRRRCCONNSUCC / ((t2.NBRRRCCONNREQ))) *
                    (t2.NBRRABASSIGNSUCC / ((t2.NBRRABASSIGNREQ))) * 100,
                    3)) as "无线系统接通率(%)",
       DECODE((t2.nbrCs3gto2gHoOutReq),
              0,
              100,
              ROUND((t2.nbrCs3gto2gHoOutSucc) / (t2.nbrCs3gto2gHoOutReq) * 100,
                    3)) as "系统间CS域切出成功率(%)",
       case
         when (t2.NBRCS3GTO2GHOOUTSUCC) > (t2.NBRCSRABASSIGNSUCC) then
          100
         else
          round(t2.NBRCS3GTO2GHOOUTSUCC / (t2.NBRCSRABASSIGNSUCC + 0.0000001) * 100,
                3)
       end as "CS域切出比例(%)"
  from NE_CELL_W t1, PERF_CELL_W_D t2
 where t1.ne_cell_id = t2.ne_cell_id;
