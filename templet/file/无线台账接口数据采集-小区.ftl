BSC_ID||BTS_ID||MSC_ID||CELL_ID||CI||SECTOR_ID||基站名称||城市名称||行政区||营销中心||扇区附加地址||经度||纬度||区域类型||NID||LAC
<#assign split="||"/>
<#if o.datas["d1"]?size gt 1>   
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>||</#if></#list>
</#if></#list>
 </#if>   
