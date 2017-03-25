版本号,时间戳,省份,地市,容量瓶颈预警数量,网元级别,系统类型,预警级别,厂商,网元编号,网元中文名称
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>