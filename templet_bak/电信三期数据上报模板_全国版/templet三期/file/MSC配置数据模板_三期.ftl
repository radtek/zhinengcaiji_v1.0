时间戳,MSC标识,外部网元标识,省份名称,城市列表,厂家名称,软件版本,硬件版本,设备名称,设备中文名称,规格型号,机房位置,MSCID,SID,NID,IP地址,信令点编码,配置信令链路数,配置中继数,目前管辖BSC数,备注,预留字段1,预留字段2,预留字段3,预留字段4,预留字段5
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>