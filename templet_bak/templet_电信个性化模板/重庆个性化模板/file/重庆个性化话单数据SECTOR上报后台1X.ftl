时间,时段,厂家,BSC号,基站号,厂商侧 CELLID,扇区号,扇区名称,Ec/Io接入区间[-9,0)次数,Ec/Io接入区间[-12,-9)次数,Ec/Io接入区间[-∞,-12)次数,Ec/Io接入区间[-9,0)比例,Ec/Io接入区间[-12,-9)比例,Ec/Io接入区间[-∞,-12)比例,Ec/Io释放区间[-9,0)次数,Ec/Io释放区间[-12,-9)次数,Ec/Io释放区间[-∞,-12)次数,Ec/Io释放区间[-9,0)比例,Ec/Io释放区间[-12,-9)比例,Ec/Io释放区间[-∞,-12)比例
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>