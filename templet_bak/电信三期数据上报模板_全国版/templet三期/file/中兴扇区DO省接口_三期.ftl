,,,,,,,,,,MP2.4.2.5.1,MP2.4.2.5.2,MP2.4.2.5.3,MP2.4.2.5.4,MP2.4.2.5.5,MP2.4.2.5.6,MP2.4.2.5.7,MP2.4.2.5.8,MP2.4.2.5.9,MP2.4.2.5.10
时间戳,扇区标识,省份,城市,扇区所属MSC标识,扇区所属MGW标识,扇区所属BSC标识,扇区所属BTS标识,扇区编号,扇区名称,SEARCHWINDOWACTIVE,SEARCHWINDOWNB,SEARCHWINDOWREM,PILOTADD1,PILOTCOMPARE1,PILOTDROP1,PILOTDROPTIMER1,SOFTSLOPE1,ADDINTERCEPT1,DROPINTERCEPT1
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>