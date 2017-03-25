时间,时段,厂家,BSC号,基站号,厂商侧 CELLID,扇区号,扇区名称,D2.22无线掉线率（%）,DO：连接成功率（%）,D7.4AN内软切换成功率（%）,D7.7AN间软切换成功率（%）,D6.9前向RLP数据吞吐量（KBPS）,D6.11反向RLP数据吞吐量（KBPS）,D3.1UATI分配成功率,DO:RSSI均值（分集）,DO:RSSI均值（主集）,DO：RSSI最大值(主集),DO：RSSI最大值(分集),DO：RSSI最小值(主集),DO：RSSI最小值(分集)
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>