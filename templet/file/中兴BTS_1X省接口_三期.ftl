,,,,,,,MP2.3.1.7.1,MP2.3.1.7.2
时间戳,基站标识,省份,城市,MSC标识,MGW标识,BSC标识,系统允许的前向最小调度时长,系统允许的前向最大调度时长
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>