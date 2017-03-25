省份,所属城市标识,所属城市区域,所属行政区域类型,所属MSC标识,所属MGW标识,所属SGSN标识,所属RNC标识,基站的编号,所属NodeB标识,所属SECTORID,小区标识,小区名称,小区标识码,厂商标识,是否采集MR ,经度,纬度,天线方向角,天线挂高,电子下倾角,机械倾角,小区的级别, 是否为RRU小区,上行频点,下行频点,主扰码号,主导频信道功率,小区配置的载频发射功率,位置区编码,路由区编码,服务区编码,配置的无线容量,HSDPA功能标识,HSDPA功能状态,HS-PDSCH所使用的SF=16的码,HS-SCCH所使用的SF=128的码,HSUPA功能标识,HSUPA功能状态,E-AGCH信道数目,E-RGCH/E-HICH信道数目,运行状态,小区覆盖类型
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>