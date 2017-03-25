BSC_ID||BTS_ID||MSC_ID||NID||LAC||局方命名||城市名称||行政区||营销中心||基站地址||经度||纬度||区域类型
<#assign split="||"/>
<#if o.datas["d1"]?size gt 1>  
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>||</#if></#list>
</#if></#list>
 </#if>   