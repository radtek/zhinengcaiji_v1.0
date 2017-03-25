<#assign split=","/>
<#assign n = 0 />
<#list o.datas.d1[0..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#assign n = n+1 /><#if n gt 1><#break></#if><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d><#if (d=0 || d=1)>${onearray[d]?string("yyyy-MM-dd HH:mm")}<#else>${onearray[d]}</#if><#if d != len>,</#if></#list>
</#if></#list></#if>
<#assign lastUpdated_end = "2014-05-01 04:03:05">
ADD,BSAEND,${lastUpdated_end?string("yyyy-MM-dd HH:mm:ss")}