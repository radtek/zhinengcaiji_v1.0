<#assign split=","/>
<#if o.datas["d1"]?size gt 0> 
<#list o.datas.d1[0..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>