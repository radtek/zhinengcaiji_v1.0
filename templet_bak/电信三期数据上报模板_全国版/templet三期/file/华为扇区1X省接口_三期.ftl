,,,,,,,,,,MP1.4.1.6.1
时间戳,扇区标识,省份,城市,扇区所属MSC标识,扇区所属MGW标识,扇区所属BSC标识,扇区所属BTS标识,扇区编号,扇区名称,寻呼信道速率
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>