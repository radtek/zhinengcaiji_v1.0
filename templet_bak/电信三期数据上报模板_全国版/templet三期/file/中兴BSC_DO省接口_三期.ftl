,,,,,,MP2.2.2.1.1,MP2.2.2.1.2,MP2.2.2.1.3,MP2.2.2.1.4,MP2.2.2.1.5,MP2.2.2.1.6,MP2.2.2.1.7,MP2.2.2.1.8,MP2.2.2.1.9,MP2.2.2.3.1,MP2.2.2.3.2,MP2.2.2.3.3,MP2.2.2.3.4,MP2.2.2.3.5,MP2.2.2.3.6,MP2.2.2.5.1
时间戳,基站标识,省份,城市,MSC标识,MGW标识,PROBESEQUENCEMAX,DRCLOCKPERIOD,DRCLOCKLENGTH,MUPacketsEnabled,DSCLength,SPEnabledThresh,DRCSupervisionTimer,DSCChannelGainBoost,DRCChannelGainBoost,PROBEBACKOFF,PROBESEQBACKOFF,ACCDATAOFFSETNOM,ACCDATAOFFSET9K6,APersistenceOR,ATAccessRateMax,SOFTHODELAY
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>