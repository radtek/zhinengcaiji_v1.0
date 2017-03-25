版本号,时间,省份,地市,1X高话务载扇数量,1X低话务载扇数量,1XWalsh码拥塞载扇数量,1XCE拥塞基站数量,1X前向功率拥塞载扇数量,DO高话务载扇数量,DO忙载扇数量,高连接负荷载扇数量,资源受限导致连接失败载扇数量,高流量载扇 （>7Gb）的数量,低流量载扇（<50Mb）数量,零流量载扇数量,前向RLP平均速率低的载扇数量,DO吞吐量突变的载扇数量
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>