<#assign lastUpdated = .now> 
ADD,BSA, ${lastUpdated?string("yyyy-MM-dd HH:mm:ss")} , <#if o.datas["d1"]?size gt 1> <#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list></#if></#list></#if>
Pilot_Sector_Name,SID,NID,Extend_BID,T-PN,Antenna_Lati,Antenna_Longi,Antenna_Alti,Antenna_Loc_Accu,Sector_Center_Lati,Sector_Center_Longi,Sector_Center_Alti,Antenna_Orientation,Antenna_Opening,Max_Antenna_Range,Terrain_Average_Height,Terrain_Height_Standard_Deviation,Potential_Repeater,PN_Increment,FWD_Calib,FWD_Calib_Accu,RTD_Calib,RTD_Calib_Accu,Format_Type,Switch_Num
<#assign split=","/>
<#if o.datas["d2"]?size gt 1> 
<#list o.datas.d2[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>
<#assign lastUpdated_end = .now> 
ADD,BSAEND, ${lastUpdated_end?string("yyyy-MM-dd HH:mm:ss")} 