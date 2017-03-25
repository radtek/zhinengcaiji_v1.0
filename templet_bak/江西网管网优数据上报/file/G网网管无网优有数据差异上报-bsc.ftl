省份,BSC标识,BSC中文名称,BSC当前状态,所属城市标识,所属MSC标识,所属OMC标识,厂商标识,版本标识,配置无线容量,基站配置数量,小区配置数量,微蜂窝个数,直放站数量,载频数量,单载频小区数量,双载频小区数量,三载频小区数量,四载频及以上小区数量,开通载频数,TCH配置数,SDCCH配置数,BSC唯一标识DN,固定资产编号
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>