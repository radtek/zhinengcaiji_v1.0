时间,时段,厂家,BSC号,基站号,厂商侧 CELLID,扇区号,扇区名称,C10.3业务信道承载的话务量（含切换）（ERL）,C10.4业务信道承载的话务量（不含切换）（ERL）,C6.4业务信道掉话率（%）,MC1.3呼叫建立成功率（%）,MC1.6呼叫建立成功率－CS（%）,MC1.9呼叫建立成功率－PS（%）,C6.2基站系统硬切换成功率（%）,C6.3系统软切换成功率（%）,登记成功率（%）,MC2.8软切换比例－CS（%）,MC2.14软切换比例－PS（%）,1X:RSSI均值（分集）,1X:RSSI均值（主集）,1X：RSSI最大值(主集),1X：RSSI最大值(分集),1X：RSSI最小值(主集),1X：RSSI最小值(分集)
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>