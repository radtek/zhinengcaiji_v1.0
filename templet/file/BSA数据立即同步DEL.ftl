<#assign lastUpdated = .now>
DEL,BSA,${lastUpdated?string("yyyy/MM/dd HH:mm")},<#if o.datas["d1"]?size gt 1><#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list></#if></#list></#if>
Pilot Sector Name,SID,NID,Extend BID,T-PN,Antenna Lati,Antenna Longi,Antenna Alti,Antenna Loc Accu,Sector Center Lati,Sector Center Longi,Sector Center Alti,Antenna Orientation,Antenna Opening,Max Antenna Range,Terrain Average Height,Terrain Height Standard Deviation,Potential Repeater,PN Increment,FWD Calib,FWD Calib Accu,RTD Calib,RTD Calib Accu,Format Type,Switch Num
<#assign split=","/>
<#if o.datas["d2"]?size gt 1>
<#list o.datas.d2[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>
<#assign lastUpdated_end = .now>
DEL,BSAEND,${lastUpdated_end?string("yyyy/MM/dd HH:mm")}