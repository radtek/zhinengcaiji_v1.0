cityid	Bscid	BtsId	CellId	小区名称	供应商	LAC	CI	城市	BSC名称	BTS名称	1X载频数	无线容量	PN	总载频数	设备类型	天线挂高	天线型号	天线增益	极化方式	水平波瓣	垂直波瓣	方位角	天线电子倾角	天线机械倾角	天线倾角	是否可变电调	天线架设方式	是否扇区分裂	多载频边界Border	扇区号	扇区类型	直放数量	经度	纬度	小区类型	所属MSC名称	基站站号	DO载频数量	是否DO小区
<#assign split="	"/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>	</#if></#list>
</#if></#list>
</#if>