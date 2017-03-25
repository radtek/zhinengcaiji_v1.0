版本号,省份,地市,时间,BS查找总次数,BS查找成功次数,BS查找成功率,PN查找总次数,PN查找成功次数,PN查找失败次数,PN查找成功率,I_001错误次数,I_028错误次数,I_029错误次数
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>