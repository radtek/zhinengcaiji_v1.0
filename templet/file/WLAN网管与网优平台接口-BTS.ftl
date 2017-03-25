cityid	Bscid	BtsId	基站名称	中文名称	供应商	BSC名称	城市	县区	信道单元数	载频个数	基站的设计容量	BTS类型	基站经度	基站纬度	位置	LAC	基站类型	是否DO站	设备类型	扇区数量	站型	传输方式	是否级联	2M数量	地貌	建筑类型	机房所在楼层	是否与联通共站	cell_carrier_num_do	cell_carrier_num_1x	基站状态
<#assign split="	"/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>	</#if></#list>
</#if></#list>
</#if>