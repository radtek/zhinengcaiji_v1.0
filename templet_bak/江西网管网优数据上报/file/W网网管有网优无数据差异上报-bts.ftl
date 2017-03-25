OMCID,COLLECTTIME,STAMPTIME,NODEB_NAME,NODEB_ID,NODEB_STATES,RELATED_RNC,RELATED_OMC,CITY_NAME,VENDER,VERSION,NE_DN
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>