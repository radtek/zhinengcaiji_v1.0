,,,,,,MP2.2.1.4.1,MP2.2.1.4.2,MP2.2.1.4.3,MP2.2.1.4.4,MP2.2.1.4.5,MP2.2.1.4.6
时间戳,BSC标识,省份,城市,MSC标识,MGW标识,"MS闭环功率控制步长，一条腿","MS闭环功率控制步长，二条腿","MS闭环功率控制步长，三条腿","设置前向功率控制子信道相对20ms基本全速率帧大小，一条腿","控制子信道相对20ms基本全速率帧大小，二条腿","控制子信道相对20ms基本全速率帧大小，三条腿"
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>