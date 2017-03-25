版本号,时间戳,省份,模板名称,网络类型,系统类型,综合得分规则,覆盖类得分规则,覆盖类得分权重,接入类得分规则,接入类得分权重,保持类得分规则,保持类得分权重,业务完整性得分规则,业务完整性得分权重,网络可用性得分规则,网络可用性得分权重
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>