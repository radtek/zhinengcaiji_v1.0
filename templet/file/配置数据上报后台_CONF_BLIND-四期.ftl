<#assign split=","/>
<#if o.datas["d1"]?size gt 0> 
<#list o.datas.d1[0..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d><#if (d=25 || d=28 || d=29 || d=36 || d=37)>${onearray[d]?date("yyyy-MM-dd")}<#else>${onearray[d]}</#if><#if d != len>,</#if></#list>
</#if></#list>
</#if>