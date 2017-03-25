基站名称,城市名称,小区名,LAC,CI,基站类型,RNC名称,设备厂家,行政区,MSC名称,MSCSERVER名称,GGSN名称,所属SGSN标识,RRU数量,网元类型,经度,纬度,天线高度,海拔高度,天线方向角,电子倾角,机械倾角,下倾角,天线共用情况,馈线共用情况,馈线型号,是否为RRU小区,小区配置的载频发射功率,扇区配置的无线容量,天线类型,天线厂家,是否可以电调,设备类型,站点配置,逻辑小区的级别,工程期别,工程进展,网管运行状态,小区标识,所属城市标识,所属MSC标识,所属RNC标识,所属NODEB标识,是否城区,是否采集MR,所属MGW标识,共站名称,共站属性,与移动网管平台对应的ENDN编码
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>