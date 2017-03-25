协调单基本信息
时间戳,协调单编号,协调单类型,本地省份,本地地市,目标省份,目标地市,协调单标题,问题描述,协调单发起时间,协调单完成时间,发起方人姓名,发起方人联系方式,接收人姓名,接收人联系方式,当前环节,执行结果,反馈意见,备注
<#assign split=","/>
<#if o.datas["d1"]?size gt 1> 
<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>

协调单详细内容
子协调单编号,网元级别,网元标识,网元名称,边界优化调整类别,子协调单标题,边界优化调整内容,调整结果记录,附件
<#assign split=","/>
<#if o.datas["d2"]?size gt 1> 
<#list o.datas.d2[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,</#if></#list>
</#if></#list>
</#if>