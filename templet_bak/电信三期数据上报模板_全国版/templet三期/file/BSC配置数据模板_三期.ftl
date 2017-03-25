时间戳,BSC标识,外部网元标识,省份,城市列表,MSC标识,MGW标识,厂家名称,软件版本,设备名称,设备中文名称,规格型号,无线容量,设计无线容量,基站容量,扇区容量,设计的BHCA值,基站数量,1X基站数量,DO基站数量,扇区数量,PCF数量,机房位置,机房名称,经度,纬度,备注,预留字段1,预留字段2,预留字段3,预留字段4,预留字段5
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>