SUM_DATE	QXID	QXNAME	CORP	CORPNAME	HWL	WIRELESS_CAPACITY	DO_TCH_AVG_SLOT_OCCUPY_RATE
<#assign split="	"/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>	</#if></#list>
</#if></#list>
</#if>