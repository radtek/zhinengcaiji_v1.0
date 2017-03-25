,,,,,,,MP4.3.1.2.1,MP4.3.1.2.2,MP4.3.1.2.3,MP4.3.1.2.4,MP4.3.1.2.5
时间戳,基站标识,省份,城市,MSC标识,MGW标识,BSC标识,注册区定时器,Zone_List 中保留的注册区数量,非漫游注册指示,外部网络用户允许标志位,开机注册指示
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>