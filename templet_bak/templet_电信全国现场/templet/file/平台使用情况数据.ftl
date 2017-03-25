<#assign x = "\n">
<#assign rn = "\r\n">
<#assign datas2=o.datas.d2[1..]/>
<#assign indexs2=o.indexs.d2[1..]/>
<#assign datas3=o.datas.d3[1..]/>
<#assign indexs3=o.indexs.d3[1..]/>
<#assign head1 = "模块点击类">
<#assign head2 = "省份,时间戳,模块名称,模块点击次数">
<#assign head3 = "活动用户类">
<#assign head4 = "省份,时间戳,活动账号名称,活动账号登陆次数,活动账号登陆时长">
${head1}${x}${head2}${x}<#list o.datas.d1[1..] as onearray><#if onearray??><#assign len=onearray?size-1 /><#list 0..len as d>${onearray[d]}<#if d != len>,<#else>${x}</#if></#list></#if></#list>
${head3}${x}${head4}${x}<@usestate datas2=datas2 indexs2=indexs2  datas3=datas3  indexs3=indexs3 sep=",">
</@usestate>