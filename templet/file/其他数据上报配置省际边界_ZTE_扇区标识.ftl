<#assign datas=o.datas.d1[1..]/>
<#assign indexs=o.indexs.d1/>
<#assign basekeyid="源省际边界扇区标识"/>
<#assign seqnoid="邻区顺序"/>
<#if datas??>
 <#if (datas?size>0)>
<@border datas=o.datas.d1 indexs=o.indexs.d1 basekeyid=basekeyid  seqnoid=seqnoid  sep=",">

</@border>
</#if>
</#if>