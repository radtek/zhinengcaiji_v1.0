select '%%Y-%%M-%%D' as "ʱ���", case BSC.vendor
when 'ZY0808' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
when 'ZY0804' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
when 'ZY0810' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
else 'ASS'    end as "��վ��ʶ", '' as "�ⲿ��Ԫ��ʶ", bts.bts_id as "վ��", '' as ����վ��, bts.equip_name as "��վ�豸����", replace(bts.china_name,',','.') as "��վ������", '' as "��վƴ��", '' as "��վ����", '${province_cn}' as "ʡ��", CITY.CITY_NAME as "����", replace(ADM.COUNTY_NAME,'��','')  as "��������", '' as "�������", MSC.MSCNAME as "MSC��ʶ", '' as "MGW��ʶ", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
when 'ZY0810' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
when 'ZY0804' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
else 'MSC��ʶ' end as "BSC��ʶ", case BSC.vendor when 'ZY0808' THEN '��Ϊ' when 'ZY0810' THEN '����' when 'ZY0804' THEN '����' end  as "��������", case BSC.vendor
when 'ZY0808' then  'BSC6680'
when 'ZY0804' then  'V8'
when 'ZY0810' then  'R32'
else 'softVersion'    end as "����汾", BTS.EQUIP_MODEL as "�豸�ͺ�", '' as "��վ�ȼ�", BTS.LAC as "LAC", '' as "REG_ZONE", '' as "BSID", '' as "NID", CITY.SID as "SID", '' as "��������", '' as "1X��������", '' as "DO��������", '' as "1X CE����", '' as "DO CE����", '' as "����ABIS��E1��·����", 1 as "��վ����", case when (carr.bus_1x+carr.bus_do)= 2 then 1 else case when carr.bus_1x = 1 then 0 else 2 end  end  as "ϵͳ����", '' as "���츲������", '' as "���߷�������", '' as "1Xվ������", '' as "DOվ������", 1 as "����״̬", '' as "����״̬", '' as "����״̬�ж�ʱ��", '' as "��վ��ͨ����", '' as "���Ժ", '' as "����ڱ�", '' as "��ά��λ", '' as "ά����", '' as "ά���˵绰", '' as "Ӫ������", '' as "������������", '' as "��վ���", substr(replace(BTS.ADDRESS,',','.'),0,30) as "վַ", '' as "������ֱ��վ����", 
  round(BTS.LONGITUDE,6)  as "����", round(BTS.LATITUDE,6)     as "γ��", case  BTS.border_type when '�Ǳ߽�' then 0 when 'ʡ�ʱ߽�' then 1 when 'ʡ�ڱ߽�' then 2 when 'ͬΪʡ��ʡ�ڱ߽�' then 3 end as "�߽��վ����", '' as "��Φ����", '' as "��������", BTS.WIRE_LOAD       as "��������", BTS.WIRE_LOAD_P     as "�����������", '' as "����书��", '' as "��������", BTS.ARCHITECTURE     as "��������", '' as "��Դ", BTS.TRANSFERS       as "���䷽ʽ", '' as "�����豸", BTS.ISRELATED       as "�Ƿ���", '' as "�Ƿ�����", '' as "���̲�BSC���", '' as "���̲�SITE���", '' as "��ע", '' as "Ԥ���ֶ�1", '' as "Ԥ���ֶ�2", '' as "Ԥ���ֶ�3", '' as "Ԥ���ֶ�4", '' as "Ԥ���ֶ�5"

FROM (select BTS.*,tai.border_type from NE_BTS_C BTS,
  (  select carr.related_bts,t.border_type from ne_carrier_c carr,ne_taizhang_bts t
where t.bts_id=carr.bts_id
and t.bsc_id=carr.bsc_id
and t.city_id=carr.city_id )tai 
where tai.related_bts(+)=bts.ne_sys_id) BTS,
       NE_BSC_C BSC,
       CFG_BSC_MAP_CITY MSC,
       CFG_CITY CITY,
       CFG_COUNTY ADM,
       (select related_bts, sum(BUS_1X) as BUS_1X, sum(BUS_DO) as BUS_DO
          from (select related_bts, 1 BUS_1X, 0 BUS_DO
                  from ne_carrier_c carrier
                 where BUSTYPE = '1X'
                    or bustype = '0'
                    or bustype is null
                 group by related_bts
                UNION ALL
                select related_bts, 0 BUS_1X, 1 BUS_DO
                  from ne_carrier_c carrier
                 where BUSTYPE = 'DO'
                    or bustype = '0'
                    or bustype is null
                 group by related_bts)
         group by related_bts) carr
 WHERE longitude is not null
   and latitude is not null
   and longitude > 74
   and latitude > 3
   and longitude < 135
   and latitude < 53
   AND BTS.RELATED_BSC = BSC.NE_SYS_ID
   and BSC.NE_SYS_ID = MSC.NE_BSC_ID
   AND BTS.CITY_ID = CITY.CITY_ID
   AND BTS.CITY_ID = BSC.CITY_ID
   AND BTS.CITY_ID = MSC.CITY_ID
   and bts.ne_sys_id = carr.related_bts
   AND ADM.COUNTY_ID(+) = BTS.ADM_AREA
 order by city.city_id, bsc.ne_sys_id, bts.bts_id
