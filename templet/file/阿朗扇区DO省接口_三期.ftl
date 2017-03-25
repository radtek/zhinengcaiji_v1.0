,,,,,,,,,,MP4.4.2.1.1,MP4.4.2.1.2,MP4.4.2.1.3,MP4.4.2.3.1,MP4.4.2.3.2,MP4.4.2.3.3,MP4.4.2.3.4,MP4.4.2.4.1,MP4.4.2.5.1,MP4.4.2.5.2,MP4.4.2.5.3,MP4.4.2.5.4,MP4.4.2.5.5,MP4.4.2.5.6,MP4.4.2.5.7,MP4.4.2.20.1
时间戳,扇区标识,省份,城市,扇区所属MSC标识,扇区所属MGW标识,扇区所属BSC标识,扇区所属BTS标识,扇区编号,扇区名称,dormancytimer,ccsyncapsuleoffset,controlchannelrate,probenumsetup,preamblelength,probebackoff,capsulelengthmax,openloopadjust,pilotcompare,pilotdrop,pilotdroptimer,SOFT_SLOPE,ADD_INTERCEPT,DROP_INTERCEPT,searchwindowactive,raboffset
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>