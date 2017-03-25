select '%%Y-%%M-%%D' as "时间戳", case BSC.vendor
when 'ZY0808' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
when 'ZY0804' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
when 'ZY0810' then   BSC.CHINA_NAME||'.'||BTS.BTS_ID
else 'ASS'    end as "基站标识", '' as "外部网元标识", bts.bts_id as "站号", '' as 工程站号, bts.equip_name as "基站设备名称", replace(bts.china_name,',','.') as "基站中文名", '' as "基站拼音", '' as "基站别名", '${province_cn}' as "省份", CITY.CITY_NAME as "城市", replace(ADM.COUNTY_NAME,'区','')  as "行政归属", '' as "地理归属", MSC.MSCNAME as "MSC标识", '' as "MGW标识", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
when 'ZY0810' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
when 'ZY0804' then CITY.ENNAME || '.' ||  MSC.MSCNAME || '.' || MSC.BSCNAME
else 'MSC标识' end as "BSC标识", case BSC.vendor when 'ZY0808' THEN '华为' when 'ZY0810' THEN '阿朗' when 'ZY0804' THEN '中兴' end  as "厂家名称", case BSC.vendor
when 'ZY0808' then  'BSC6680'
when 'ZY0804' then  'V8'
when 'ZY0810' then  'R32'
else 'softVersion'    end as "软件版本", BTS.EQUIP_MODEL as "设备型号", '' as "基站等级", BTS.LAC as "LAC", '' as "REG_ZONE", '' as "BSID", '' as "NID", CITY.SID as "SID", '' as "扇区数量", '' as "1X载扇数量", '' as "DO载扇数量", '' as "1X CE数量", '' as "DO CE数量", '' as "分配ABIS口E1电路数量", 1 as "基站类型", case when (carr.bus_1x+carr.bus_do)= 2 then 1 else case when carr.bus_1x = 1 then 0 else 2 end  end  as "系统类型", '' as "延伸覆盖类型", '' as "天线方向类型", '' as "1X站型配置", '' as "DO站型配置", 1 as "工程状态", '' as "运行状态", '' as "运行状态判断时间", '' as "基站开通日期", '' as "设计院", '' as "设计期别", '' as "代维单位", '' as "维护人", '' as "维护人电话", '' as "营销区域", '' as "覆盖区域描述", '' as "共站情况", substr(replace(BTS.ADDRESS,',','.'),0,30) as "站址", '' as "带室外直放站数量", 
  round(BTS.LONGITUDE,6)  as "经度", round(BTS.LATITUDE,6)     as "纬度", case  BTS.border_type when '非边界' then 0 when '省际边界' then 1 when '省内边界' then 2 when '同为省际省内边界' then 3 end as "边界基站类型", '' as "塔桅类型", '' as "机柜类型", BTS.WIRE_LOAD       as "无线容量", BTS.WIRE_LOAD_P     as "设计无线容量", '' as "最大发射功率", '' as "环境类型", BTS.ARCHITECTURE     as "建筑类型", '' as "电源", BTS.TRANSFERS       as "传输方式", '' as "传输设备", BTS.ISRELATED       as "是否级联", '' as "是否室内", '' as "厂商侧BSC编号", '' as "厂商侧SITE编号", '' as "备注", '' as "预留字段1", '' as "预留字段2", '' as "预留字段3", '' as "预留字段4", '' as "预留字段5"

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
