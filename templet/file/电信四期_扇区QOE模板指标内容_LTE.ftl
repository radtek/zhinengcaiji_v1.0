版本号,时间戳,省份,模板名称,指标维度,指标名称,指标编号,指标定义,指标时间粒度,指标得分规则,指标得分权重
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>