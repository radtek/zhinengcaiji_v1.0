省份,所属城市标识,所属OMC标识,厂商标识,所属MSCServer标识,MGW标识,所属SGSN标识,RNC标识,RNC编号,RNC名称,版本标识,Iu接口ATM层配置带宽,Iu接口IP层配置带宽,Iur接口ATM层配置带宽,Iur接口IP层配置带宽,载频数目,NodeB数量,单载频NodeB数量,双单载频NodeB数量,三单载频NodeB数量,BBU数量,单载扇区数量,双载扇区数量,三载扇区数量,直放站数量,小区数量,宏小区数量,微小区数量,RNC唯一标识DN,固定资产编号,RNC当前状态
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>