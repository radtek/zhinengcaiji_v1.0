START_TIME,CHINA_NAME,SECTOR_ID,BTS_NAME,BTS,BSC_NAME,BSC,CITY_NAME,CITY_ID,VENDOR_NAME,LONGITUDE,LATITUDE,COUNTY_NAME,LOCAL_CELL_ID,SID,NID,LAC,PN
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>