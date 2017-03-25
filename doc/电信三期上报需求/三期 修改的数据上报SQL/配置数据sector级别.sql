select '%%Y-%%M-%%D' as "ʱ���", case BSC.vendor
when 'ZY0808' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID
when 'ZY0804' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID
when 'ZY0810' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID  end as "������ʶ", '' as "�ⲿ��Ԫ��ʶ", '${province_cn}' as "ʡ��", CITY.CITY_NAME as "����", replace(ADM.COUNTY_NAME,'��','')  as "������",'' as "����", '' as "�������",
'' as  "OMCOID",
bsc.china_name as "����RNC��ʶ",
'' as "����SM��ʶ",
bts.china_name as "��վ������",
 case BSC.vendor
when 'ZY0808' then BTS.BTS_ID
when 'ZY0804' then BTS.BTS_ID
when 'ZY0810' then BTS.BTS_ID end as "���̲��վ��ʶ", case BSC.vendor
when 'ZY0808' then  SECTOR.SECTOR_ID
when 'ZY0804' then  BTS.BTS_ID
when 'ZY0810' then  SECTOR.SECTOR_ID end as "���̲�������ʶ", case BSC.vendor
when 'ZY0808' then  SECTOR.SECTOR_ID
when 'ZY0804' then  SECTOR.SECTOR_ID
when 'ZY0810' then  SECTOR.SECTOR_ID end as "���̲�sector���", case BSC.vendor
when 'ZY0808' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','')
when 'ZY0804' then  to_char(SECTOR.CI)
when 'ZY0810' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','') end as "������ʶ_1X", case BSC.vendor
when 'ZY0808' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','')
when 'ZY0804' then  to_char(SECTOR.CI)
when 'ZY0810' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','') end as "������ʶ_DO", case BSC.vendor
when 'ZY0808' then  replace(SECTOR.CHINA_NAME,',','��')
when 'ZY0804' then  replace(SECTOR.CHINA_NAME,',','��')
when 'ZY0810' then  replace(SECTOR.CHINA_NAME,',','��') end as "����������", 
'' as  "����BSID_1X",
'' as "����BSID_DO",
  round(SECTOR.LONGITUDE,6) as "����", round(SECTOR.LATITUDE,6) as "γ��", SECTOR.PN as "PN", DECODE(SECTOR.SITE_TYPE,'1','��׼С��','2','΢����','3','RRU',SECTOR.SITE_TYPE) as "��������", DECODE(SECTOR.ISINDOOR,0,'��',1,'��') as "�Ƿ�����", DECODE(SECTOR.SITE_TYPE,'3','��','��') as "�Ƿ�RRU����", '' as "�Ƿ�Ϊ��RRU��PN����", SECTOR.ISCELLSPLIT as "�Ƿ񹦷�����", 
'' as  "�����ȼ�",
'' as "���������������(Erl)",
'' as "1X���������������(Erl)",
  SECTOR.WIRE_LOAD_P as "�����������", 
CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.MSCNAME
when 'ZY0810' then CITY.ENNAME||'.'||MSC.MSCNAME
when 'ZY0804' then CITY.ENNAME||'.'||MSC.MSCNAME end as "MSC��ʶ", '' as "MGW��ʶ", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME
when 'ZY0810' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME
when 'ZY0804' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME end as "BSC��ʶ", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID
when 'ZY0810' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID
when 'ZY0804' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID end as "BTS��ʶ", SECTOR.LAC as "LAC",
'' as "Totzones",
'' as "Zone_tmr",
'' as "��ͨ����",
'' as "����״̬",  
 SECTOR.PROJECT_STATE as "����״̬", SECTOR.LONGITUDE as "���߾���", SECTOR.LATITUDE as "����γ��", SECTOR.ANT_FRAME_HIGH as "���ߺ��θ߶�", 
'' as "ɽ�߻�¥��(��)",
'' as "���߹Ҹ�(��)",
 SECTOR.ANT_HIGH as "�����ܹҸ�", SECTOR.ANT_AZIMUTH as "���߷����", SECTOR.ANT_ANGLE as "���߸�����",
 '' AS "Ԥ�õ�����ǣ��ȣ�",
'' AS "�ɵ�������ǣ��ȣ�",
 SECTOR.ANT_ELECTRON_ANGLE as "���������", SECTOR.ANT_ENGINE_ANGLE as "��е���", SECTOR.ISELECADJUST as "�����Ƿ���Ե��",
 '' AS "���߷�������",
'' AS "�����ͺ�",
'' AS "�������쳧��",
  SECTOR.ANT_NUM as "��������",
  '' AS "���߷ּ���ʽ",
'' AS "���߼�����ʽ",
'' AS "���߹���(dBm)",
'' AS "��������(dBi)",
'' AS "���߼��跽ʽ",
'' AS "����ƽ̨",
   SECTOR.HORIZONTAL as "����ˮƽ3db������", SECTOR.VERTICAL as "���ߴ�ֱ3db������", SECTOR.ISCELLSPLIT as "�Ƿ���������",
   '' AS "�������÷�ʽ",
'' AS "��������",
'' AS "���߳���",
'' AS "��վ�ͺ�",
'' AS "��վ������",
 case BSC.vendor when 'ZY0808' THEN '��Ϊ' when 'ZY0810' THEN '����' when 'ZY0804' THEN '����' end  as "��������", case BSC.vendor
when 'ZY0808' then 'BSC6680'
when 'ZY0804' then 'V8'
when 'ZY0810' then 'R32' end as "����汾", DECODE(SECTOR.ISDO,0,SECTOR.CARRIER_NUM,1,NULL) as "1X��������", 
  '' AS "1X�ŵ�����������",
DECODE(BTS.ISDO,0,BTS.TCH_COUNT,1,NULL) as "1X�ŵ�������", '' as "1X�ŵ�������", DECODE(BTS.ISDO,0,BTS.SITE_MODEL,1,NULL) as "1Xվ������", BTS.SITE_TYPE as "ϵͳ����", DECODE(SECTOR.ISDO,0,'��',1,'��') as "�Ƿ�DO����", DECODE(SECTOR.ISDO,1,SECTOR.CARRIER_NUM,0,NULL) as "DO��������", 
'' AS "DO�ŵ�����������",
DECODE(BTS.ISDO,1,BTS.TCH_COUNT,0,NULL) as "DO�ŵ�����������", '' as "DO�ŵ�������", DECODE(BTS.ISDO,1,BTS.SITE_MODEL,0,NULL) as "DOվ������", 
'' AS "�Ƿ��Ƶ����",
SECTOR.BORDERSECTOR as "�Ƿ���ز��߽�", case  sector.border_type1 when '�Ǳ߽�' then 0 when 'ʡ�ʱ߽�' then 1 when 'ʡ�ڱ߽�' then 2 when 'ͬΪʡ��ʡ�ڱ߽�' then 3 end as "�߽���������",
'' AS "�߽���������������",
'' AS "�����ζԶ˵���",
 sector.nbr_province_name as "����ʡ������", sector.nbr_city_name as "������������",
 '' AS "����ֱ��վ����",
'' AS "���߽��ߵľ���",
'' AS "�����ֲ�ϵͳ����",
 DECODE(SECTOR.FAKEPILOT,NULL,'��','��') as "�Ƿ�ʹ��α��Ƶ", SECTOR.FAKEPILOT as "α��ƵƵ��",
'' AS  "37��Ƶ����",
'' AS "283��Ƶ����",
'' AS "78��Ƶ����",
'' AS "119��Ƶ����",
'' AS "160��Ƶ����",
'' AS "201��Ƶ����",
'' AS "242��Ƶ����",
 SECTOR.ISTOWER as "�Ƿ�װ�����Ŵ���", SECTOR.ISAMPLIFIER as "�Ƿ�װ��վ�Ŵ���", '' as "��������", '' as "��������", '' as "��������1", '' as "��������2", '' as "��������3", '' as "��������", BTS.ARCHITECTURE as "��������", 
'' AS "������������",
'' AS "��������¥��",
'' AS "����Ӫҵ������",
'' AS "������ַ",
'' AS "��Ԫ������",
'' AS "��Ԫ��������ϵ�ֻ�����",
'' AS "��Ԫ����������",
BTS.ADDRESS as "��ַ",
'' AS "����������ʱ��",
 '' as "��ע", '' as "Ԥ��1", '' as "Ԥ��2", '' as "Ԥ��3", '' as "Ԥ��4", '' as "Ԥ��5"
  from (select tai.border_type border_type1,tai.nbr_province_name,tai.nbr_city_name,ne.*
          from ne_cell_c ne,
               ne_taizhang_cell tai
         where ne.city_id = tai.city_id(+)
           and ne.bsc_id = tai.bsc_id(+)
           and ne.Bts_Id = tai.bts_id(+)
           and ne.sector_id = tai.sector_id(+)) sector,
       ne_bts_c         bts,
       ne_bsc_c         bsc,
       cfg_bsc_map_city msc,
       cfg_city         city,
       cfg_county       adm
 where sector.related_bts = bts.ne_sys_id
   and BTS.RELATED_BSC = BSC.NE_SYS_ID
   and BSC.NE_SYS_ID = MSC.NE_BSC_ID
   and sector.city_id = city.city_id
   and sector.city_id = bts.city_id
   and sector.city_id = bsc.city_id
   and sector.city_id = msc.city_id
   and adm.COUNTY_ID(+) = sector.ADM_AREA
 order by city.city_id, bsc.ne_sys_id, bts.bts_id, sector.sector_id
