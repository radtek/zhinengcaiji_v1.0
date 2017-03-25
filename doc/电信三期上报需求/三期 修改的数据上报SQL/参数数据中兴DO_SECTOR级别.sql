--中兴扇区DO省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME||'.'||CC.BTS_ID||'.'||CC.SECTOR_ID  AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                NULL as "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME||'.'||CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,
                  -------------------               ,
                  SEARCHWINDOWACTIVE,
                  SEARCHWINDOWNB,
                  SEARCHWINDOWREM,
                  PILOTADD1,
                  PILOTCOMPARE1,
                  PILOTDROP1,
                  PILOTDROPTIMER1,
                  SOFTSLOPE1,
                  ADDINTERCEPT1,
                  DROPINTERCEPT1
          FROM NE_CELL_C CC, 
               CLT_CM_R_H_S_HO_PARA_ZTE HPZ, 
               CFG_CITY_SID CS
         WHERE CC.CITY_ID || CC.BSC_ID = HPZ.OMCID(+)
           AND CC.BTS_ID = HPZ.SYSTEM(+)
           AND CC.SECTOR_ID = HPZ.CELLID(+)
           and CC.vendor = 'ZY0804'
           AND HPZ.STAMPTIME(+) =
               TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
           AND CC.CITY_ID = CS.CITYID(+);

