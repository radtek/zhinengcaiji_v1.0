版本号,时间戳,省份,地市,天线厂家,天线型号名称,天线型号ID,方向类型,天线极化方式,天线增益,天线水平半功率角（度）,天线垂直半功率角（度）,是否可变电调天线,预置电下倾（度）,备注
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>