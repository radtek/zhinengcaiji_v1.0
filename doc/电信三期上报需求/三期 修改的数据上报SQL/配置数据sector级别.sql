select '%%Y-%%M-%%D' as "时间戳", case BSC.vendor
when 'ZY0808' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID
when 'ZY0804' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID
when 'ZY0810' then  BSC.CHINA_NAME||'.'||BTS.BTS_ID||'.'||SECTOR.SECTOR_ID  end as "扇区标识", '' as "外部网元标识", '${province_cn}' as "省份", CITY.CITY_NAME as "城市", replace(ADM.COUNTY_NAME,'区','')  as "行政区",'' as "乡镇", '' as "地理归属",
'' as  "OMCOID",
bsc.china_name as "所属RNC标识",
'' as "所属SM标识",
bts.china_name as "基站中文名",
 case BSC.vendor
when 'ZY0808' then BTS.BTS_ID
when 'ZY0804' then BTS.BTS_ID
when 'ZY0810' then BTS.BTS_ID end as "厂商侧基站标识", case BSC.vendor
when 'ZY0808' then  SECTOR.SECTOR_ID
when 'ZY0804' then  BTS.BTS_ID
when 'ZY0810' then  SECTOR.SECTOR_ID end as "厂商侧扇区标识", case BSC.vendor
when 'ZY0808' then  SECTOR.SECTOR_ID
when 'ZY0804' then  SECTOR.SECTOR_ID
when 'ZY0810' then  SECTOR.SECTOR_ID end as "厂商侧sector编号", case BSC.vendor
when 'ZY0808' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','')
when 'ZY0804' then  to_char(SECTOR.CI)
when 'ZY0810' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','') end as "扇区标识_1X", case BSC.vendor
when 'ZY0808' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','')
when 'ZY0804' then  to_char(SECTOR.CI)
when 'ZY0810' then  replace('0x'||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,'XXXXXXXX'),' ','') end as "扇区标识_DO", case BSC.vendor
when 'ZY0808' then  replace(SECTOR.CHINA_NAME,',','，')
when 'ZY0804' then  replace(SECTOR.CHINA_NAME,',','，')
when 'ZY0810' then  replace(SECTOR.CHINA_NAME,',','，') end as "扇区中文名", 
'' as  "扇区BSID_1X",
'' as "扇区BSID_DO",
  round(SECTOR.LONGITUDE,6) as "经度", round(SECTOR.LATITUDE,6) as "纬度", SECTOR.PN as "PN", DECODE(SECTOR.SITE_TYPE,'1','标准小区','2','微蜂窝','3','RRU',SECTOR.SITE_TYPE) as "扇区类型", DECODE(SECTOR.ISINDOOR,0,'否',1,'是') as "是否室内", DECODE(SECTOR.SITE_TYPE,'3','是','否') as "是否RRU扇区", '' as "是否为多RRU共PN扇区", SECTOR.ISCELLSPLIT as "是否功分扇区", 
'' as  "扇区等级",
'' as "语音设计无线容量(Erl)",
'' as "1X数据设计无线容量(Erl)",
  SECTOR.WIRE_LOAD_P as "设计无线容量", 
CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.MSCNAME
when 'ZY0810' then CITY.ENNAME||'.'||MSC.MSCNAME
when 'ZY0804' then CITY.ENNAME||'.'||MSC.MSCNAME end as "MSC标识", '' as "MGW标识", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME
when 'ZY0810' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME
when 'ZY0804' then CITY.ENNAME||'.'||MSC.MSCNAME||'.'||MSC.BSCNAME end as "BSC标识", CASE BSC.vendor
when 'ZY0808' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID
when 'ZY0810' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID
when 'ZY0804' then CITY.ENNAME||'.'||MSC.BSCNAME||'.'||BTS.BTS_ID end as "BTS标识", SECTOR.LAC as "LAC",
'' as "Totzones",
'' as "Zone_tmr",
'' as "开通日期",
'' as "运行状态",  
 SECTOR.PROJECT_STATE as "工程状态", SECTOR.LONGITUDE as "天线经度", SECTOR.LATITUDE as "天线纬度", SECTOR.ANT_FRAME_HIGH as "天线海拔高度", 
'' as "山高或楼高(米)",
'' as "天线挂高(米)",
 SECTOR.ANT_HIGH as "天线总挂高", SECTOR.ANT_AZIMUTH as "天线方向角", SECTOR.ANT_ANGLE as "天线俯仰角",
 '' AS "预置电下倾角（度）",
'' AS "可调电下倾角（度）",
 SECTOR.ANT_ELECTRON_ANGLE as "电子下倾角", SECTOR.ANT_ENGINE_ANGLE as "机械倾角", SECTOR.ISELECADJUST as "天线是否可以电调",
 '' AS "天线方向类型",
'' AS "天线型号",
'' AS "天线制造厂商",
  SECTOR.ANT_NUM as "天线数量",
  '' AS "天线分集方式",
'' AS "天线极化方式",
'' AS "天线功率(dBm)",
'' AS "天线增益(dBi)",
'' AS "天线架设方式",
'' AS "天线平台",
   SECTOR.HORIZONTAL as "天线水平3db波瓣宽度", SECTOR.VERTICAL as "天线垂直3db波瓣宽度", SECTOR.ISCELLSPLIT as "是否扇区分裂",
   '' AS "天馈共用方式",
'' AS "馈线类型",
'' AS "馈线长度",
'' AS "基站型号",
'' AS "基站扇区数",
 case BSC.vendor when 'ZY0808' THEN '华为' when 'ZY0810' THEN '阿朗' when 'ZY0804' THEN '中兴' end  as "所属厂家", case BSC.vendor
when 'ZY0808' then 'BSC6680'
when 'ZY0804' then 'V8'
when 'ZY0810' then 'R32' end as "软件版本", DECODE(SECTOR.ISDO,0,SECTOR.CARRIER_NUM,1,NULL) as "1X载扇数量", 
  '' AS "1X信道板配置类型",
DECODE(BTS.ISDO,0,BTS.TCH_COUNT,1,NULL) as "1X信道板数量", '' as "1X信道配置数", DECODE(BTS.ISDO,0,BTS.SITE_MODEL,1,NULL) as "1X站型配置", BTS.SITE_TYPE as "系统类型", DECODE(SECTOR.ISDO,0,'否',1,'是') as "是否DO扇区", DECODE(SECTOR.ISDO,1,SECTOR.CARRIER_NUM,0,NULL) as "DO载扇数量", 
'' AS "DO信道板配置类型",
DECODE(BTS.ISDO,1,BTS.TCH_COUNT,0,NULL) as "DO信道板配置数量", '' as "DO信道配置数", DECODE(BTS.ISDO,1,BTS.SITE_MODEL,0,NULL) as "DO站型配置", 
'' AS "是否分频待机",
SECTOR.BORDERSECTOR as "是否多载波边界", case  sector.border_type1 when '非边界' then 0 when '省际边界' then 1 when '省内边界' then 2 when '同为省际省内边界' then 3 end as "边界扇区类型",
'' AS "边界免漫游扇区类型",
'' AS "免漫游对端地市",
 sector.nbr_province_name as "接壤省份名称", sector.nbr_city_name as "接壤城市名称",
 '' AS "所带直放站数量",
'' AS "到边界线的距离",
'' AS "所带分布系统数量",
 DECODE(SECTOR.FAKEPILOT,NULL,'否','是') as "是否使用伪导频", SECTOR.FAKEPILOT as "伪导频频点",
'' AS  "37载频配置",
'' AS "283载频配置",
'' AS "78载频配置",
'' AS "119载频配置",
'' AS "160载频配置",
'' AS "201载频配置",
'' AS "242载频配置",
 SECTOR.ISTOWER as "是否安装塔顶放大器", SECTOR.ISAMPLIFIER as "是否安装基站放大器", '' as "环境类型", '' as "环境描述", '' as "场景类型1", '' as "场景类型2", '' as "场景类型3", '' as "场景描述", BTS.ARCHITECTURE as "建筑类型", 
'' AS "所属机房名称",
'' AS "机房所在楼层",
'' AS "所属营业部名称",
'' AS "扇区地址",
'' AS "网元负责人",
'' AS "网元负责人联系手机号码",
'' AS "网元负责人邮箱",
BTS.ADDRESS as "地址",
'' AS "数据最后更新时间",
 '' as "备注", '' as "预留1", '' as "预留2", '' as "预留3", '' as "预留4", '' as "预留5"
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
