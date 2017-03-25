省份||所属城市标识||厂商标识||所属OMC标识||所属MSC标识||所属BSC标识||BTS标识||BTS唯一标识DN||BTS中文名称||固定资产编号||位置区码||小区标识列表||版本标识||基站类型||天线方向类型||工作频率||配置载频数||开通载频数||可用载频数||单载频小区数量||双载频小区数量||三载频小区数量||四载频及以上小区数量||TCH配置数||SDCCH配置数||静态PDCH配置数||基站状态||基站站址||经度||纬度||所属区县标识||设备厂家BTS标识||基站分级||直放站数量||载频数量||配置无线容量||E1端口数量||
<#assign split="||"/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 />${onearray[d]}<#if d != len>||</#if></#list>
</#if></#list>
</#if>