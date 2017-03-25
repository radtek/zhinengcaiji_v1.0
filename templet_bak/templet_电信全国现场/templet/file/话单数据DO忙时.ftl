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
(${onearray[o.indexs.d1.LONGITUDE_LB]}|${onearray[o.indexs.d1.LATITUDE_LB]}),(0|0),(${grid}),${onearray[o.indexs.d1.CURR_DATA_TIME]		}	
</#if></#list>
列,行,数据呼叫次数
<#list o.datas.d2[1..] as onearray><#if onearray??>
<#assign  longitude=onearray[o.indexs.d2.LONGITUDE]> 
<#assign  latitude=onearray[o.indexs.d2.LATITUDE]>
<#assign rs= rowcolumn(longitude, latitude , longitude_lb, latitude_lb, longitude_rb ,latitude_rb)>
<#if rs??><#assign  rowcolumn=rs?split(',')> 
          <#assign len=rowcolumn?size-1 />
					<#list 0..len as d>${rowcolumn[d]}<#if d != len>,</#if></#list>,${onearray[o.indexs.d2.DODATA_CALL_NUM]}
</#if></#if></#list>