省份||是否采集MR||采集点标识||小区标识||小区名称||所属城市标识||所属城市区域||所属行政区域类型||所属MSC标识||所属BSC标识||所属BTS标识||厂商标识||基站类型||位置区码||小区码||频点类型||天线挂高||天线方向角||电子下倾角||机械倾角||配置载频数||可用载频数||SDCCH配置信道数||SDCCH可用数||TCH配置信道数||运行状态||经度||纬度||天线型号||带室外直放站数量||载频最大发射功率||小区覆盖类型||设备厂家CELL标识||所属区县标识||静态配置PDCH信道数||
<#assign split="||"/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 />${onearray[d]}<#if d != len>||</#if></#list>
</#if></#list>
</#if>