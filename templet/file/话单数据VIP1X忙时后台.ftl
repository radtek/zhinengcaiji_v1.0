               <#assign longitude_lb=0>
		       <#assign latitude_lb=0>
		       <#assign longitude_rb=0>
		       <#assign latitude_rb=0>
<#list o.datas.d1[1..] as onearray><#if onearray??>
               <#assign longitude_lb=onearray[o.indexs.d1.LONGITUDE_LB]>
		       <#assign latitude_lb=onearray[o.indexs.d1.LATITUDE_LB]>
		       <#assign longitude_rb=onearray[o.indexs.d1.LONGITUDE_RB]>
		       <#assign latitude_rb=onearray[o.indexs.d1.LATITUDE_RB]>
		       <#assign grid=grid(longitude_lb, latitude_lb, longitude_rb ,latitude_rb)>
(${onearray[o.indexs.d1.LONGITUDE_LB]}|${onearray[o.indexs.d1.LATITUDE_RB]}),(0|0),(${grid}),(${onearray[o.indexs.d1.CURR_DATA_TIME]})</#if></#list>,,,,,
列,行,语音呼叫次数,数据呼叫次数,短信呼叫次数,语音呼叫掉话次数,数据呼叫掉话次数,短信呼叫掉话次数,呼叫EC/IO平均数
<#assign datas=o.datas.d2[1..]/>
<#assign indexs=o.indexs.d2[1..]/>
<#if datas??>
    <#if (datas?size>0)>
<@cdl datas=o.datas.d2 indexs=o.indexs.d2  longitude_lb=longitude_lb  latitude_lb=latitude_lb longitude_rb=longitude_rb latitude_rb=latitude_rb  sep=",">

</@cdl>
    </#if>
</#if>