<#assign split=","/>
<#assign n = 0 />
<#list o.datas.d1[0..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#assign n = n+1 /><#if n gt 1><#break></#if><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d><#if (d=25)>${onearray[d]?date("yyyy-MM-dd")}<#else>${onearray[d]}</#if><#if d != len>,</#if></#list>
</#if></#list>
</#if>