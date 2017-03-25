delete form cfg_provice_perf;
commit;
insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113153', 'MP4.11.2.1.1', 'cdll_site', 'pro.cdll_site', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113154', 'MP4.11.2.1.2', 'ant_face', 'pro.ant_face', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113155', 'MP4.11.2.1.3', 'analog_srv_grp', 'pro.analog_srv_grp', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113156', 'MP4.11.2.1.4', 'pilot_pn_offset', 'pro.pilot_pn_offset', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113157', 'MP4.11.2.1.5', 'dsc', 'pro.dsc', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113158', 'MP4.11.2.1.6', 'ecp', 'pro.ecp', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113159', 'MP4.11.2.1.7', 'sid', 'pro.sid', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082050', 'MD2.28', 'D2.28 DRC 前向速率为﹝大于1228K﹞的申请比率', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_MORE_1228_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081060', 'MC4.28', '业务信道分配成功次数(含切)-PS', 'SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081061', 'MC4.29', '业务信道分配失败次数(含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081062', 'MC4.30', '业务信道分配成功率(含切)-PS(%)', 'CASE WHEN (SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS))=0 THEN 0 ELSE ROUND((SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))/(SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081065', 'MC4.33', '业务信道分配失败次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081066', 'MC4.34', '业务信道分配成功率(不含切)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_SETUP_SUCC_PS,0))/SUM(TCH_ASSIGN_ATT_PS) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081067', 'MC4.35', '业务信道拥塞次数-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081068', 'MC4.36', '业务信道拥塞率-PS(%)', 'CASE WHEN (SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS))=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS)))/(SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081071', 'MC4.39', '业务信道拥塞率-硬切换PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_PS)-SUM(TCH_ASSIGN_SUC_HHO_PS))/SUM(TCH_ASSIGN_ATT_HHO_PS)* 100, 2) END  ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081103', 'MC5.29', 'BS内切换成功次数', 'SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INTRA_BS_SSHO_SUC_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081104', 'MC5.30', 'BS内切换成功率(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INTRA_BS_SSHO_SUC_NUM))/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM))* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081105', 'MC5.31', 'BS间切换请求次数', 'SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081106', 'MC5.32', 'BS间切换成功次数', 'SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081107', 'MC5.33', 'BS间切换成功率(%)', 'CASE WHEN (SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC))/(SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))* 100, 4) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081110', 'MC5.36', 'BS内硬切换成功率(%)', 'CASE WHEN SUM(INNER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_HHO_SUCC)/SUM(INNER_BSC_HHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081111', 'MC5.37', 'BS内软切换请求次数', 'SUM(INNER_BSC_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081112', 'MC5.38', 'BS内软切换成功次数', 'SUM(INNER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081113', 'MC5.39', 'BS内软切换成功率(%)', 'CASE WHEN SUM(INNER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SHO_SUCC)/SUM(INNER_BSC_SHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081116', 'MC5.42', 'BS内更软切换成功率(%)', 'CASE WHEN SUM(INTRA_BS_SSHO_ATT_NUM)=0 THEN 0 ELSE ROUND(SUM(INTRA_BS_SSHO_SUC_NUM)/SUM(INTRA_BS_SSHO_ATT_NUM)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081117', 'MC5.43', 'BS间硬切换请求次数', 'SUM(INTER_BSC_HHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081118', 'MC5.44', 'BS间硬切换成功次数', 'SUM(INTER_BSC_HHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081119', 'MC5.45', 'BS间硬切换成功率(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_HHO_SUCC)/SUM(INTER_BSC_HHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081120', 'MC5.46', 'BS间软切换请求次数', 'SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081121', 'MC5.47', 'BS间软切换成功次数', 'SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081122', 'MC5.48', 'BS间软切换成功率(%)', 'CASE WHEN SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_SHO_SUCC)/SUM(INTER_BSC_SHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081123', 'MC6.1', '第一载频(283)基站数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081124', 'MC6.2', '第二载频(201)基站数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081125', 'MC6.3', '第三载频(242)基站数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081126', 'MC6.4', '第四载频(160)基站数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081127', 'MC6.5', '1X载频总数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081132', 'MC6.10', '前向信道配置总数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081136', 'MC6.14', '反向信道配置总数', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081140', 'MC7.1', '前向重传总帧数', 'SUM(RETX_FRM_NUM_FWD_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081144', 'MC7.5', 'RLP前向丢弃数据量(字节)', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081145', 'MC7.6', '前向信道重传率(%)', 'CASE WHEN SUM(DATA_THROUGHPUT_FWD_1X)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_BYTE_1X)/(1024*SUM(DATA_THROUGHPUT_FWD_1X))* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081149', 'MC7.10', '反向信道重传率(%)', 'CASE WHEN SUM(TX_FRM_NUM_REV_1X)=0 THEN 0 ELSE ROUND(SUM(RETX_FRM_NUM_REV_1X)/SUM(TX_FRM_NUM_REV_1X)* 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081150', 'MC8.1', 'C1.19基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081151', 'MC8.2', 'C1.20单载频基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081152', 'MC8.3', 'C1.21双载频基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081153', 'MC8.4', 'C1.22三载频基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081154', 'MC8.5', 'C1.23四载频基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081155', 'MC8.6', 'C1.24小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081156', 'MC8.7', 'C1.25单载频小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081157', 'MC8.8', 'C1.26双载频小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081158', 'MC8.9', 'C1.27三载频小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081159', 'MC8.10', 'C1.28四载频小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081160', 'MC8.11', 'C1.31信道单元配置数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081161', 'MC8.12', 'C1.32无线容量', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081162', 'MC8.13', 'C1.33业务信道配置数', 'SUM(CH_CFG_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081163', 'MC9.1', 'C3.1业务信道负载率(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081165', 'MC9.3', 'C3.3信道单元可用率(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081166', 'MC9.4', 'C3.4业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT)*100,4) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081167', 'MC9.5', 'C3.5超忙小区比例(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081168', 'MC9.6', 'C3.6忙小区比例(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081169', 'MC9.7', 'C3.7超闲小区比例(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081170', 'MC9.8', 'C3.8严重溢出基站比例(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081184', 'MC10.7', 'C10.7第二载频(201)话务量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081185', 'MC10.8', 'C10.8第三载频(242)话务量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081186', 'MC10.9', 'C10.9第四载频(160)话务量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081187', 'MC10.10', 'C10.10超忙小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081188', 'MC10.11', 'C10.11忙小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081189', 'MC10.12', 'C10.12超闲小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081190', 'MC10.13', 'C11.17坏小区数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081191', 'MC10.14', 'C10.13严重溢出基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081192', 'MC10.15', 'C10.14溢出基站数量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081193', 'MC11.1', 'C11.4主叫业务信道分配请求次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081194', 'MC11.2', 'C11.5主叫业务信道分配成功次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081171', 'MC9.9', 'C3.9溢出基站比例(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081172', 'MC9.10', 'C6.2基站系统硬切换成功率(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081173', 'MC9.11', 'C6.3系统软切换成功率(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081174', 'MC9.12', 'C6.4业务信道掉话率(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081175', 'MC9.13', 'C6.5通话中断率(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081176', 'MC9.14', 'C6.6平均掉话间隔', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)) * 100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081177', 'MC9.15', 'C6.7坏小区比例(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081179', 'MC10.2', 'C10.2业务信道拥塞次数(含切换)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081182', 'MC10.5', 'C10.5WALSH码承载话务量', 'SUM(WALSHCODE_ERL)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081183', 'MC10.6', 'C10.6第一载频(283)话务量', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081195', 'MC11.3', 'C11.6被叫业务信道分配请求次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081196', 'MC11.4', 'C11.7被叫业务信道分配成功次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081197', 'MC11.5', 'C11.8业务信道分配请求次数(不含切换含短信)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081198', 'MC11.6', 'C11.9业务信道分配成功次数(不含切换含短信)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081199', 'MC11.7', 'C11.10业务信道分配请求次数(含切换含短信)', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081200', 'MC11.8', 'C11.11业务信道分配成功次数(含切换含短信)', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081201', 'MC11.9', 'C11.12基站系统硬切换请求次数', 'SUM(BSS_HHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081202', 'MC11.10', 'C11.13基站系统硬切换成功次数', 'SUM(BSS_HHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081203', 'MC11.11', 'C11.14系统软切换请求次数', 'SUM(S_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081204', 'MC11.12', 'C11.15系统软切换成功次数', 'SUM(S_SHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081206', 'MC11.14', 'C11.18呼叫尝试总次数', 'SUM(CALL_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082001', 'MD1.1', 'D1.1 DO基站总数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082002', 'MD1.2', 'D1.2 单载频基站数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082003', 'MD1.3', 'D1.3 双载频基站数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082004', 'MD1.4', 'D1.4 三载频基站数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113132', '', '源载波频点', 'pro.carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113133', '', '源pn', 'pro.pn', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113134', '', '邻区顺序', 'pro.nbrseq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113135', '', '切换方法', 'pro.switchtype', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113136', '', '邻载扇标识', 'pro.nei_sid || ''_'' || pro.nei_bts_id || ''_'' || pro.nei_ne_pn || ''_'' || pro.nei_carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113137', '', '邻载扇行政区', 'pro.nei_county_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113138', '', '邻载扇所属MSC标识', 'pro.nei_bsc_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113139', '', '邻载扇所属MGW标识', 'pro.nei_mgw', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113140', '', '邻载扇所属BSC标识', 'pro.nei_bsc_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113141', '', '邻载扇所属BTS标识', 'pro.nei_bts_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113142', '', '邻载扇所属扇区标识', 'pro.nei_cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113143', '', '邻扇区名称', 'pro.nei_cell_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113144', '', '邻扇区编号', 'pro.nei_cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113145', '', '邻载波标识', 'pro.nei_carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113146', '', '邻载波频点', 'pro.nei_carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113147', '', '邻pn', 'pro.nei_ne_pn', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113148', '', '邻扇区所属省', 'pro.nei_province_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113149', '', '邻扇区所属城市', 'pro.nei_city_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113150', '', '邻扇区边界类型', 'pro.bordertype', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113151', '', '邻扇区所属厂家', 'case pro.nei_vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113152', '', '是否为外部邻区', 'pro.isouter', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082051', 'MD3.1', 'D3.1 UATI分配成功率', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082106', 'MD7.1', 'D7.1 全局软切换成功率', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081001', 'MC1.1', '呼叫尝试次数', 'sum(nvl(CALL_ATT_CS,0))+sum(nvl(CALL_ATT_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081002', 'MC1.2', '呼叫建立成功次数', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(CALL_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081004', 'MC1.4', '呼叫尝试次数-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081005', 'MC1.5', '呼叫建立成功次数-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081024', 'MC3.1', '业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(TCH_DROP_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081038', 'MC4.6', '业务信道分配成功次数(不含切)', 'SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081048', 'MC4.16', '业务信道分配成功次数(不含切)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081019', 'MC2.10', '业务信道话务量(不含切)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081034', 'MC4.2', '业务信道分配成功次数(含切)', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081050', 'MC4.18', '业务信道分配成功率(不含切)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ), 4)*100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081013', 'MC2.4', '业务信道话务量(不含切)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081205', 'MC11.13', 'C11.16业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081006', 'MC1.6', '呼叫建立成功率-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0  WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082148', 'MD10.14', '前向业务信道物理层发送的bit数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082149', 'MD10.15', '前向物理层发送实际占用时隙时长', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082150', 'MD10.16', '反向业务信道物理层接收的bit数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081008', 'MC1.8', '呼叫建立成功次数-PS', 'SUM(CALL_SETUP_SUCC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081027', 'MC3.4', '业务信道掉话次数-CS', 'SUM(TCH_DROP_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081030', 'MC3.7', '业务信道掉话次数-PS', 'SUM(TCH_DROP_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081007', 'MC1.7', '呼叫尝试次数-PS', 'SUM(CALL_ATT_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081064', 'MC4.32', '业务信道分配成功次数(不含切)-PS', 'SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081003', 'MC1.3', '呼叫建立成功率(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_PS,0))) = 0 THEN 0  WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CALL_SETUP_SUCC_PS,0)))>=(SUM(CALL_ATT) + SUM(CALL_ATT_PS)) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CALL_SETUP_SUCC_PS,0)))/(SUM(CALL_ATT) + SUM(CALL_ATT_PS)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082151', 'MD10.17', '反向物理层接收实际占用时隙时长', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082027', 'MD2.5', 'D2.5 AN发起的无线连接请求次数', 'SUM(nvl(AN_CONN_ATT_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082028', 'MD2.6', 'D2.6 AT发起的无线连接成功次数', 'SUM(nvl(AT_CONN_SUC_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082029', 'MD2.7', 'D2.7 AN发起的无线连接成功次数', 'SUM(nvl(AN_CONN_SUC_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082052', 'MD3.2', 'D3.2 UATI请求次数', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082053', 'MD3.3', 'D3.3 UATI分配成功次数', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082107', 'MD7.2', 'D7.2 全局软切换请求次数', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082108', 'MD7.3', 'D7.3 全局软切换成功次数', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081042', 'MC4.10', '业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT)+ (SUM(CALL_ATT_PS)-sum(CALL_SETUP_SUCC_PS)))/SUM(TCH_SETUP_ATT)*100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081052', 'MC4.20', '业务信道拥塞率-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0   ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT),4)*100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081029', 'MC3.6', '话务掉话比-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081032', 'MC3.9', '话务掉话比-PS', 'CASE WHEN SUM(TCH_DROP_PS)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/SUM(TCH_DROP_PS),2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082130', 'MD9.7', 'Do载频话务量(119)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082131', 'MD9.8', '单DO载频小区数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082132', 'MD9.9', '双DO载频小区数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082133', 'MD9.10', '三DO载频小区数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082134', 'MD9.11', 'DO小区数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082135', 'MD10.1', '数据连接建立总时长', 'SUM(DO_CONN_SETUP_TIME)*(SUM(nvl(AT_CONN_SUC_DO,0))+SUM(nvl(AN_CONN_SUC_DO,0)))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082136', 'MD10.2', '数据连接占用总时长', 'SUM(DO_CONN_OCCUPANCY_TIME)*(SUM(nvl(AT_CONN_SUC_DO,0))+SUM(nvl(AN_CONN_SUC_DO,0)))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082138', 'MD10.4', '前向重传字节数', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082139', 'MD10.5', '前向发送字节数', 'SUM(FTCH_RLP_TX_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082140', 'MD10.6', '反向重传字节数', 'SUM(RTCH_RLP_RETX_DO) *1024', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082141', 'MD10.7', '反向接收的字节数', 'SUM(RTCH_RLP_TX_DO)*1024', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082142', 'MD10.8', 'RAB繁忙次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082143', 'MD10.9', 'RAB闲次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081075', 'MC5.1', '切换请求次数', 'SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081076', 'MC5.2', '切换成功次数', 'SUM(INNER_BSC_HHO_SUCC) + SUM(INNER_BSC_SHO_SUCC) + SUM(INTER_BSC_HHO_SUCC) + SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081077', 'MC5.3', '切换成功率(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC) + SUM(INNER_BSC_SHO_SUCC) + SUM(INTER_BSC_HHO_SUCC) + SUM(INTER_BSC_SHO_SUCC))/(SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT))*100,2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081078', 'MC5.4', '切换请求次数-CS', 'SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081079', 'MC5.5', '切换成功次数-CS', 'SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081080', 'MC5.6', '切换成功率-CS(%)', 'CASE WHEN (SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)) = 0 THEN 0 ELSE  ROUND( (SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC))/(SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)), 3) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081081', 'MC5.7', '硬切换请求次数-CS', 'SUM(BSS_HHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081082', 'MC5.8', '硬切换成功次数-CS', 'SUM(BSS_HHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081083', 'MC5.9', '硬切换成功率-CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081086', 'MC5.12', '软切换成功率-CS(%)', 'CASE WHEN (SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)) = 0 THEN 0 ELSE  ROUND((SUM(S_SHO_SUC)-SUM(S_SSHO_SUC))/(SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081026', 'MC3.3', '话务掉话比', 'CASE WHEN (SUM(TCH_DROP_NUM) + SUM(TCH_DROP_PS))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + SUM(TCH_DROP_PS)),2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081041', 'MC4.9', '业务信道拥塞次数', 'SUM(TCH_BLOCK_COUNT)+ (SUM(CALL_ATT_PS)-sum(CALL_SETUP_SUCC_PS))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081044', 'MC4.12', '业务信道分配成功次数(含切)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081046', 'MC4.14', '业务信道分配成功率(含切)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081051', 'MC4.19', '业务信道拥塞次数-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082046', 'MD2.24', 'D2.24 无线连接平均建立时长', 'SUM(DO_CONN_SETUP_TIME)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082047', 'MD2.25', 'D2.25 无线连接平均占用时长', 'SUM(DO_CONN_OCCUPANCY_TIME)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082070', 'MD4.1', 'D4.1 用户从Dormant态到Active态的激活成功率', 'CASE WHEN (SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)) /(SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081025', 'MC3.2', '业务信道掉话率(%)', 'CASE WHEN (SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(TCH_SETUP_SUCC_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(TCH_DROP_PS,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(TCH_DROP_PS,0)))/(SUM(TCH_ASSIGN_SUC) + SUM(TCH_SETUP_SUCC_PS)),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081074', 'MC4.42', '业务信道拥塞率-软切换PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_PS)-SUM(TCH_ASSIGN_SUC_SHO_PS))/SUM(TCH_ASSIGN_ATT_SHO_PS)* 100, 2) END  ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081090', 'MC5.16', '切换请求次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081091', 'MC5.17', '切换成功次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081092', 'MC5.18', '切换成功率-PS(%)', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081096', 'MC5.22', '软切换请求次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081097', 'MC5.23', '软切换成功次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081098', 'MC5.24', '软切换成功率-PS(%)', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081099', 'MC5.25', '更软切换请求次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081100', 'MC5.26', '更软切换成功次数-PS', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081101', 'MC5.27', '更软切换成功率-PS(%)', '', 'ZY0808', '', '1', '华为1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081102', 'MC5.28', 'BS内切换请求次数', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082152', 'MC12.1', '预留字段1', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082153', 'MC12.2', '预留字段2', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082154', 'MC12.3', '预留字段3', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082155', 'MC12.4', '预留字段4', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082156', 'MC12.5', '预留字段5', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081207', 'MC12.1', '预留字段1', '', 'ZY0808', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081043', 'MC4.11', '业务信道分配请求次数(含切)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081208', 'MC12.2', '预留字段2', '', 'ZY0808', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081209', 'MC12.3', '预留字段3', '', 'ZY0808', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081210', 'MC12.4', '预留字段4', '', 'ZY0808', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081211', 'MC12.5', '预留字段5', '', 'ZY0808', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081009', 'MC1.9', '呼叫建立成功率-PS(%)', 'case when SUM(CALL_ATT_PS) = 0  THEN 0 WHEN (SUM(CALL_SETUP_SUCC_PS))>=SUM(CALL_ATT_PS) THEN 99.99 else     ROUND((SUM(CALL_SETUP_SUCC_PS)) / (SUM(CALL_ATT_PS)) * 100,4)END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081010', 'MC2.1', '业务信道话务量(含切)(Erl)', 'SUM(SHO_TRAFFIC_CS)+SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081012', 'MC2.3', '业务信道话务量(含切)-CS(Erl)', 'SUM(SHO_TRAFFIC_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081014', 'MC2.5', 'Walsh码话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081015', 'MC2.6', '软切换话务量-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081016', 'MC2.7', '更软切换话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081018', 'MC2.9', '业务信道话务量(含切)-PS(Erl)', 'SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081020', 'MC2.11', 'Walsh码话务量-PS(Erl)', 'SUM(FCH_WALSHCODE_TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081021', 'MC2.12', '软切换话务量-PS(Erl)', 'SUM(FCH_CE_TRAFFIC_PS) - SUM(TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081023', 'MC2.14', '软切换比例-PS(%)', 'case when SUM(TRAFFIC_PS) = 0  THEN 0 else ROUND((SUM(FCH_CE_TRAFFIC_PS) - SUM(TRAFFIC_PS)) / SUM(TRAFFIC_PS)*100,4)END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081031', 'MC3.8', '业务信道掉话率-PS(%)', 'CASE WHEN SUM(TCH_SETUP_SUCC_PS)=0 THEN 0 WHEN SUM(TCH_DROP_PS)<=0 THEN 0.01 ELSE ROUND(SUM(TCH_DROP_PS) / SUM(TCH_SETUP_SUCC_PS) * 100, 2) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081033', 'MC4.1', '业务信道分配请求次数(含切)', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081035', 'MC4.3', '业务信道分配失败次数(含切)', 'SUM(TCH_SETUP_ATT)-SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081036', 'MC4.4', '业务信道分配成功率(含切)(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081039', 'MC4.7', '业务信道分配失败次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081040', 'MC4.8', '业务信道分配成功率(不含切)(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS))=0 THEN 0 ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(nvl(TCH_SETUP_SUCC_PS,0))) /(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100, 4) END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081045', 'MC4.13', '业务信道分配失败次数(含切)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081047', 'MC4.15', '业务信道分配请求次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081049', 'MC4.17', '业务信道分配失败次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081055', 'MC4.23', '业务信道拥塞率-硬切换CS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_CS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_CS)-SUM(TCH_ASSIGN_SUC_HHO_CS))/SUM(TCH_ASSIGN_ATT_HHO_CS) * 100, 2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041056', 'MC4.24', '业务信道分配请求次数-软切换-CS', 'SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041057', 'MC4.25', '业务信道分配成功次数-软切换-CS', 'SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041035', 'MC4.3', '业务信道分配失败次数(含切)', 'SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-(SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041058', 'MC4.26', '业务信道拥塞率-软切换CS(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND((SUM(S_SHO_ATT) - SUM(S_SHO_SUC)) / SUM(S_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041138', 'MC6.16', '反向信道最大占用数', 'SUM(REV_CH_MAX_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041139', 'MC6.17', '反向信道最大占用率(%)', 'CASE WHEN SUM(REV_CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(REV_CH_MAX_NUM)/SUM(REV_CH_RLB_NUM),4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082005', 'MD1.5', 'D1.5 四载频及以上基站数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041140', 'MC7.1', '前向重传总帧数', 'SUM(RETX_FRM_NUM_FWD_1X)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041059', 'MC4.27', '业务信道分配请求次数(含切)-PS', 'SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041061', 'MC4.29', '业务信道分配失败次数(含切)-PS', 'SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-(SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041063', 'MC4.31', '业务信道分配请求次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041067', 'MC4.35', '业务信道拥塞次数-PS', 'SUM(TCH_BLOCK_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041069', 'MC4.37', '业务信道分配请求次数-硬切换-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041070', 'MC4.38', '业务信道分配成功次数-硬切换-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002046', 'ID46', 'D2.24 无线连接平均建立时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041078', 'MC5.4', '切换请求次数-CS', 'SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041178', 'MC10.1', 'C10.1信道单元可用数', 'SUM(FWD_CH_RLB_NUM)+SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042138', 'MD10.4', '前向重传字节数', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041054', 'MC4.22', '业务信道分配成功次数-硬切换-CS', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041060', 'MC4.28', '业务信道分配成功次数(含切)-PS', 'SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041062', 'MC4.30', '业务信道分配成功率(含切)-PS(%)', 'CASE WHEN SUM(CALL_ATT_NUM_PS)+SUM(HHO_ATT_NUM_PS)+SUM(SHO_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)=0 THEN 0 ELSE ROUND((SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(HHO_SUC_NUM_PS) + SUM(SHO_SUC_NUM_PS) +SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS))/(SUM(CALL_ATT_NUM_PS)+SUM(HHO_ATT_NUM_PS)+SUM(SHO_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS))*100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042141', 'MD10.7', '反向接收的字节数', 'SUM(DO_RTCH_RLP_TX)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042082', 'MD5.2', 'D5.2 呼叫话务量', 'SUM(TRAFFIC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042045', 'MD2.23', 'D2.23 网络掉线率', 'CASE WHEN SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))=0 THEN 0 ELSE ROUND((SUM(REL_NUM_PDSN_DO)+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100/SUM(nvl(RELEASETIMES_INCLPDSN_DO,0)),4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041141', 'MC7.2', '前向传输总帧数-不包括重传', 'SUM(TX_FRM_NUM_FWD_1X)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041146', 'MC7.7', '反向重传总帧数', 'SUM(RETX_FRM_NUM_REV_1X)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041147', 'MC7.8', '反向传输总帧数-不包括重传', 'SUM(TX_FRM_NUM_REV_1X)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041160', 'MC8.11', 'C1.31信道单元配置数量', 'SUM(FWD_CH_NUM)+SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041162', 'MC8.13', 'C1.33业务信道配置数', 'SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042069', 'MD3.19', 'D3.19 非Active态Session会话数', 'SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042074', 'MD4.5', 'D4.5 AT 发起的Dormant态到Active态激活请求次数', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042100', 'MD6.15', 'D6.15 反向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042098', 'MD6.13', 'D6.13 前向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041011', 'MC2.2', '业务信道话务量(不含切)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041180', 'MC10.3', 'C10.3业务信道承载的话务量(含切换)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041181', 'MC10.4', 'C10.4业务信道承载的话务量(不含切换)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042023', 'MD2.1', 'D2.1 无线连接成功率', 'CASE WHEN SUM(nvl(DO_CONN_ATT,0))=0 THEN 0 WHEN SUM(nvl(DO_SUC_CONN_NUM,0))>=SUM(nvl(DO_CONN_ATT,0)) THEN 99.99 ELSE ROUND(SUM(nvl(DO_SUC_CONN_NUM,0)) / SUM(nvl(DO_CONN_ATT,0)) * 100, 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042044', 'MD2.22', 'D2.22 无线掉线率', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041164', 'MC9.2', 'C3.2软切换因子(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041006', 'MC1.6', '呼叫建立成功率-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0 WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042036', 'MD2.14', 'D2.14 无线连接建立失败次数（原因为反向业务信道俘获失败）', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042037', 'MD2.15', 'D2.15 无线连接建立失败次数（原因为没有收到TCC 消息）', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042107', 'MD7.2', 'D7.2 全局软切换请求次数', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042108', 'MD7.3', 'D7.3 全局软切换成功次数', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041028', 'MC3.5', '业务信道掉话率-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042038', 'MD2.16', 'D2.16 无线连接释放次数(含PDSN 要求释放次数)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042041', 'MD2.19', 'D2.19 无线掉线次数（空口丢失）', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042042', 'MD2.20', 'D2.20 无线掉线次数（硬切换失败导致的掉线）', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042043', 'MD2.21', 'D2.21 无线掉线次数（其他原因）', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042051', 'MD3.1', 'D3.1 UATI分配成功率', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042106', 'MD7.1', 'D7.1 全局软切换成功率', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041003', 'MC1.3', '呼叫建立成功率(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_NUM_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CMO_CALLSUCCNUM_PS,0)))>=(SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_NUM_PS,0))) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CMO_CALLSUCCNUM_PS,0))+SUM(nvl(PAG_SUCC_NUM_PS,0)))/(SUM(CALL_ATT) + SUM(CALL_ATT_NUM_PS)),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041001', 'MC1.1', '呼叫尝试次数', 'sum(nvl(CALL_ATT,0))+sum(nvl(CALL_ATT_NUM_PS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041004', 'MC1.4', '呼叫尝试次数-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041005', 'MC1.5', '呼叫建立成功次数-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041024', 'MC3.1', '业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(DATE_DROP_NUM,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041038', 'MC4.6', '业务信道分配成功次数(不含切)', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041048', 'MC4.16', '业务信道分配成功次数(不含切)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042048', 'MD2.26', 'D2.26 DRC 前向速率为﹝小于307.2K﹞的申请比率', '[MD10.11] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042049', 'MD2.27', 'D2.27 DRC 前向速率为﹝307.2K ～1228K﹞的申请比率', '[MD10.12] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042050', 'MD2.28', 'D2.28 DRC 前向速率为﹝大于1228K﹞的申请比率', '[MD10.13] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042056', 'MD3.6', 'D3.6 Session接入鉴权成功率', 'CASE WHEN SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(AUTH_SUC_DO)/(SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042058', 'MD3.8', 'D3.8 Session接入鉴权请求次数', 'SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042061', 'MD3.11', 'D3.11 Session协商成功率', 'CASE WHEN SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO)/(SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042064', 'MD3.14', 'D3.14 Session跨AN Dormant切换成功率(%)', 'CASE WHEN SUM(SESS_INTER_AN_DORMHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_INTER_AN_DORMHO_SUC_DO)/SUM(SESS_INTER_AN_DORMHO_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042093', 'MD6.8', 'D6.8 PCF前向分组丢包率', 'CASE WHEN SUM(FWD_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(FWD_PAK_DISCARD_NUM_DO)/SUM(FWD_PAK_TOTAL_NUM_DO),4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041155', 'MC8.6', 'C1.24小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042095', 'MD6.10', 'D6.10 前向RLP重传率', 'CASE WHEN SUM(FWD_RLP_AVG_THROUGHPUT_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO)/SUM(FWD_RLP_AVG_THROUGHPUT_DO)/1000/3600*8*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042097', 'MD6.12', 'D6.12 反向RLP重传率', 'CASE WHEN SUM(DO_RTCH_RLP_TX)=0 THEN 0 ELSE ROUND(SUM(RTCH_RLP_RETX_DO)/SUM(DO_RTCH_RLP_TX)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042099', 'MD6.14', 'D6.14 前向业务信道物理层突发吞吐量', 'CASE WHEN SUM(FTCH_PHY_SLOT_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_PHY_TX_BIT_DO)/SUM(FTCH_PHY_SLOT_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042101', 'MD6.16', 'D6.16 反向业务信道物理层突发吞吐量', 'CASE WHEN SUM(RLP_CALLKDURATION)=0 THEN 0 ELSE ROUND(SUM(RTCH_PHY_TX_BIT_DO)/SUM(RLP_CALLKDURATION)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042102', 'MD6.17', 'D6.17 前向物理层业务信道时隙占用率', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),4)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042104', 'MD6.19', 'D6.19 反向接入信道时隙占用率', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042105', 'MD6.20', 'D6.20 反向链路繁忙率', 'CASE WHEN SUM(RAB_BUSY_NUM_DO)+SUM(RAB_IDLE_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RAB_BUSY_NUM_DO)/(SUM(RAB_BUSY_NUM_DO)+SUM(RAB_IDLE_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042109', 'MD7.4', 'D7.4 AN内软切换成功率', 'CASE WHEN SUM(INN_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_BS_SHO_SUC_DO)/SUM(INN_BS_SHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042112', 'MD7.7', 'D7.7 AN间软切换成功率', 'CASE WHEN SUM(INTER_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_BS_SHO_SUC_DO)/SUM(INTER_BS_SHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042115', 'MD7.10', 'D7.10 AN内硬切换成功率', 'CASE WHEN SUM(INN_AN_HHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_AN_HHO_SUC_DO)/SUM(INN_AN_HHO_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042118', 'MD7.13', 'D7.13 AN间硬切换成功率', 'CASE WHEN SUM(INTER_AN_HHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_AN_HHO_ATT_DO)/SUM(INTER_AN_HHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042121', 'MD8.1', 'D8.1 寻呼响应率', 'CASE WHEN SUM(PAGE_ATT_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(PAGE_SUC_NUM_DO)/SUM(PAGE_ATT_NUM_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042124', 'MD9.1', '存在DO载频(37)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042125', 'MD9.2', '存在DO载频(78)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042126', 'MD9.3', '存在DO载频(119)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041013', 'MC2.4', '业务信道话务量(不含切)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042077', 'MD4.8', 'D4.8 AN发起的Dormant态到Active态激活成功率', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AN_DOR2ACT_SUC_DO)/SUM(AN_DOR2ACT_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042068', 'MD3.18', 'D3.18 Active态Session会话数', 'SUM(SESSION_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041198', 'MC11.6', 'C11.9业务信道分配成功次数(不含切换含短信)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041199', 'MC11.7', 'C11.10业务信道分配请求次数(含切换含短信)', 'SUM(TCH_SETUP_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042078', 'MD4.9', 'D4.9 AN发起的Dormant到Active态的激活请求次数', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042085', 'MD5.5', 'D5.5 软切换因子', 'CASE WHEN SUM(TRAFFIC_DO)=0 THEN 0 ELSE ROUND(SUM(SFT_HO_TRAFFIC_DO)/SUM(TRAFFIC_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042087', 'MD6.2', 'D6.2 PCF前向数据流量', 'SUM(FWD_THROUGHOUT_PCF_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042090', 'MD6.5', 'D6.5 反向分组业务在PCF丢弃的包数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042092', 'MD6.7', 'D6.7 PCF反向分组丢包率', '[MD6.5] / [MD6.3] ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041179', 'MC10.2', 'C10.2业务信道拥塞次数(含切换)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041182', 'MC10.5', 'C10.5WALSH码承载话务量', 'SUM(WALSHCODE_ERL)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041007', 'MC1.7', '呼叫尝试次数-PS', 'SUM(CALL_ATT_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041008', 'MC1.8', '呼叫建立成功次数-PS', 'SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041193', 'MC11.1', 'C11.4主叫业务信道分配请求次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041194', 'MC11.2', 'C11.5主叫业务信道分配成功次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041195', 'MC11.3', 'C11.6被叫业务信道分配请求次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041196', 'MC11.4', 'C11.7被叫业务信道分配成功次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041197', 'MC11.5', 'C11.8业务信道分配请求次数(不含切换含短信)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041201', 'MC11.9', 'C11.12基站系统硬切换请求次数', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041202', 'MC11.10', 'C11.13基站系统硬切换成功次数', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041200', 'MC11.8', 'C11.11业务信道分配成功次数(含切换含短信)', 'SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041203', 'MC11.11', 'C11.14系统软切换请求次数', 'SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041204', 'MC11.12', 'C11.15系统软切换成功次数', 'SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041027', 'MC3.4', '业务信道掉话次数-CS', 'SUM(TCH_DROP_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041206', 'MC11.14', 'C11.18呼叫尝试总次数', 'SUM(CALL_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042002', 'MD1.2', 'D1.2 单载频基站数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042003', 'MD1.3', 'D1.3 双载频基站数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042004', 'MD1.4', 'D1.4 三载频基站数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042005', 'MD1.5', 'D1.5 四载频及以上基站数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042006', 'MD1.6', 'D1.6 载扇数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042007', 'MD1.7', 'D1.7 反向CE最高利用率', 'CASE WHEN SUM(RCE_RLB_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RCE_MAX_BUSY_NUM_DO) / SUM(RCE_RLB_NUM_DO) * 100, 2) END ', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042010', 'MD1.10', 'D1.10 前向业务MacIndex最高利用率', '[MD1.11] / [MD10.10] * 100 ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042011', 'MD1.11', 'D1.11 前向业务MacIndex最大忙数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042012', 'MD1.12', 'D1.12 PCF数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042013', 'MD1.13', 'D1.13 PCF主处理器平均负荷', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042014', 'MD1.14', 'D1.14 PCF内最大可同时支持的HRPD会话数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042015', 'MD1.15', 'D1.15 PCF内最大可同时支持的激活的HRPD会话数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101153', 'MC8.4', 'C1.22三载频基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042016', 'MD1.16', 'D1.16 PCF配置的上行最大吞吐率', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101154', 'MC8.5', 'C1.23四载频基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101155', 'MC8.6', 'C1.24小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101156', 'MC8.7', 'C1.25单载频小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101157', 'MC8.8', 'C1.26双载频小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101158', 'MC8.9', 'C1.27三载频小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101159', 'MC8.10', 'C1.28四载频小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101160', 'MC8.11', 'C1.31信道单元配置数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101161', 'MC8.12', 'C1.32无线容量', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101162', 'MC8.13', 'C1.33业务信道配置数', 'SUM(TCEA)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101163', 'MC9.1', 'C3.1业务信道负载率(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101165', 'MC9.3', 'C3.3信道单元可用率(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101166', 'MC9.4', 'C3.4业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT)*100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101167', 'MC9.5', 'C3.5超忙小区比例(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101168', 'MC9.6', 'C3.6忙小区比例(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101169', 'MC9.7', 'C3.7超闲小区比例(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101170', 'MC9.8', 'C3.8严重溢出基站比例(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101171', 'MC9.9', 'C3.9溢出基站比例(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101008', 'MC1.8', '呼叫建立成功次数-PS', 'sum(ESTDATACALLS3G)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101013', 'MC2.4', '业务信道话务量(不含切)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101172', 'MC9.10', 'C6.2基站系统硬切换成功率(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101173', 'MC9.11', 'C6.3系统软切换成功率(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101174', 'MC9.12', 'C6.4业务信道掉话率(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101175', 'MC9.13', 'C6.5通话中断率(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101176', 'MC9.14', 'C6.6平均掉话间隔', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101177', 'MC9.15', 'C6.7坏小区比例(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101179', 'MC10.2', 'C10.2业务信道拥塞次数(含切换)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101182', 'MC10.5', 'C10.5WALSH码承载话务量', 'SUM(WALSHCODE_ERL)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101183', 'MC10.6', 'C10.6第一载频(283)话务量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101184', 'MC10.7', 'C10.7第二载频(201)话务量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101185', 'MC10.8', 'C10.8第三载频(242)话务量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101186', 'MC10.9', 'C10.9第四载频(160)话务量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101187', 'MC10.10', 'C10.10超忙小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101188', 'MC10.11', 'C10.11忙小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101189', 'MC10.12', 'C10.12超闲小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101190', 'MC10.13', 'C11.17坏小区数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101191', 'MC10.14', 'C10.13严重溢出基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101192', 'MC10.15', 'C10.14溢出基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101193', 'MC11.1', 'C11.4主叫业务信道分配请求次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101194', 'MC11.2', 'C11.5主叫业务信道分配成功次数(不含切换不含短信)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101195', 'MC11.3', 'C11.6被叫业务信道分配请求次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101196', 'MC11.4', 'C11.7被叫业务信道分配成功次数(不含切换不含短信)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101197', 'MC11.5', 'C11.8业务信道分配请求次数(不含切换含短信)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101198', 'MC11.6', 'C11.9业务信道分配成功次数(不含切换含短信)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101199', 'MC11.7', 'C11.10业务信道分配请求次数(含切换含短信)', 'SUM(TCH_SETUP_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101200', 'MC11.8', 'C11.11业务信道分配成功次数(含切换含短信)', 'SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101201', 'MC11.9', 'C11.12基站系统硬切换请求次数', 'SUM(BSS_HHO_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101202', 'MC11.10', 'C11.13基站系统硬切换成功次数', 'SUM(BSS_HHO_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101203', 'MC11.11', 'C11.14系统软切换请求次数', 'SUM(S_SHO_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101204', 'MC11.12', 'C11.15系统软切换成功次数', 'SUM(S_SHO_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101206', 'MC11.14', 'C11.18呼叫尝试总次数', 'SUM(CALL_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810001', 'MD1.1', 'D1.1 DO基站总数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101010', 'MC2.1', '业务信道话务量(含切)(Erl)', 'SUM(nvl(SHO_TRAFFIC_CS,0)) + SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101012', 'MC2.3', '业务信道话务量(含切)-CS(Erl)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101014', 'MC2.5', 'Walsh码话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101015', 'MC2.6', '软切换话务量-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101016', 'MC2.7', '更软切换话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101009', 'MC1.9', '呼叫建立成功率-PS(%)', 'CASE WHEN sum(DATACALLATT3G)=0 THEN 0 WHEN sum(ESTDATACALLS3G)>=sum(DATACALLATT3G) THEN 99.99 ELSE ROUND(sum(ESTDATACALLS3G)/sum(DATACALLATT3G) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101017', 'MC2.8', '软切换比例-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101023', 'MC2.14', '软切换比例-PS(%)', 'CASE WHEN SUM(TRAFFIC_PS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_PS)-SUM(TRAFFIC_PS))/SUM(TRAFFIC_PS) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101084', 'MC5.10', '软切换请求次数-CS', 'sum(VOICECALLSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101077', 'MC5.3', '切换成功率(%)', 'CASE WHEN (sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ))=0 THEN 0 ELSE ROUND((sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET))*100/(sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101031', 'MC3.8', '业务信道掉话率-PS(%)', 'CASE WHEN SUM(nvl(ESTDATACALLS3G,0))=0 THEN 0 WHEN sum(DATACALLSDROP)<=0 THEN 0.01 ELSE ROUND(sum(DATACALLSDROP)/SUM(nvl(ESTDATACALLS3G,0)) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101078', 'MC5.4', '切换请求次数-CS', 'sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101079', 'MC5.5', '切换成功次数-CS', 'sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101081', 'MC5.7', '硬切换请求次数-CS', 'sum(VOICECALLHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101085', 'MC5.11', '软切换成功次数-CS', 'sum(VOICECALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101140', 'MC7.1', '前向重传总帧数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101087', 'MC5.13', '更软切换请求次数-CS', 'sum(VOICECALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101045', 'MC4.13', '业务信道分配失败次数(含切)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081058', 'MC4.26', '业务信道拥塞率-软切换CS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_CS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_CS)-SUM(TCH_ASSIGN_SUC_SHO_CS))/SUM(TCH_ASSIGN_ATT_SHO_CS) * 100, 2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081059', 'MC4.27', '业务信道分配请求次数(含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101152', 'MC8.3', 'C1.21双载频基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101088', 'MC5.14', '更软切换成功次数-CS', 'sum(VOICECALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101047', 'MC4.15', '业务信道分配请求次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101049', 'MC4.17', '业务信道分配失败次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101050', 'MC4.18', '业务信道分配成功率(不含切)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ), 4)*100 END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101090', 'MC5.16', '切换请求次数-PS', 'sum(DATACALLHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101091', 'MC5.17', '切换成功次数-PS', 'sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101092', 'MC5.18', '切换成功率-PS(%)', 'CASE WHEN sum(DATACALLHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLHOCOMPLET)/sum(DATACALLHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101093', 'MC5.19', '硬切换请求次数-PS', 'sum(DATACALLHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101094', 'MC5.20', '硬切换成功次数-PS', 'sum(DATACALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101095', 'MC5.21', '硬切换成功率-PS(%)', 'CASE WHEN sum(DATACALLHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLHARDHOCOMPLET)/sum(DATACALLHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101096', 'MC5.22', '软切换请求次数-PS', 'sum(DATACALLSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101097', 'MC5.23', '软切换成功次数-PS', 'sum(DATACALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101098', 'MC5.24', '软切换成功率-PS(%)', 'CASE WHEN sum(DATACALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLSOFTHOCOMPLET)/sum(DATACALLSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101101', 'MC5.27', '更软切换成功率-PS(%)', 'CASE WHEN SUM(DATACALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND(SUM(DATACALLSOFTERHOCOMPLET)/SUM(DATACALLSOFTERHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101108', 'MC5.34', 'BS内硬切换请求次数', 'sum(THEINTERMSCHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101109', 'MC5.35', 'BS内硬切换成功次数', 'sum(THEINTERMSCHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101110', 'MC5.36', 'BS内硬切换成功率(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(THEINTERMSCHARDHOCOMPLET)/sum(THEINTERMSCHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101113', 'MC5.39', 'BS内软切换成功率(%)', 'CASE WHEN SUM(THEINTRAMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND(SUM(THEINTRAMSCSOFTHOCOMPLET)/SUM(THEINTRAMSCSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101116', 'MC5.42', 'BS内更软切换成功率(%)', 'CASE WHEN (SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ))=0 THEN 0 ELSE ROUND((SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET))/(SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101117', 'MC5.43', 'BS间硬切换请求次数', 'sum(THEINTERMSCHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101118', 'MC5.44', 'BS间硬切换成功次数', 'sum(THEINTERMSCHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101119', 'MC5.45', 'BS间硬切换成功率(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(THEINTERMSCHARDHOCOMPLET)/sum(THEINTERMSCHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101122', 'MC5.48', 'BS间软切换成功率(%)', 'CASE WHEN SUM(THEINTERMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND(SUM(THEINTERMSCSOFTHOCOMPLET)/SUM(THEINTERMSCSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101123', 'MC6.1', '第一载频(283)基站数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101124', 'MC6.2', '第二载频(201)基站数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101125', 'MC6.3', '第三载频(242)基站数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101126', 'MC6.4', '第四载频(160)基站数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101127', 'MC6.5', '1X载频总数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101128', 'MC6.6', '信道配置总数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101129', 'MC6.7', '信道可用数', 'SUM(CH_RLB_NUM)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101131', 'MC6.9', '信道最大占用率(%)', 'CASE WHEN SUM(CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(CH_MAX_NUM)/SUM(CH_RLB_NUM)*100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101178', 'MC10.1', 'C10.1信道单元可用数', 'SUM(CH_RLB_NUM)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101132', 'MC6.10', '前向信道配置总数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101083', 'MC5.9', '硬切换成功率-CS(%)', 'CASE WHEN sum(VOICECALLHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLHARDHOCOMPLET)*100/sum(VOICECALLHARDHOREQ),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810046', 'MD2.24', 'D2.24 无线连接平均建立时长', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810047', 'MD2.25', 'D2.25 无线连接平均占用时长', 'CASE WHEN (SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN))=0 THEN 0 ELSE ROUND(SUM(DO_CONNECT_TIME) / (SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN)) * 100, 2) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101043', 'MC4.11', '业务信道分配请求次数(含切)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101044', 'MC4.12', '业务信道分配成功次数(含切)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101032', 'MC3.9', '话务掉话比-PS', 'CASE WHEN sum(DATACALLSDROP)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/sum(DATACALLSDROP),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101046', 'MC4.14', '业务信道分配成功率(含切)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC)*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101051', 'MC4.19', '业务信道拥塞次数-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101052', 'MC4.20', '业务信道拥塞率-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810074', 'MD4.5', 'D4.5 AT 发起的Dormant态到Active态激活请求次数', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101075', 'MC5.1', '切换请求次数', 'sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', '时间戳', '''{0}''', 'ZY0000', '', '1', 'MSC数据', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '外部网元标识', '''外部网元标识''', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', '省份名称', '''{1}''', 'ZY0000', '', '1', 'MSC数据', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '城市列表', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '软件版本', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '硬件版本', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '设备名称', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '设备中文名称', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '规格型号', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '机房位置', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', 'MSCID', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', 'NID', ' ', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', 'IP地址', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '信令点编码', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '配置信令链路数', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '配置中继数', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', '目前管辖BSC数', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', '备注', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', '预留字段1', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', '预留字段2', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', '预留字段3', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', '预留字段4', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', '预留字段5', '', 'ZY0000', '', '1', 'MSC数据', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101082', 'MC5.8', '硬切换成功次数-CS', 'sum(VOICECALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101080', 'MC5.6', '切换成功率-CS(%)', 'CASE WHEN (sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ))=0 THEN 0 ELSE ROUND((sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET))*100/(sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101086', 'MC5.12', '软切换成功率-CS(%)', 'CASE WHEN sum(VOICECALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLSOFTHOCOMPLET)*100/sum(VOICECALLSOFTHOREQ),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101089', 'MC5.15', '更软切换成功率-CS(%)', 'CASE WHEN sum(VOICECALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLSOFTERHOCOMPLET)*100/sum(VOICECALLSOFTERHOREQ),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810076', 'MD4.7', 'D4.7 AT发起的Dormant 态到Active 态激活失败次数', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810078', 'MD4.9', 'D4.9 AN发起的Dormant到Active态的激活请求次数', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810079', 'MD4.10', 'D4.10 AN发起的Dormant到Active态的激活成功次数', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810080', 'MD4.11', 'D4.11 AN发起的Dormant态到Active态的激活失败次数', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810081', 'MD5.1', 'D5.1 等效用户数', 'SUM(EQU_USER_NUM_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810082', 'MD5.2', 'D5.2 呼叫话务量', 'SUM(TCH_OCC)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810138', 'MD10.4', '前向重传字节数', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810141', 'MD10.7', '反向接收的字节数', 'SUM(RTCH_RLP_TX_DO)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101074', 'MC4.42', '业务信道拥塞率-软切换PS(%)', 'CASE WHEN SUM(DATACALLSOFTERHOREQ) + SUM(DATACALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(((SUM(DATACALLSOFTERHOREQ)+SUM(DATACALLSOFTHOREQ))-(SUM(DATACALLSOFTERHOCOMPLET) + SUM(DATACALLSOFTHOCOMPLET)))/(SUM(DATACALLSOFTERHOREQ) + SUM(DATACALLSOFTHOREQ))*100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810148', 'MD10.14', '前向业务信道物理层发送的bit数', 'SUM(FTCH_PHY_TX_BIT_DO)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101142', 'MC7.3', 'RLP在前向信道中发送的数据量-不含重传(KB)', 'SUM(FTCH_RLP_TX_1X)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002047', 'ID47', 'D2.25 无线连接平均占用时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101147', 'MC7.8', '反向传输总帧数-不包括重传', 'SUM(TOTALFRAMESTRANSRESERVETRAFFIC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101148', 'MC7.9', 'RLP在反向信道中接收的数据量(KB)', 'SUM(RTCH_RLP_TX_1X)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101018', 'MC2.9', '业务信道话务量(含切)-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101019', 'MC2.10', '业务信道话务量(不含切)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101020', 'MC2.11', 'Walsh码话务量-PS(Erl)', 'SUM(WALSHCODE_ERL_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101021', 'MC2.12', '软切换话务量-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)-SUM(TRAFFIC_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101034', 'MC4.2', '业务信道分配成功次数(含切)', 'SUM(TCH_SETUP_SUC)+SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101036', 'MC4.4', '业务信道分配成功率(含切)(%)', 'CASE WHEN SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS))/(SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101037', 'MC4.5', '业务信道分配请求次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101053', 'MC4.21', '业务信道分配请求次数-硬切换-CS', 'SUM(VOICECALLHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101056', 'MC4.24', '业务信道分配请求次数-软切换-CS', 'SUM(TCH_SETUP_ATT)-SUM(TCH_ASSIGN_ATT_NUM)-SUM(BSS_HHO_ATT)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101057', 'MC4.25', '业务信道分配成功次数-软切换-CS', 'SUM(TCH_SETUP_SUC)-SUM(TCH_ASSIGN_SUC)-SUM(BSS_HHO_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101059', 'MC4.27', '业务信道分配请求次数(含切)-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101060', 'MC4.28', '业务信道分配成功次数(含切)-PS', 'SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101062', 'MC4.30', '业务信道分配成功率(含切)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_HO_PS) / SUM(TCH_ASSIGN_ATT_HO_PS) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101063', 'MC4.31', '业务信道分配请求次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101065', 'MC4.33', '业务信道分配失败次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101067', 'MC4.35', '业务信道拥塞次数-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101069', 'MC4.37', '业务信道分配请求次数-硬切换-PS', 'SUM(DATACALLHARDHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101039', 'MC4.7', '业务信道分配失败次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101040', 'MC4.8', '业务信道分配成功率(不含切)(%)', 'CASE WHEN SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND((SUM(nvl(CALL_SETUP_SUCC_CS, 0))+SUM(nvl(ESTDATACALLS3G, 0)))/(SUM(O_TCH_ASSIGN_ATT) + SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101103', 'MC5.29', 'BS内切换成功次数', 'sum(THEINTERMSCHARDHOCOMPLET)+SUM(THEINTRAMSCSOFTHOCOMPLET)+SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101104', 'MC5.30', 'BS内切换成功率(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ) + SUM(THEINTRAMSCSOFTHOREQ)+SUM(VOICECALLSOFTERHOREQ) + SUM(DATACALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND((sum(THEINTERMSCHARDHOCOMPLET) + SUM(THEINTRAMSCSOFTHOCOMPLET) +SUM(VOICECALLSOFTERHOCOMPLET) + SUM(DATACALLSOFTERHOCOMPLET)) /(sum(THEINTERMSCHARDHOREQ) + SUM(THEINTRAMSCSOFTHOREQ) +SUM(VOICECALLSOFTERHOREQ) + SUM(DATACALLSOFTERHOREQ)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101106', 'MC5.32', 'BS间切换成功次数', 'sum(THEINTERMSCHARDHOCOMPLET)+SUM(THEINTERMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101107', 'MC5.33', 'BS间切换成功率(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ) + SUM(THEINTERMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND((sum(THEINTERMSCHARDHOCOMPLET) + SUM(THEINTERMSCSOFTHOCOMPLET))/(sum(THEINTERMSCHARDHOREQ) + SUM(THEINTERMSCSOFTHOREQ)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101115', 'MC5.41', 'BS内更软切换成功次数', 'SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101070', 'MC4.38', '业务信道分配成功次数-硬切换-PS', 'SUM(DATACALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002048', 'ID48', 'D2.26 DRC 前向速率为﹝小于307.2K﹞的申请比率', 'ID145/(ID145+ID146+ID147)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810075', 'MD4.6', 'D4.6 AT 发起的Dormant态到Active态激活成功次数', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002049', 'ID49', 'D2.27 DRC 前向速率为﹝307.2K ～1228K﹞的申请比率', 'ID146/(ID145+ID146+ID147)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002050', 'ID50', 'D2.28 DRC 前向速率为﹝大于1228K﹞的申请比率', 'ID147/(ID145+ID146+ID147)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002051', 'ID51', 'D3.1 UATI分配成功率', 'ID53/ID52', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101073', 'MC4.41', '业务信道分配成功次数-软切换-PS', 'SUM(DATACALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002052', 'ID52', 'D3.2 UATI请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101099', 'MC5.25', '更软切换请求次数-PS', 'SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002053', 'ID53', 'D3.3 UATI分配成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002054', 'ID54', 'D3.4 UATI分配失败次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101100', 'MC5.26', '更软切换成功次数-PS', 'SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002055', 'ID55', 'D3.5 UATI平均建立时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002056', 'ID56', 'D3.6 Session接入鉴权成功率', 'ID57/ID58', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002057', 'ID57', 'D3.7 Session接入鉴权成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002058', 'ID58', 'D3.8 Session接入鉴权请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002059', 'ID59', 'D3.9 Session接入鉴权拒绝次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002060', 'ID60', 'D3.10 Session接入鉴权失败次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002061', 'ID61', 'D3.11 Session协商成功率', 'ID62/ID62+ID63', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002062', 'ID62', 'D3.12 Session协商成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002063', 'ID63', 'D3.13 Session协商失败次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002064', 'ID64', 'D3.14 Session跨AN Dormant切换成功率(%)', 'ID66/ID65', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002065', 'ID65', 'D3.15 Session跨AN Dormant切换次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002066', 'ID66', 'D3.16 Session跨AN Dormant切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002067', 'ID67', 'D3.17 Session会话数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002068', 'ID68', 'D3.18 Active态Session会话数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002069', 'ID69', 'D3.19 非Active态Session会话数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002070', 'ID70', 'D4.1 用户从Dormant态到Active态的激活成功率', 'ID72/ID71', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002071', 'ID71', 'D4.2 用户从Dormant态到Active态的激活请求总次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002072', 'ID72', 'D4.3 用户从Dormant态到Active态的激活成功总次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002073', 'ID73', 'D4.4 AT 发起的Dormant态到Active态的激活成功率', 'ID75/ID74', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002074', 'ID74', 'D4.5 AT 发起的Dormant态到Active态激活请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002075', 'ID75', 'D4.6 AT 发起的Dormant态到Active态激活成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002076', 'ID76', 'D4.7 AT发起的Dormant 态到Active 态激活失败次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101102', 'MC5.28', 'BS内切换请求次数', 'sum(THEINTERMSCHARDHOREQ)+SUM(THEINTRAMSCSOFTHOREQ)+SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002077', 'ID77', 'D4.8 AN发起的Dormant态到Active态激活成功率', 'ID79/ID78', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002078', 'ID78', 'D4.9 AN发起的Dormant到Active态的激活请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002079', 'ID79', 'D4.10 AN发起的Dormant到Active态的激活成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002080', 'ID80', 'D4.11 AN发起的Dormant态到Active态的激活失败次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002081', 'ID81', 'D5.1 等效用户数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002082', 'ID82', 'D5.2 呼叫话务量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002083', 'ID83', 'D5.3 CE话务量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002084', 'ID84', 'D5.4 软切换话务量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002085', 'ID85', 'D5.5 软切换因子', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002086', 'ID86', 'D6.1 PCF反向数据流量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101105', 'MC5.31', 'BS间切换请求次数', 'sum(THEINTERMSCHARDHOREQ)+SUM(THEINTERMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002087', 'ID87', 'D6.2 PCF前向数据流量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101111', 'MC5.37', 'BS内软切换请求次数', 'SUM(THEINTRAMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101112', 'MC5.38', 'BS内软切换成功次数', 'SUM(THEINTRAMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002088', 'ID88', 'D6.3 PCF接收的反向分组业务的总包数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002089', 'ID89', 'D6.4 PCF接收的前向分组数据的总包数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002090', 'ID90', 'D6.5 反向分组业务在PCF丢弃的包数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002091', 'ID91', 'D6.6 前向分组业务在PCF丢弃的包数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002092', 'ID92', 'D6.7 PCF反向分组丢包率', 'ID90/ID88', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002093', 'ID93', 'D6.8 PCF前向分组丢包率', 'ID91/ID89', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002094', 'ID94', 'D6.9 前向RLP数据吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002095', 'ID95', 'D6.10 前向RLP重传率', 'ID138/ID139', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002096', 'ID96', 'D6.11 反向RLP数据吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002097', 'ID97', 'D6.12 反向RLP重传率', 'ID140/ID141', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002098', 'ID98', 'D6.13 前向业务信道物理层平均吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002099', 'ID99', 'D6.14 前向业务信道物理层突发吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002100', 'ID100', 'D6.15 反向业务信道物理层平均吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002101', 'ID101', 'D6.16 反向业务信道物理层突发吞吐量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002102', 'ID102', 'D6.17 前向物理层业务信道时隙占用率', 'ID149/3600', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002103', 'ID103', 'D6.18 前向物理层控制信道时隙占用率', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002104', 'ID104', 'D6.19 反向接入信道时隙占用率', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002105', 'ID105', 'D6.20 反向链路繁忙率', 'ID142/(ID142+ID143)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002106', 'ID106', 'D7.1 全局软切换成功率', 'ID108/ID107', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002107', 'ID107', 'D7.2 全局软切换请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002108', 'ID108', 'D7.3 全局软切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002109', 'ID109', 'D7.4 AN内软切换成功率', 'ID111/ID110', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002110', 'ID110', 'D7.5 AN内软切换请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002111', 'ID111', 'D7.6 AN内软切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002112', 'ID112', 'D7.7 AN间软切换成功率', 'ID114/ID113', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002113', 'ID113', 'D7.8 AN间软切换请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002114', 'ID114', 'D7.9 AN间软切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002115', 'ID115', 'D7.10 AN内硬切换成功率', 'ID117/ID116', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002116', 'ID116', 'D7.11 AN内硬切换请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002117', 'ID117', 'D7.12 AN内硬切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002118', 'ID118', 'D7.13 AN间硬切换成功率', 'ID120/ID119', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002119', 'ID119', 'D7.14 AN间硬切换请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002120', 'ID120', 'D7.15 AN间硬切换成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002121', 'ID121', 'D8.1 寻呼响应率', 'ID123/ID122', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002122', 'ID122', 'D8.2 寻呼请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002123', 'ID123', 'D8.3 寻呼响应总次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101114', 'MC5.40', 'BS内更软切换请求次数', 'SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101120', 'MC5.46', 'BS间软切换请求次数', 'SUM(THEINTERMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101121', 'MC5.47', 'BS间软切换成功次数', 'SUM(THEINTERMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101130', 'MC6.8', '信道最大占用数', 'SUM(CH_MAX_NUM)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101076', 'MC5.2', '切换成功次数', 'sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810070', 'MD4.1', 'D4.1 用户从Dormant态到Active态的激活成功率', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO))/(SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO))*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101041', 'MC4.9', '业务信道拥塞次数', 'SUM(TCH_BLOCK_COUNT)+SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101042', 'MC4.10', '业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) + SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT)+SUM(TCH_ASSIGN_ATT_HO_PS) -SUM(TCH_ASSIGN_SUC_HO_PS))/(SUM(TCH_SETUP_ATT) + SUM(TCH_ASSIGN_ATT_HO_PS)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101022', 'MC2.13', '更软切换话务量-PS(Erl)', 'SUM(WALSHCODE_ERL_PS)-SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001091', 'ID91', '切换成功次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001092', 'ID92', '切换成功率-PS(%)', 'ID91/ID90', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001093', 'ID93', '硬切换请求次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001094', 'ID94', '硬切换成功次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001095', 'ID95', '硬切换成功率-PS(%)', 'ID94/ID93', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001096', 'ID96', '软切换请求次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001097', 'ID97', '软切换成功次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001098', 'ID98', '软切换成功率-PS(%)', 'ID97/ID96', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001099', 'ID99', '更软切换请求次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001100', 'ID100', '更软切换成功次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001101', 'ID101', '更软切换成功率-PS(%)', 'ID100/ID99', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001102', 'ID102', 'BS内切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001103', 'ID103', 'BS内切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001104', 'ID104', 'BS内切换成功率(%)', 'ID103/ID102', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001105', 'ID105', 'BS间切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001106', 'ID106', 'BS间切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001107', 'ID107', 'BS间切换成功率(%)', 'ID106/ID105', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001108', 'ID108', 'BS内硬切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001109', 'ID109', 'BS内硬切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001110', 'ID110', 'BS内硬切换成功率(%)', 'ID109/ID108', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001111', 'ID111', 'BS内软切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001112', 'ID112', 'BS内软切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001113', 'ID113', 'BS内软切换成功率(%)', 'ID112/ID111', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001114', 'ID114', 'BS内更软切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001115', 'ID115', 'BS内更软切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001116', 'ID116', 'BS内更软切换成功率(%)', 'ID115/ID114', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001117', 'ID117', 'BS间硬切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001118', 'ID118', 'BS间硬切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001119', 'ID119', 'BS间硬切换成功率(%)', 'ID118/ID117', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001120', 'ID120', 'BS间软切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001121', 'ID121', 'BS间软切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001122', 'ID122', 'BS间软切换成功率(%)', 'ID121/ID120', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001123', 'ID123', '第一载频(283)基站数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001124', 'ID124', '第二载频(201)基站数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001125', 'ID125', '第三载频(242)基站数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001126', 'ID126', '第四载频(160)基站数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001127', 'ID127', '1X载频总数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001128', 'ID128', '信道配置总数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001129', 'ID129', '信道可用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001130', 'ID130', '信道最大占用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001131', 'ID131', '信道最大占用率(%)', 'ID130/ID129', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001132', 'ID132', '前向信道配置总数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001133', 'ID133', '前向信道可用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001134', 'ID134', '前向信道最大占用数', '', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001135', 'ID135', '前向信道最大占用率(%)', '0', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001136', 'ID136', '反向信道配置总数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001137', 'ID137', '反向信道可用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001138', 'ID138', '反向信道最大占用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001139', 'ID139', '反向信道最大占用率(%)', '0', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001140', 'ID140', '前向重传总帧数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001141', 'ID141', '前向传输总帧数-不包括重传', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001142', 'ID142', 'RLP在前向信道中发送的数据量-不含重传(KB)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001143', 'ID143', 'RLP在前向信道中重传的数据量(字节)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001144', 'ID144', 'RLP前向丢弃数据量(字节)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001145', 'ID145', '前向信道重传率(%)', '0', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001146', 'ID146', '反向重传总帧数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001147', 'ID147', '反向传输总帧数-不包括重传', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001148', 'ID148', 'RLP在反向信道中接收的数据量(KB)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001149', 'ID149', '反向信道重传率(%)', 'ID146/ID147', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001150', 'ID150', 'C1.19基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001151', 'ID151', 'C1.20单载频基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001152', 'ID152', 'C1.21双载频基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001153', 'ID153', 'C1.22三载频基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001154', 'ID154', 'C1.23四载频基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001155', 'ID155', 'C1.24小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001156', 'ID156', 'C1.25单载频小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001157', 'ID157', 'C1.26双载频小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001158', 'ID158', 'C1.27三载频小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001159', 'ID159', 'C1.28四载频小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001160', 'ID160', 'C1.31信道单元配置数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001161', 'ID161', 'C1.32无线容量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001162', 'ID162', 'C1.33业务信道配置数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001163', 'ID163', 'C3.1业务信道负载率(%)', 'ID180/ID161', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001164', 'ID164', 'C3.2软切换因子(%)', '(ID180-ID181)/ID181', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001165', 'ID165', 'C3.3信道单元可用率(%)', 'ID178/ID160', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001166', 'ID166', 'C3.4业务信道拥塞率(%)', 'ID179/ID199', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001167', 'ID167', 'C3.5超忙小区比例(%)', 'ID187/ID155', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001168', 'ID168', 'C3.6忙小区比例(%)', 'ID188/ID155', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001169', 'ID169', 'C3.7超闲小区比例(%)', 'ID189/ID155', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001170', 'ID170', 'C3.8严重溢出基站比例(%)', 'ID191/ID150', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001171', 'ID171', 'C3.9溢出基站比例(%)', 'ID192/ID150', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001172', 'ID172', 'C6.2基站系统硬切换成功率(%)', 'ID202/ID201', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001173', 'ID173', 'C6.3系统软切换成功率(%)', 'ID204/ID203', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001174', 'ID174', 'C6.4业务信道掉话率(%)', 'ID205/(ID194+ID196)', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001175', 'ID175', 'C6.5通话中断率(%)', 'ID205/ID197', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001176', 'ID176', 'C6.6平均掉话间隔', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001177', 'ID177', 'C6.7坏小区比例(%)', 'ID190/ID155', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001178', 'ID178', 'C10.1信道单元可用数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001179', 'ID179', 'C10.2业务信道拥塞次数(含切换)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001180', 'ID180', 'C10.3业务信道承载的话务量(含切换)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001181', 'ID181', 'C10.4业务信道承载的话务量(不含切换)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001182', 'ID182', 'C10.5WALSH码承载话务量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001183', 'ID183', 'C10.6第一载频(283)话务量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001184', 'ID184', 'C10.7第二载频(201)话务量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001185', 'ID185', 'C10.8第三载频(242)话务量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001186', 'ID186', 'C10.9第四载频(160)话务量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001187', 'ID187', 'C10.10超忙小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001188', 'ID188', 'C10.11忙小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001189', 'ID189', 'C10.12超闲小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001190', 'ID190', 'C11.17坏小区数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001191', 'ID191', 'C10.13严重溢出基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001192', 'ID192', 'C10.14溢出基站数量', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001193', 'ID193', 'C11.4主叫业务信道分配请求次数(不含切换不含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001194', 'ID194', 'C11.5主叫业务信道分配成功次数(不含切换不含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001195', 'ID195', 'C11.6被叫业务信道分配请求次数(不含切换不含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001196', 'ID196', 'C11.7被叫业务信道分配成功次数(不含切换不含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001197', 'ID197', 'C11.8业务信道分配请求次数(不含切换含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001198', 'ID198', 'C11.9业务信道分配成功次数(不含切换含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001199', 'ID199', 'C11.10业务信道分配请求次数(含切换含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001200', 'ID200', 'C11.11业务信道分配成功次数(含切换含短信)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001201', 'ID201', 'C11.12基站系统硬切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001202', 'ID202', 'C11.13基站系统硬切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001203', 'ID203', 'C11.14系统软切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001204', 'ID204', 'C11.15系统软切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001205', 'ID205', 'C11.16业务信道掉话次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001206', 'ID206', 'C11.18呼叫尝试总次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001207', 'ID207', '预留字段1', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001208', 'ID208', '预留字段2', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001209', 'ID209', '预留字段3', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001210', 'ID210', '预留字段4', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001211', 'ID211', '预留字段5', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042018', 'MD1.18', 'D1.18 A-Bis接口带宽平均利用率', '[MD1.20] / [MD10.19]', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042019', 'MD1.19', 'D1.19 A-Bis接口配置的端口带宽', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042020', 'MD1.20', 'D1.20 A-Bis接口平均占用带宽', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042021', 'MD1.21', 'D1.21 超忙基站数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042022', 'MD1.22', 'D1.22 超闲基站数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041030', 'MC3.7', '业务信道掉话次数-PS', 'SUM(DATE_DROP_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042024', 'MD2.2', 'D2.2 AT发起的连接成功率', 'CASE WHEN SUM(nvl(AT_CONN_ATT_DO,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AT_CONN_SUC_DO,0))/SUM(nvl(AT_CONN_ATT_DO,0))*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042025', 'MD2.3', 'D2.3 AN发起的连接成功率', 'CASE WHEN SUM(nvl(AN_CONN_ATT_DO,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AN_CONN_SUC_DO,0))/SUM(nvl(AN_CONN_ATT_DO,0))*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041064', 'MC4.32', '业务信道分配成功次数(不含切)-PS', 'SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042030', 'MD2.8', 'D2.8 无线网络连接成功率（含A8、A10 接口）', '[MD2.9] / [MD2.10] * 100', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042031', 'MD2.9', 'D2.9 无线网络连接成功次数（含A8、A10 接口）', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042032', 'MD2.10', 'D2.10 无线网络连接请求次数（含A8、A10 接口）', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042033', 'MD2.11', 'D2.11 用户早释率', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042034', 'MD2.12', 'D2.12 用户早释次数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041025', 'MC3.2', '业务信道掉话率(%)', 'CASE WHEN (SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(DATA_SRLSNUM_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATE_DROP_NUM,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATE_DROP_NUM,0)))/(SUM(TCH_ASSIGN_SUC) + SUM(DATA_SRLSNUM_PS)),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041074', 'MC4.42', '业务信道拥塞率-软切换PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_PS)-SUM(TCH_ASSIGN_SUC_SHO_PS))/SUM(TCH_ASSIGN_ATT_SHO_PS) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041090', 'MC5.16', '切换请求次数-PS', 'SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041091', 'MC5.17', '切换成功次数-PS', 'SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041092', 'MC5.18', '切换成功率-PS(%)', 'CASE WHEN SUM(DATE_HO_ATT_NUM)=0 THEN 0 ELSE ROUND(SUM(DATA_HO_SUCC_NUM)/SUM(DATE_HO_ATT_NUM) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041095', 'MC5.21', '硬切换成功率-PS(%)', 'CASE WHEN SUM(HHO_ATT_NUM_PS)=0 THEN 0 ELSE ROUND(SUM(HHO_SUC_NUM_PS)/SUM(HHO_ATT_NUM_PS) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041098', 'MC5.24', '软切换成功率-PS(%)', 'CASE WHEN SUM(SHO_ATT_NUM_PS)=0 THEN 0 ELSE ROUND(SUM(SHO_SUC_NUM_PS)/SUM(SHO_ATT_NUM_PS) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041104', 'MC5.30', 'BS内切换成功率(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INNER_BSC_SOFTERHO_SUCC))/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041142', 'MC7.3', 'RLP在前向信道中发送的数据量-不含重传(KB)', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041143', 'MC7.4', 'RLP在前向信道中重传的数据量(字节)', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041144', 'MC7.5', 'RLP前向丢弃数据量(字节)', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041145', 'MC7.6', '前向信道重传率(%)', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101026', 'MC3.3', '话务掉话比', 'CASE WHEN (SUM(TCH_DROP_NUM) + sum(DATACALLSDROP))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + sum(DATACALLSDROP)),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101029', 'MC3.6', '话务掉话比-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810152', 'MC12.1', '预留字段1', '', 'ZY0810', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810153', 'MC12.2', '预留字段2', '', 'ZY0810', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810154', 'MC12.3', '预留字段3', '', 'ZY0810', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810155', 'MC12.4', '预留字段4', '', 'ZY0810', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810156', 'MC12.5', '预留字段5', '', 'ZY0810', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101207', 'MC12.1', '预留字段1', '', 'ZY0810', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101208', 'MC12.2', '预留字段2', '', 'ZY0810', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101209', 'MC12.3', '预留字段3', '', 'ZY0810', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101210', 'MC12.4', '预留字段4', '', 'ZY0810', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101211', 'MC12.5', '预留字段5', '', 'ZY0810', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810062', 'MD3.12', 'D3.12 Session协商成功次数', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810063', 'MD3.13', 'D3.13 Session协商失败次数', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101033', 'MC4.1', '业务信道分配请求次数(含切)', 'SUM(TCH_SETUP_ATT)+SUM(TCH_ASSIGN_ATT_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101055', 'MC4.23', '业务信道拥塞率-硬切换CS(%)', 'CASE WHEN SUM(VOICECALLHARDHOREQ)=0 THEN 0 ELSE ROUND((SUM(VOICECALLHARDHOREQ)-SUM(VOICECALLHARDHOCOMPLET))/SUM(VOICECALLHARDHOREQ) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101058', 'MC4.26', '业务信道拥塞率-软切换CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(((SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)) -(SUM(TCH_SETUP_SUC) - SUM(TCH_ASSIGN_SUC) - SUM(BSS_HHO_SUC))) /(SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101061', 'MC4.29', '业务信道分配失败次数(含切)-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101054', 'MC4.22', '业务信道分配成功次数-硬切换-CS', 'SUM(VOICECALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101035', 'MC4.3', '业务信道分配失败次数(含切)', '(SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC))+(SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101066', 'MC4.34', '业务信道分配成功率(不含切)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(nvl(ESTDATACALLS3G, 0)) / SUM(TCH_ASSIGN_ATT_PS) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101068', 'MC4.36', '业务信道拥塞率-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS))/SUM(TCH_ASSIGN_ATT_HO_PS) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101071', 'MC4.39', '业务信道拥塞率-硬切换PS(%)', 'CASE WHEN SUM(DATACALLHARDHOREQ)=0 THEN 0 ELSE ROUND((SUM(DATACALLHARDHOREQ)-SUM(DATACALLHARDHOCOMPLET))/SUM(DATACALLHARDHOREQ) * 100,4) END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101072', 'MC4.40', '业务信道分配请求次数-软切换-PS', 'SUM(DATACALLSOFTERHOREQ)+SUM(DATACALLSOFTHOREQ)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810008', 'MD1.8', 'D1.8 反向CE最大忙数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810009', 'MD1.9', 'D1.9 反向CE可用数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810010', 'MD1.10', 'D1.10 前向业务MacIndex最高利用率', '[MD1.11] / [MD10.10] * 100 ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810011', 'MD1.11', 'D1.11 前向业务MacIndex最大忙数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810012', 'MD1.12', 'D1.12 PCF数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810013', 'MD1.13', 'D1.13 PCF主处理器平均负荷', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042017', 'MD1.17', 'D1.17 PCF配置的下行最大吞吐率', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810015', 'MD1.15', 'D1.15 PCF内最大可同时支持的激活的HRPD会话数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041149', 'MC7.10', '反向信道重传率(%)', 'CASE WHEN SUM(TX_FRM_NUM_REV_1X)=0 THEN 0 ELSE ROUND(SUM(RETX_FRM_NUM_REV_1X)/SUM(TX_FRM_NUM_REV_1X) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810016', 'MD1.16', 'D1.16 PCF配置的上行最大吞吐率', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810017', 'MD1.17', 'D1.17 PCF配置的下行最大吞吐率', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041150', 'MC8.1', 'C1.19基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041163', 'MC9.1', 'C3.1业务信道负载率(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041165', 'MC9.3', 'C3.3信道单元可用率(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810018', 'MD1.18', 'D1.18 A-Bis接口带宽平均利用率', '[MD1.20] / [MD10.19]', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041166', 'MC9.4', 'C3.4业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041167', 'MC9.5', 'C3.5超忙小区比例(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810019', 'MD1.19', 'D1.19 A-Bis接口配置的端口带宽', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810020', 'MD1.20', 'D1.20 A-Bis接口平均占用带宽', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810021', 'MD1.21', 'D1.21 超忙基站数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810022', 'MD1.22', 'D1.22 超闲基站数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810024', 'MD2.2', 'D2.2 AT发起的连接成功率', 'CASE WHEN SUM(nvl(AT_INIT_ATT_CONN,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))/SUM(nvl(AT_INIT_ATT_CONN,0))*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041168', 'MC9.6', 'C3.6忙小区比例(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810025', 'MD2.3', 'D2.3 AN发起的连接成功率', 'DECODE(SUM(AN_INIT_ATT_CONN),0,0,ROUND(SUM(AN_INIT_ESTABLISHED_CONN)/SUM(AN_INIT_ATT_CONN),4)*100)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810030', 'MD2.8', 'D2.8 无线网络连接成功率（含A8、A10 接口）', '[MD2.9] / [MD2.10] * 100', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810031', 'MD2.9', 'D2.9 无线网络连接成功次数（含A8、A10 接口）', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810032', 'MD2.10', 'D2.10 无线网络连接请求次数（含A8、A10 接口）', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041169', 'MC9.7', 'C3.7超闲小区比例(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041170', 'MC9.8', 'C3.8严重溢出基站比例(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810033', 'MD2.11', 'D2.11 用户早释率', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810034', 'MD2.12', 'D2.12 用户早释次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810035', 'MD2.13', 'D2.13 无线连接建立失败次数（原因为分配资源失败）', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810036', 'MD2.14', 'D2.14 无线连接建立失败次数（原因为反向业务信道俘获失败）', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810037', 'MD2.15', 'D2.15 无线连接建立失败次数（原因为没有收到TCC 消息）', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810039', 'MD2.17', 'D2.17 无线连接释放次数(不含PDSN 要求释放次数)', '[MD2.16] - [MD2.18]', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041171', 'MC9.9', 'C3.9溢出基站比例(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041172', 'MC9.10', 'C6.2基站系统硬切换成功率(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810040', 'MD2.18', 'D2.18 PDSN原因要求释放次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810045', 'MD2.23', 'D2.23 网络掉线率', 'CASE WHEN (SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))=0 THEN 0 ELSE ROUND((SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))/(SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100,2) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810048', 'MD2.26', 'D2.26 DRC 前向速率为﹝小于307.2K﹞的申请比率', '[MD10.11] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810049', 'MD2.27', 'D2.27 DRC 前向速率为﹝307.2K ～1228K﹞的申请比率', '[MD10.12] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041173', 'MC9.11', 'C6.3系统软切换成功率(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041174', 'MC9.12', 'C6.4业务信道掉话率(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810050', 'MD2.28', 'D2.28 DRC 前向速率为﹝大于1228K﹞的申请比率', '[MD10.13] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810054', 'MD3.4', 'D3.4 UATI分配失败次数', 'SUM(nvl(UATI_ATT_NUM,0))-SUM(nvl(UATI_SUC_NUM,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810055', 'MD3.5', 'D3.5 UATI平均建立时长', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810056', 'MD3.6', 'D3.6 Session接入鉴权成功率', '[MD3.7] / [MD3.8] * 100', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810057', 'MD3.7', 'D3.7 Session接入鉴权成功次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810058', 'MD3.8', 'D3.8 Session接入鉴权请求次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810059', 'MD3.9', 'D3.9 Session接入鉴权拒绝次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810060', 'MD3.10', 'D3.10 Session接入鉴权失败次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810061', 'MD3.11', 'D3.11 Session协商成功率', 'CASE WHEN SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO)/(SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810004', 'MD1.4', 'D1.4 三载频基站数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810005', 'MD1.5', 'D1.5 四载频及以上基站数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810006', 'MD1.6', 'D1.6 载扇数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041175', 'MC9.13', 'C6.5通话中断率(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041176', 'MC9.14', 'C6.6平均掉话间隔', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810007', 'MD1.7', 'D1.7 反向CE最高利用率', '[MD1.8] / [MD1.9] * 100 ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810064', 'MD3.14', 'D3.14 Session跨AN Dormant切换成功率(%)', '[MD3.16] /  [MD3.15] * 100', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810065', 'MD3.15', 'D3.15 Session跨AN Dormant切换次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810066', 'MD3.16', 'D3.16 Session跨AN Dormant切换成功次数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810067', 'MD3.17', 'D3.17 Session会话数', '[MD3.18] + [MD3.19]', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810068', 'MD3.18', 'D3.18 Active态Session会话数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810069', 'MD3.19', 'D3.19 非Active态Session会话数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810071', 'MD4.2', 'D4.2 用户从Dormant态到Active态的激活请求总次数', 'SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810072', 'MD4.3', 'D4.3 用户从Dormant态到Active态的激活成功总次数', 'SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810073', 'MD4.4', 'D4.4 AT 发起的Dormant态到Active态的激活成功率', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO)/SUM(AT_DOR2ACT_ATT_DO)*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810077', 'MD4.8', 'D4.8 AN发起的Dormant态到Active态激活成功率', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND((SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO))/SUM(AN_DOR2ACT_ATT_DO)*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810084', 'MD5.4', 'D5.4 软切换话务量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810085', 'MD5.5', 'D5.5 软切换因子', '[MD5.4] / [MD5.2] ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810086', 'MD6.1', 'D6.1 PCF反向数据流量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810087', 'MD6.2', 'D6.2 PCF前向数据流量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810088', 'MD6.3', 'D6.3 PCF接收的反向分组业务的总包数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810089', 'MD6.4', 'D6.4 PCF接收的前向分组数据的总包数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810090', 'MD6.5', 'D6.5 反向分组业务在PCF丢弃的包数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810091', 'MD6.6', 'D6.6 前向分组业务在PCF丢弃的包数', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810092', 'MD6.7', 'D6.7 PCF反向分组丢包率', '[MD6.5] / [MD6.3] ', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810093', 'MD6.8', 'D6.8 PCF前向分组丢包率', '[MD6.6] / [MD6.4]', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810094', 'MD6.9', 'D6.9 前向RLP数据吞吐量', 'ROUND(SUM(FWD_RLP_DATA)*8/(1000*3600),4)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810095', 'MD6.10', 'D6.10 前向RLP重传率', 'CASE WHEN SUM(FWD_RLP_DATA)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO)/SUM(FWD_RLP_DATA)*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810096', 'MD6.11', 'D6.11 反向RLP数据吞吐量', 'ROUND(SUM(RLP_RXED_RTC)*8/(100*3600),4)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810097', 'MD6.12', 'D6.12 反向RLP重传率', 'CASE WHEN SUM(RTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(MISSING_RLP_REQ_RTC)/SUM(RTCH_RLP_TX_DO)*100,4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810099', 'MD6.14', 'D6.14 前向业务信道物理层突发吞吐量', 'CASE WHEN SUM(FWD_RLP_TOT_SLOT)=0 THEN 0 ELSE ROUND(SUM(FTCH_PHY_TX_BIT_DO)/1000/(SUM(FWD_RLP_TOT_SLOT)*0.001667),4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810101', 'MD6.16', 'D6.16 反向业务信道物理层突发吞吐量', 'CASE WHEN SUM(NUM_SUBPKTS_RL)=0 THEN 0 ELSE ROUND(SUM(REV_PHY_AVG_BYTE)*(8*1000)/(SUM(NUM_SUBPKTS_RL)* 0.00667),4) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810102', 'MD6.17', 'D6.17 前向物理层业务信道时隙占用率', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),3)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810103', 'MD6.18', 'D6.18 前向物理层控制信道时隙占用率', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810104', 'MD6.19', 'D6.19 反向接入信道时隙占用率', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810105', 'MD6.20', 'D6.20 反向链路繁忙率', '[MD10.8] / ([MD10.8] + [MD10.9]) * 100', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810109', 'MD7.4', 'D7.4 AN内软切换成功率', '[MD7.6] / [MD7.5]', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810110', 'MD7.5', 'D7.5 AN内软切换请求次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810111', 'MD7.6', 'D7.6 AN内软切换成功次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810112', 'MD7.7', 'D7.7 AN间软切换成功率', '[MD7.9] / [MD7.8]', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113', 'MD7.8', 'D7.8 AN间软切换请求次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810114', 'MD7.9', 'D7.9 AN间软切换成功次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810115', 'MD7.10', 'D7.10 AN内硬切换成功率', '[MD7.12] / [MD7.11] * 100', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810116', 'MD7.11', 'D7.11 AN内硬切换请求次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810117', 'MD7.12', 'D7.12 AN内硬切换成功次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810118', 'MD7.13', 'D7.13 AN间硬切换成功率', '[MD7.15] / [MD7.14]', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810119', 'MD7.14', 'D7.14 AN间硬切换请求次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810120', 'MD7.15', 'D7.15 AN间硬切换成功次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810121', 'MD8.1', 'D8.1 寻呼响应率', '[MD8.3] / [MD8.2] * 100', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810122', 'MD8.2', 'D8.2 寻呼请求次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810123', 'MD8.3', 'D8.3 寻呼响应总次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810124', 'MD9.1', '存在DO载频(37)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810125', 'MD9.2', '存在DO载频(78)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810126', 'MD9.3', '存在DO载频(119)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810127', 'MD9.4', 'DO载频总数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810128', 'MD9.5', 'Do载频话务量(37)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810129', 'MD9.6', 'Do载频话务量(78)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810130', 'MD9.7', 'Do载频话务量(119)', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810131', 'MD9.8', '单DO载频小区数量', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810132', 'MD9.9', '双DO载频小区数量', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810133', 'MD9.10', '三DO载频小区数量', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810134', 'MD9.11', 'DO小区数量', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810135', 'MD10.1', '数据连接建立总时长', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810136', 'MD10.2', '数据连接占用总时长', 'CASE WHEN (SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))+SUM(nvl(AN_INIT_ESTABLISHED_CONN,0)))=0 THEN 0 ELSE ROUND((SUM(EVM_AVG_DRC_POINTED_USERS)*3600*(SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN)))/(SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))+SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))),2) END', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810137', 'MD10.3', 'Session建立总时长', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810139', 'MD10.5', '前向发送字节数', 'SUM(FWD_RLP_DATA)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810140', 'MD10.6', '反向重传字节数', 'SUM(MISSING_RLP_REQ_RTC)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810142', 'MD10.8', 'RAB繁忙次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810143', 'MD10.9', 'RAB闲次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810144', 'MD10.10', '前向业务MacIndex可用数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810145', 'MD10.11', 'DRC 前向速率为﹝小于307.2K﹞的申请次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810146', 'MD10.12', 'DRC 前向速率为﹝307.2K ～1228K﹞的申请次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810147', 'MD10.13', 'DRC 前向速率为﹝大于1228K﹞的申请次数', '', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810149', 'MD10.15', '前向物理层发送实际占用时隙时长', 'SUM(FWD_RLP_TOT_SLOT)*0.001667', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810150', 'MD10.16', '反向业务信道物理层接收的bit数', 'SUM(REV_PHY_AVG_BYTE)*(8*1000000)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041177', 'MC9.15', 'C6.7坏小区比例(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810151', 'MD10.17', '反向物理层接收实际占用时隙时长', 'SUM(FWD_RLP_TOT_SLOT)*0.001667', 'ZY0810', '', '2', 'DO朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101011', 'MC2.2', '业务信道话务量(不含切)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101180', 'MC10.3', 'C10.3业务信道承载的话务量(含切换)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041148', 'MC7.9', 'RLP在反向信道中接收的数据量(KB)', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042067', 'MD3.17', 'D3.17 Session会话数', 'SUM(SESSION_ACTIVE_NUM_DO)+SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042071', 'MD4.2', 'D4.2 用户从Dormant态到Active态的激活请求总次数', 'SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042072', 'MD4.3', 'D4.3 用户从Dormant态到Active态的激活成功总次数', 'SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042073', 'MD4.4', 'D4.4 AT 发起的Dormant态到Active态的激活成功率', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO)/SUM(AT_DOR2ACT_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042039', 'MD2.17', 'D2.17 无线连接释放次数(不含PDSN 要求释放次数)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))-SUM(REL_NUM_PDSN_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041205', 'MC11.13', 'C11.16业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042026', 'MD2.4', 'D2.4 AT发起的无线连接请求次数', 'SUM(nvl(AT_CONN_ATT_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042027', 'MD2.5', 'D2.5 AN发起的无线连接请求次数', 'SUM(nvl(AN_CONN_ATT_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042028', 'MD2.6', 'D2.6 AT发起的无线连接成功次数', 'SUM(nvl(AT_CONN_SUC_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810014', 'MD1.14', 'D1.14 PCF内最大可同时支持的HRPD会话数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101181', 'MC10.4', 'C10.4业务信道承载的话务量(不含切换)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810003', 'MD1.3', 'D1.3 双载频基站数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101164', 'MC9.2', 'C3.2软切换因子(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810002', 'MD1.2', 'D1.2 单载频基站数量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810044', 'MD2.22', 'D2.22 无线掉线率', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810098', 'MD6.13', 'D6.13 前向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042029', 'MD2.7', 'D2.7 AN发起的无线连接成功次数', 'SUM(nvl(AN_CONN_SUC_DO,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042070', 'MD4.1', 'D4.1 用户从Dormant态到Active态的激活成功率', 'CASE WHEN (SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)) /(SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)) * 100, 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042052', 'MD3.2', 'D3.2 UATI请求次数', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042053', 'MD3.3', 'D3.3 UATI分配成功次数', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042127', 'MD9.4', 'DO载频总数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042128', 'MD9.5', 'Do载频话务量(37)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042129', 'MD9.6', 'Do载频话务量(78)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042130', 'MD9.7', 'Do载频话务量(119)', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042131', 'MD9.8', '单DO载频小区数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042132', 'MD9.9', '双DO载频小区数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042133', 'MD9.10', '三DO载频小区数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042134', 'MD9.11', 'DO小区数量', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042139', 'MD10.5', '前向发送字节数', 'SUM(FWD_RLP_AVG_THROUGHPUT_DO)*1024', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042144', 'MD10.10', '前向业务MacIndex可用数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042145', 'MD10.11', 'DRC 前向速率为﹝小于307.2K﹞的申请次数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042146', 'MD10.12', 'DRC 前向速率为﹝307.2K ～1228K﹞的申请次数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042147', 'MD10.13', 'DRC 前向速率为﹝大于1228K﹞的申请次数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042151', 'MD10.17', '反向物理层接收实际占用时隙时长', 'SUM(RLP_CALLKDURATION)', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042046', 'MD2.24', 'D2.24 无线连接平均建立时长', 'CASE WHEN (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO))=0 THEN 0 ELSE ROUND(SUM(DO_SETUP_TIME)/ (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO)), 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042047', 'MD2.25', 'D2.25 无线连接平均占用时长', 'CASE WHEN  (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO))=0 THEN 0 ELSE ROUND(SUM(DO_CONNECT_TIME)/ (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO)), 2) END', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041009', 'MC1.9', '呼叫建立成功率-PS(%)', 'CASE WHEN SUM(CALL_ATT_NUM_PS)=0 THEN 0 WHEN (SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS))>=SUM(CALL_ATT_NUM_PS) THEN 99.99ELSE ROUND((SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS))/SUM(CALL_ATT_NUM_PS)* 100, 4) END ', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041010', 'MC2.1', '业务信道话务量(含切)(Erl)', 'SUM(SHO_TRAFFIC_CS)+SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041014', 'MC2.5', 'Walsh码话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041015', 'MC2.6', '软切换话务量-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041016', 'MC2.7', '更软切换话务量-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041017', 'MC2.8', '软切换比例-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041021', 'MC2.12', '软切换话务量-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041022', 'MC2.13', '更软切换话务量-PS(Erl)', 'SUM(SSHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041023', 'MC2.14', '软切换比例-PS(%)', 'CASE WHEN SUM(TRAFFIC_PS)=0 THEN 0 ELSE ROUND(SUM(SHO_TRAFFIC_PS)/SUM(TRAFFIC_PS)* 100, 4) END ', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041031', 'MC3.8', '业务信道掉话率-PS(%)', 'CASE WHEN SUM(DATA_SRLSNUM_PS)=0 THEN 0 WHEN SUM(DATE_DROP_NUM)<=0 THEN 0.01 ELSE ROUND(SUM(DATE_DROP_NUM)/SUM(DATA_SRLSNUM_PS),4)*100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041033', 'MC4.1', '业务信道分配请求次数(含切)', 'SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041034', 'MC4.2', '业务信道分配成功次数(含切)', 'SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041036', 'MC4.4', '业务信道分配成功率(含切)(%)', 'CASE WHEN (SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM))=0 THEN 0 ELSE ROUND((SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))/(SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041037', 'MC4.5', '业务信道分配请求次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041039', 'MC4.7', '业务信道分配失败次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)-(SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041040', 'MC4.8', '业务信道分配成功率(不含切)(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS))=0 THEN 0 ELSE ROUND(((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS)))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041045', 'MC4.13', '业务信道分配失败次数(含切)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041047', 'MC4.15', '业务信道分配请求次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041049', 'MC4.17', '业务信道分配失败次数(不含切)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041050', 'MC4.18', '业务信道分配成功率(不含切)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)), 4)*100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041066', 'MC4.34', '业务信道分配成功率(不含切)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_PS)/SUM(TCH_ASSIGN_ATT_PS) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041065', 'MC4.33', '业务信道分配失败次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041026', 'MC3.3', '话务掉话比', 'CASE WHEN (SUM(TCH_DROP_NUM) + SUM(DATE_DROP_NUM))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + SUM(DATE_DROP_NUM)),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041029', 'MC3.6', '话务掉话比-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041032', 'MC3.9', '话务掉话比-PS', 'CASE WHEN SUM(DATE_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/SUM(DATE_DROP_NUM),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041041', 'MC4.9', '业务信道拥塞次数', 'SUM(TCH_BLOCK_COUNT)+ SUM(TCH_BLOCK_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041042', 'MC4.10', '业务信道拥塞率(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT) + SUM(TCH_BLOCK_NUM_PS))*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041043', 'MC4.11', '业务信道分配请求次数(含切)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041002', 'MC1.2', '呼叫建立成功次数', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(CMO_CALLSUCCNUM_PS,0))+sum(nvl(PAG_SUCC_NUM_PS,0))', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042152', 'MC12.1', '预留字段1', '', 'ZY0804', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042153', 'MC12.2', '预留字段2', '', 'ZY0804', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042154', 'MC12.3', '预留字段3', '', 'ZY0804', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042155', 'MC12.4', '预留字段4', '', 'ZY0804', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042156', 'MC12.5', '预留字段5', '', 'ZY0804', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041207', 'MC12.1', '预留字段1', '', 'ZY0804', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041208', 'MC12.2', '预留字段2', '', 'ZY0804', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041209', 'MC12.3', '预留字段3', '', 'ZY0804', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041210', 'MC12.4', '预留字段4', '', 'ZY0804', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041211', 'MC12.5', '预留字段5', '', 'ZY0804', '', '1', '1X华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041044', 'MC4.12', '业务信道分配成功次数(含切)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041071', 'MC4.39', '业务信道拥塞率-硬切换PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_PS)-SUM(TCH_ASSIGN_SUC_HHO_PS))/SUM(TCH_ASSIGN_ATT_HHO_PS) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041046', 'MC4.14', '业务信道分配成功率(含切)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041051', 'MC4.19', '业务信道拥塞次数-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041052', 'MC4.20', '业务信道拥塞率-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0   ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT),4)*100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041075', 'MC5.1', '切换请求次数', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041076', 'MC5.2', '切换成功次数', 'SUM(INNER_BSC_HHO_SUCC)+ SUM(INNER_BSC_SHO_SUCC) + SUM(INNER_BSC_SOFTERHO_SUCC) + SUM(INTER_BSC_HHO_SUCC)+ SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041077', 'MC5.3', '切换成功率(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC) + SUM(INNER_BSC_SOFTERHO_SUCC) + SUM(INTER_BSC_HHO_SUCC)+ SUM(INTER_BSC_SHO_SUCC))*100/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)),2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041079', 'MC5.5', '切换成功次数-CS', 'SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041068', 'MC4.36', '业务信道拥塞率-PS(%)', 'CASE WHEN (SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM))=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_NUM_PS)/(SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)) * 100,2) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041080', 'MC5.6', '切换成功率-CS(%)', 'CASE WHEN (SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)) = 0 THEN 0 ELSE  ROUND( (SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC))/(SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)), 3) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041081', 'MC5.7', '硬切换请求次数-CS', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002001', 'ID1', 'D1.1 DO基站总数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002002', 'ID2', 'D1.2 单载频基站数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002003', 'ID3', 'D1.3 双载频基站数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002004', 'ID4', 'D1.4 三载频基站数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002005', 'ID5', 'D1.5 四载频及以上基站数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002006', 'ID6', 'D1.6 载扇数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002007', 'ID7', 'D1.7 反向CE最高利用率', 'ID8/ID9', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002008', 'ID8', 'D1.8 反向CE最大忙数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002009', 'ID9', 'D1.9 反向CE可用数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002010', 'ID10', 'D1.10 前向业务MacIndex最高利用率', 'ID11/ID144', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002011', 'ID11', 'D1.11 前向业务MacIndex最大忙数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002012', 'ID12', 'D1.12 PCF数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002013', 'ID13', 'D1.13 PCF主处理器平均负荷', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002014', 'ID14', 'D1.14 PCF内最大可同时支持的HRPD会话数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002015', 'ID15', 'D1.15 PCF内最大可同时支持的激活的HRPD会话数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002016', 'ID16', 'D1.16 PCF配置的上行最大吞吐率', '', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002017', 'ID17', 'D1.17 PCF配置的下行最大吞吐率', '', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002018', 'ID18', 'D1.18 A-Bis接口带宽平均利用率', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002019', 'ID19', 'D1.19 A-Bis接口配置的端口带宽', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002020', 'ID20', 'D1.20 A-Bis接口平均占用带宽', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002021', 'ID21', 'D1.21 超忙基站数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002022', 'ID22', 'D1.22 超闲基站数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002023', 'ID23', 'D2.1 无线连接成功率', '(ID28+ID29)/(ID26+ID27)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002024', 'ID24', 'D2.2 AT发起的连接成功率', 'ID28/ID26', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002025', 'ID25', 'D2.3 AN发起的连接成功率', 'ID29/ID27', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002026', 'ID26', 'D2.4 AT发起的无线连接请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002027', 'ID27', 'D2.5 AN发起的无线连接请求次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002028', 'ID28', 'D2.6 AT发起的无线连接成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002029', 'ID29', 'D2.7 AN发起的无线连接成功次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002030', 'ID30', 'D2.8 无线网络连接成功率（含A8、A10 接口）', 'ID31/ID32', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002031', 'ID31', 'D2.9 无线网络连接成功次数（含A8、A10 接口）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002032', 'ID32', 'D2.10 无线网络连接请求次数（含A8、A10 接口）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002033', 'ID33', 'D2.11 用户早释率', 'ID34/(ID26+ID27)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002034', 'ID34', 'D2.12 用户早释次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002035', 'ID35', 'D2.13 无线连接建立失败次数（原因为分配资源失败）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002036', 'ID36', 'D2.14 无线连接建立失败次数（原因为反向业务信道俘获失败）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002037', 'ID37', 'D2.15 无线连接建立失败次数（原因为没有收到TCC 消息）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002038', 'ID38', 'D2.16 无线连接释放次数(含PDSN 要求释放次数)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002039', 'ID39', 'D2.17 无线连接释放次数(不含PDSN 要求释放次数)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002040', 'ID40', 'D2.18 PDSN原因要求释放次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002041', 'ID41', 'D2.19 无线掉线次数（空口丢失）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002042', 'ID42', 'D2.20 无线掉线次数（硬切换失败导致的掉线）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002043', 'ID43', 'D2.21 无线掉线次数（其他原因）', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002044', 'ID44', 'D2.22 无线掉线率', '(ID41+ID42+ID43)/(ID38+ID41+ID42+ID43)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002045', 'ID45', 'D2.23 网络掉线率', '(ID40+ID41+ID42+ID43)/(ID38+ID41+ID42+ID43)', 'ZY0000', '', '2', '省公司DO公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041082', 'MC5.8', '硬切换成功次数-CS', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041083', 'MC5.9', '硬切换成功率-CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041084', 'MC5.10', '软切换请求次数-CS', 'SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041085', 'MC5.11', '软切换成功次数-CS', 'SUM(S_SHO_SUC)-SUM(S_SSHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041086', 'MC5.12', '软切换成功率-CS(%)', 'CASE WHEN (SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)) = 0 THEN 0 ELSE  ROUND((SUM(S_SHO_SUC)-SUM(S_SSHO_SUC))/(SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041087', 'MC5.13', '更软切换请求次数-CS', 'SUM(S_SSHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041088', 'MC5.14', '更软切换成功次数-CS', 'SUM(S_SSHO_SUC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041089', 'MC5.15', '更软切换成功率-CS(%)', 'CASE WHEN SUM(S_SSHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(S_SSHO_SUC)/SUM(S_SSHO_ATT),4) * 100 END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041156', 'MC8.7', 'C1.25单载频小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041157', 'MC8.8', 'C1.26双载频小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041158', 'MC8.9', 'C1.27三载频小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041159', 'MC8.10', 'C1.28四载频小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041123', 'MC6.1', '第一载频(283)基站数', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041124', 'MC6.2', '第二载频(201)基站数', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041125', 'MC6.3', '第三载频(242)基站数', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041126', 'MC6.4', '第四载频(160)基站数', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041127', 'MC6.5', '1X载频总数', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041151', 'MC8.2', 'C1.20单载频基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', 'BSC标识', 'case T1.VENDOR
when ''ZY0808'' THEN CITY.ENNAME||''.''||OMC.MSCNAME||''.''||T1.china_name
when ''ZY0810'' THEN CITY.ENNAME||''.''||OMC.MSCNAME|| ''.''||T1.china_name
whEN ''ZY0804'' THEN CITY.ENNAME||''.''||OMC.MSCNAME|| ''.''|| T1.china_name
ELSE ''ASS'' END', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', 'MSC标识', 'OMC.MSCNAME', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3002', '', '基站标识', 'case BSC.vendor
when ''ZY0808'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
when ''ZY0804'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
when ''ZY0810'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
else ''ASS''    end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3013', '', 'MSC标识', 'MSC.MSCNAME', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3015', '', 'BSC标识', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
when ''ZY0810'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
when ''ZY0804'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
else ''MSC标识'' end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', 'MSC标识', 'bb.MSCNAME', 'ZY0000', '', '1', 'MSC数据', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '设备中文名称', 'CITY.CITY_NAME ||''.''||OMC.MSCNAME ||''.'' || OMC.BSCNAME', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '厂家名称', 'case T1.vendor when ''ZY0808'' THEN ''华为'' when ''ZY0810'' THEN ''阿朗'' when ''ZY0804'' THEN ''中兴'' end ', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3016', '', '厂家名称', 'case BSC.vendor when ''ZY0808'' THEN ''华为'' when ''ZY0810'' THEN ''阿朗'' when ''ZY0804'' THEN ''中兴'' end ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '厂家名称', '(case bb.vendor
       when ''ZY0808'' then ''华为''
       when ''ZY0810'' then ''阿朗''  when ''ZY0804'' then ''中兴''

       end)', 'ZY0000', '', '1', 'MSC数据', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', '时间戳', '''{0}''', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', '外部网元标识', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', '省份', '''{1}''', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '城市列表', 'CITY.CITY_NAME ', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', 'MGW标识', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '软件版本', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '设备名称', 'T1.EQUIP_NAME ', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '规格型号', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '无线容量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '设计无线容量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '基站容量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '扇区容量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '设计的BHCA值', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '基站数量', '(select count(*) bts_num
from ne_bts_c d
where d.related_bsc = T1. ne_sys_id) ', 'ZY0000', '', '2', '   BSC基础数据类别', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '1X基站数量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', 'DO基站数量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '扇区数量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', 'PCF数量', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '机房位置', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '机房名称', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '经度', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', '纬度', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '备注', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2028', '', '预留字段1', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2029', '', '预留字段2', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2030', '', '预留字段3', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2031', '', '预留字段4', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2032', '', '预留字段5', '', 'ZY0000', '', '2', '   BSC基础数据类别', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3001', '', '时间戳', '''{0}''', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3003', '', '外部网元标识', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3004', '', '站号', 'bts.bts_id', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3005', '', '基站设备名称', 'bts.equip_name', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3006', '', '基站中文名', 'replace(bts.china_name,'','',''.'')', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3007', '', '基站拼音', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3008', '', '基站别名', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3009', '', '省份', '''{1}''', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3010', '', '城市', 'CITY.CITY_NAME', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3011', '', '行政归属', 'replace(ADM.COUNTY_NAME,''区'','''') ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3012', '', '地理归属', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3014', '', 'MGW标识', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3017', '', '软件版本', 'case BSC.vendor
when ''ZY0808'' then  ''BSC6680''
when ''ZY0804'' then  ''V8''
when ''ZY0810'' then  ''R32''
else ''softVersion''    end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3018', '', '设备型号', 'BTS.EQUIP_MODEL', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3019', '', '基站等级', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3020', '', 'LAC', 'BTS.LAC', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3021', '', 'REG_ZONE', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3022', '', 'BSID', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3023', '', 'NID', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3025', '', '扇区数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3026', '', '1X载扇数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3027', '', 'DO载扇数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3028', '', '1X CE数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3029', '', 'DO CE数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3030', '', '分配ABIS口E1电路数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3031', '', '基站类型', '1', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3032', '', '系统类型', 'case when (carr.bus_1x+carr.bus_do)= 2 then 1 else case when carr.bus_1x = 1 then 0 else 2 end  end ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3033', '', '延伸覆盖类型', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3034', '', '天线方向类型', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3035', '', '1X站型配置', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3036', '', 'DO站型配置', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3037', '', '工程状态', '1', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3038', '', '运行状态', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3039', '', '运行状态判断时间', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3040', '', '基站开通日期', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3041', '', '设计院', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3042', '', '设计期别', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3043', '', '代维单位', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3044', '', '维护人', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3045', '', '维护人电话', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3046', '', '营销区域', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3047', '', '覆盖区域描述', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3048', '', '共站情况', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3050', '', '带室外直放站数量', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3051', '', '经度', 'BTS.LONGITUDE ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3052', '', '纬度', 'BTS.LATITUDE    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3054', '', '塔桅类型', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3055', '', '机柜类型', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3056', '', '无线容量', 'BTS.WIRE_LOAD      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3057', '', '设计无线容量', 'BTS.WIRE_LOAD_P    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3058', '', '最大发射功率', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3059', '', '环境类型', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3060', '', '建筑类型', 'BTS.ARCHITECTURE    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3061', '', '电源', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3062', '', '传输方式', 'BTS.TRANSFERS      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3063', '', '传输设备', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3064', '', '是否级联', 'BTS.ISRELATED      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3065', '', '是否室内', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3066', '', '厂商侧BSC编号', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3067', '', '厂商侧SITE编号', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3068', '', '备注', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3069', '', '预留字段1', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3070', '', '预留字段2', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3071', '', '预留字段3', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3072', '', '预留字段4', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3073', '', '预留字段5', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002124', 'ID124', '存在DO载频(37)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002125', 'ID125', '存在DO载频(78)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002126', 'ID126', '存在DO载频(119)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002127', 'ID127', 'DO载频总数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002128', 'ID128', 'Do载频话务量(37)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002129', 'ID129', 'Do载频话务量(78)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002130', 'ID130', 'Do载频话务量(119)', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002131', 'ID131', '单DO载频小区数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002132', 'ID132', '双DO载频小区数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002133', 'ID133', '三DO载频小区数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002134', 'ID134', 'DO小区数量', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002135', 'ID135', '数据连接建立总时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002136', 'ID136', '数据连接占用总时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002137', 'ID137', 'Session建立总时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002138', 'ID138', '前向重传字节数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002139', 'ID139', '前向发送字节数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002140', 'ID140', '反向重传字节数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002141', 'ID141', '反向接收的字节数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002142', 'ID142', 'RAB繁忙次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002143', 'ID143', 'RAB闲次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002144', 'ID144', '前向业务MacIndex可用数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002145', 'ID145', 'DRC 前向速率为﹝小于307.2K﹞的申请次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002146', 'ID146', 'DRC 前向速率为﹝307.2K ～1228K﹞的申请次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002147', 'ID147', 'DRC 前向速率为﹝大于1228K﹞的申请次数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002148', 'ID148', '前向业务信道物理层发送的bit数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002149', 'ID149', '前向物理层发送实际占用时隙时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002150', 'ID150', '反向业务信道物理层接收的bit数', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002151', 'ID151', '反向物理层接收实际占用时隙时长', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002152', 'ID152', '预留字段1', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002153', 'ID153', '预留字段2', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002154', 'ID154', '预留字段3', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002155', 'ID155', '预留字段4', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002156', 'ID156', '预留字段5', '', 'ZY0000', '', '2', '省公司DO公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001002', 'ID2', '呼叫建立成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3049', '', '站址', 'substr(replace(BTS.ADDRESS,'','',''.''),0,30)', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001001', 'ID1', '呼叫尝试次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001003', 'ID3', '呼叫建立成功率(%)', 'ID2/ID1', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001004', 'ID4', '呼叫尝试次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001005', 'ID5', '呼叫建立成功次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001006', 'ID6', '呼叫建立成功率-CS(%)', 'ID5/ID4', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001007', 'ID7', '呼叫尝试次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001008', 'ID8', '呼叫建立成功次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001009', 'ID9', '呼叫建立成功率-PS(%)', 'ID8/ID7', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001010', 'ID10', '业务信道话务量(含切)(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001011', 'ID11', '业务信道话务量(不含切)(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001012', 'ID12', '业务信道话务量(含切)-CS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001013', 'ID13', '业务信道话务量(不含切)-CS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001014', 'ID14', 'Walsh码话务量-CS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001015', 'ID15', '软切换话务量-CS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001016', 'ID16', '更软切换话务量-CS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001017', 'ID17', '软切换比例-CS(%)', 'ID15/(ID13+ID15)', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001018', 'ID18', '业务信道话务量(含切)-PS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001019', 'ID19', '业务信道话务量(不含切)-PS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001020', 'ID20', 'Walsh码话务量-PS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001021', 'ID21', '软切换话务量-PS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001022', 'ID22', '更软切换话务量-PS(Erl)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001023', 'ID23', '软切换比例-PS(%)', 'ID21/ID19', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001024', 'ID24', '业务信道掉话次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001025', 'ID25', '业务信道掉话率(%)', 'ID24/ID38', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001026', 'ID26', '话务掉话比', 'ID11*60/ID24*100', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001027', 'ID27', '业务信道掉话次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001028', 'ID28', '业务信道掉话率-CS(%)', 'ID27/ID48', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001029', 'ID29', '话务掉话比-CS', 'ID13*60/ID27*100', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001030', 'ID30', '业务信道掉话次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001031', 'ID31', '业务信道掉话率-PS(%)', 'ID30/ID64', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001032', 'ID32', '话务掉话比-PS', 'ID19*60/ID30*100', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001033', 'ID33', '业务信道分配请求次数(含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001034', 'ID34', '业务信道分配成功次数(含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001035', 'ID35', '业务信道分配失败次数(含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001036', 'ID36', '业务信道分配成功率(含切)(%)', 'ID34/ID33', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001037', 'ID37', '业务信道分配请求次数(不含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001038', 'ID38', '业务信道分配成功次数(不含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001039', 'ID39', '业务信道分配失败次数(不含切)', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001040', 'ID40', '业务信道分配成功率(不含切)(%)', 'ID38/ID37', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001041', 'ID41', '业务信道拥塞次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001042', 'ID42', '业务信道拥塞率(%)', 'ID41/ID33', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001043', 'ID43', '业务信道分配请求次数(含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001044', 'ID44', '业务信道分配成功次数(含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001045', 'ID45', '业务信道分配失败次数(含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001046', 'ID46', '业务信道分配成功率(含切)-CS(%)', 'ID44/ID43', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001047', 'ID47', '业务信道分配请求次数(不含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001048', 'ID48', '业务信道分配成功次数(不含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001049', 'ID49', '业务信道分配失败次数(不含切)-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001050', 'ID50', '业务信道分配成功率(不含切)-CS(%)', 'ID48/ID47', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001051', 'ID51', '业务信道拥塞次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001052', 'ID52', '业务信道拥塞率-CS(%)', 'ID51/ID43', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001053', 'ID53', '业务信道分配请求次数-硬切换-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001054', 'ID54', '业务信道分配成功次数-硬切换-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001055', 'ID55', '业务信道拥塞率-硬切换CS(%)', '(ID53-ID54)/ID53', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001056', 'ID56', '业务信道分配请求次数-软切换-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001057', 'ID57', '业务信道分配成功次数-软切换-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001058', 'ID58', '业务信道拥塞率-软切换CS(%)', '(ID56-ID57)/ID56', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001059', 'ID59', '业务信道分配请求次数(含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001060', 'ID60', '业务信道分配成功次数(含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001061', 'ID61', '业务信道分配失败次数(含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001062', 'ID62', '业务信道分配成功率(含切)-PS(%)', 'ID60/ID59', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001063', 'ID63', '业务信道分配请求次数(不含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001064', 'ID64', '业务信道分配成功次数(不含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001065', 'ID65', '业务信道分配失败次数(不含切)-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001066', 'ID66', '业务信道分配成功率(不含切)-PS(%)', 'ID64/ID63', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001067', 'ID67', '业务信道拥塞次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001068', 'ID68', '业务信道拥塞率-PS(%)', 'ID67/ID59', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001069', 'ID69', '业务信道分配请求次数-硬切换-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001070', 'ID70', '业务信道分配成功次数-硬切换-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001071', 'ID71', '业务信道拥塞率-硬切换PS(%)', '(ID69-ID70)/ID69', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001072', 'ID72', '业务信道分配请求次数-软切换-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001073', 'ID73', '业务信道分配成功次数-软切换-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001074', 'ID74', '业务信道拥塞率-软切换PS(%)', '(ID72-ID73)/ID72', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001075', 'ID75', '切换请求次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001076', 'ID76', '切换成功次数', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001077', 'ID77', '切换成功率(%)', 'ID76/ID75', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001078', 'ID78', '切换请求次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001079', 'ID79', '切换成功次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001080', 'ID80', '切换成功率-CS(%)', 'ID79/ID78', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001081', 'ID81', '硬切换请求次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001082', 'ID82', '硬切换成功次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001083', 'ID83', '硬切换成功率-CS(%)', 'ID82/ID81', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001084', 'ID84', '软切换请求次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001085', 'ID85', '软切换成功次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001086', 'ID86', '软切换成功率-CS(%)', 'ID85/ID84', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001087', 'ID87', '更软切换请求次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001088', 'ID88', '更软切换成功次数-CS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001089', 'ID89', '更软切换成功率-CS(%)', 'ID88/ID87', 'ZY0000', '', '1', '省1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001090', 'ID90', '切换请求次数-PS', '', 'ZY0000', '', '1', '省1X公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810100', 'MD6.15', 'D6.15 反向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101003', 'MC1.3', '呼叫建立成功率(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(DATACALLATT3G,0))) = 0 THEN 0 WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0)))>=(SUM(nvl(CALL_ATT,0)) + SUM(nvl(DATACALLATT3G,0))) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0)))/(SUM(CALL_ATT) + SUM(DATACALLATT3G)),4) * 100 END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101028', 'MC3.5', '业务信道掉话率-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810038', 'MD2.16', 'D2.16 无线连接释放次数(含PDSN 要求释放次数)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810041', 'MD2.19', 'D2.19 无线掉线次数（空口丢失）', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041152', 'MC8.3', 'C1.21双载频基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042120', 'MD7.15', 'D7.15 AN间硬切换成功次数', 'SUM(INTER_AN_HHO_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041153', 'MC8.4', 'C1.22三载频基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041154', 'MC8.5', 'C1.23四载频基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041161', 'MC8.12', 'C1.32无线容量', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041183', 'MC10.6', 'C10.6第一载频(283)话务量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041184', 'MC10.7', 'C10.7第二载频(201)话务量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041185', 'MC10.8', 'C10.8第三载频(242)话务量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041186', 'MC10.9', 'C10.9第四载频(160)话务量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041055', 'MC4.23', '业务信道拥塞率-硬切换CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND((SUM(BSS_HHO_ATT) - SUM(BSS_HHO_SUC)) / SUM(BSS_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041072', 'MC4.40', '业务信道分配请求次数-软切换-PS', 'SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041073', 'MC4.41', '业务信道分配成功次数-软切换-PS', 'SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810042', 'MD2.20', 'D2.20 无线掉线次数（硬切换失败导致的掉线）', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810043', 'MD2.21', 'D2.21 无线掉线次数（其他原因）', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810051', 'MD3.1', 'D3.1 UATI分配成功率', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042054', 'MD3.4', 'D3.4 UATI分配失败次数', 'SUM(UATI_ATT_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042055', 'MD3.5', 'D3.5 UATI平均建立时长', 'SUM(UATI_AVG_SETUP_DURATION_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042059', 'MD3.9', 'D3.9 Session接入鉴权拒绝次数', 'SUM(AUTH_DENY_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042060', 'MD3.10', 'D3.10 Session接入鉴权失败次数', 'SUM(AUTH_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042062', 'MD3.12', 'D3.12 Session协商成功次数', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042063', 'MD3.13', 'D3.13 Session协商失败次数', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042065', 'MD3.15', 'D3.15 Session跨AN Dormant切换次数', 'SUM(SESS_INTER_AN_DORMHO_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042066', 'MD3.16', 'D3.16 Session跨AN Dormant切换成功次数', 'SUM(SESS_INTER_AN_DORMHO_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042094', 'MD6.9', 'D6.9 前向RLP数据吞吐量', 'ROUND(SUM(RLP_TXBYTENUM) * 8.0 / 1000 / 3600,4)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('701', '', '集团38个关键指标(1X)', '1,2,3,4,5,6,11,13,24,25,27,28,38,48,155,164,177,180,181,191', 'ZY0000', '', '1', '1X关键指标', '1', '7');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('702', '', '集团38个关键指标(DO)', '23,26,27,28,29,38,41,42,43,44,51,52,53,98,100,106,107,108', 'ZY0000', '', '2', 'DO关键指标', '1', '7');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042103', 'MD6.18', 'D6.18 前向物理层控制信道时隙占用率', 'ROUND(AVG(FWD_PHY_CCH_SLOT_RATE_DO),4)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042110', 'MD7.5', 'D7.5 AN内软切换请求次数', 'SUM(INN_BS_SHO_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042111', 'MD7.6', 'D7.6 AN内软切换成功次数', 'SUM(INN_BS_SHO_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042113', 'MD7.8', 'D7.8 AN间软切换请求次数', 'SUM(INTER_BS_SHO_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042114', 'MD7.9', 'D7.9 AN间软切换成功次数', 'SUM(INTER_BS_SHO_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042057', 'MD3.7', 'D3.7 Session接入鉴权成功次数', 'SUM(AUTH_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042116', 'MD7.11', 'D7.11 AN内硬切换请求次数', 'SUM(INN_AN_HHO_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042096', 'MD6.11', 'D6.11 反向RLP数据吞吐量', 'ROUND(SUM(DO_RTCH_RLP_TX) * 8.0 / 1000 / 3600,4)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042117', 'MD7.12', 'D7.12 AN内硬切换成功次数', 'SUM(INN_AN_HHO_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042119', 'MD7.14', 'D7.14 AN间硬切换请求次数', 'SUM(INTER_AN_HHO_ATT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042122', 'MD8.2', 'D8.2 寻呼请求次数', 'SUM(PAGE_ATT_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042123', 'MD8.3', 'D8.3 寻呼响应总次数', 'SUM(PAGE_SUC_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042079', 'MD4.10', 'D4.10 AN发起的Dormant到Active态的激活成功次数', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042080', 'MD4.11', 'D4.11 AN发起的Dormant态到Active态的激活失败次数', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042081', 'MD5.1', 'D5.1 等效用户数', 'SUM(TRAFFIC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042083', 'MD5.3', 'D5.3 CE话务量', 'SUM(TRAFFIC_DO)+SUM(SFT_HO_TRAFFIC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042084', 'MD5.4', 'D5.4 软切换话务量', 'SUM(SFT_HO_TRAFFIC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042086', 'MD6.1', 'D6.1 PCF反向数据流量', 'SUM(REV_THROUGHOUT_PCF_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042088', 'MD6.3', 'D6.3 PCF接收的反向分组业务的总包数', 'SUM(REV_PAK_TOTAL_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042089', 'MD6.4', 'D6.4 PCF接收的前向分组数据的总包数', 'SUM(FWD_PAK_TOTAL_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042091', 'MD6.6', 'D6.6 前向分组业务在PCF丢弃的包数', 'SUM(FWD_PAK_DISCARD_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042008', 'MD1.8', 'D1.8 反向CE最大忙数', 'SUM(RCE_MAX_BUSY_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042009', 'MD1.9', 'D1.9 反向CE可用数', 'SUM(RCE_RLB_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042035', 'MD2.13', 'D2.13 无线连接建立失败次数（原因为分配资源失败）', 'SUM(CONN_SETUP_FAILED_RESF_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042040', 'MD2.18', 'D2.18 PDSN原因要求释放次数', 'SUM(REL_NUM_PDSN_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041093', 'MC5.19', '硬切换请求次数-PS', 'SUM(HHO_ATT_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041094', 'MC5.20', '硬切换成功次数-PS', 'SUM(HHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041096', 'MC5.22', '软切换请求次数-PS', 'SUM(SHO_ATT_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041012', 'MC2.3', '业务信道话务量(含切)-CS(Erl)', 'SUM(TRAFFIC_CS)+SUM(SFT_HO_TRAFFIC_CS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041097', 'MC5.23', '软切换成功次数-PS', 'SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041099', 'MC5.25', '更软切换请求次数-PS', 'SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041100', 'MC5.26', '更软切换成功次数-PS', 'SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810106', 'MD7.1', 'D7.1 全局软切换成功率', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101001', 'MC1.1', '呼叫尝试次数', 'sum(nvl(CALL_ATT,0))+sum(nvl(DATACALLATT3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101002', 'MC1.2', '呼叫建立成功次数', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101004', 'MC1.4', '呼叫尝试次数-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101005', 'MC1.5', '呼叫建立成功次数-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101024', 'MC3.1', '业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(DATACALLSDROP,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101038', 'MC4.6', '业务信道分配成功次数(不含切)', 'SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101048', 'MC4.16', '业务信道分配成功次数(不含切)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810023', 'MD2.1', 'D2.1 无线连接成功率', 'CASE WHEN (SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0)) )=0 THEN 0 WHEN (SUM(nvl(AT_INIT_ESTABLISHED_CONN,0)) +SUM(nvl(AN_INIT_ESTABLISHED_CONN,0)))>=(SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0))) THEN 99.99 ELSE ROUND((SUM(nvl(AT_INIT_ESTABLISHED_CONN,0)) +SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))) / (SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0))) * 100, 5) END', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810026', 'MD2.4', 'D2.4 AT发起的无线连接请求次数', 'SUM(nvl(AT_INIT_ATT_CONN,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810083', 'MD5.3', 'D5.3 CE话务量', '', 'ZY0810', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810027', 'MD2.5', 'D2.5 AN发起的无线连接请求次数', 'SUM(nvl(AN_INIT_ATT_CONN,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810028', 'MD2.6', 'D2.6 AT发起的无线连接成功次数', 'SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810029', 'MD2.7', 'D2.7 AN发起的无线连接成功次数', 'SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101205', 'MC11.13', 'C11.16业务信道掉话次数', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810052', 'MD3.2', 'D3.2 UATI请求次数', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810053', 'MD3.3', 'D3.3 UATI分配成功次数', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0810', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810107', 'MD7.2', 'D7.2 全局软切换请求次数', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810108', 'MD7.3', 'D7.3 全局软切换成功次数', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0810', '', '2', 'DO朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101006', 'MC1.6', '呼叫建立成功率-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0 WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101007', 'MC1.7', '呼叫尝试次数-PS', 'sum(DATACALLATT3G)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101027', 'MC3.4', '业务信道掉话次数-CS', 'SUM(TCH_DROP_NUM)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101030', 'MC3.7', '业务信道掉话次数-PS', 'sum(DATACALLSDROP)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101064', 'MC4.32', '业务信道分配成功次数(不含切)-PS', 'SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101025', 'MC3.2', '业务信道掉话率(%)', 'CASE WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATACALLSDROP,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATACALLSDROP,0)))/(SUM(CALL_SETUP_SUCC_CS) + SUM(ESTDATACALLS3G)),4) * 100 END', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101133', 'MC6.11', '前向信道可用数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101134', 'MC6.12', '前向信道最大占用数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101135', 'MC6.13', '前向信道最大占用率(%)', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101136', 'MC6.14', '反向信道配置总数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101137', 'MC6.15', '反向信道可用数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101138', 'MC6.16', '反向信道最大占用数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101139', 'MC6.17', '反向信道最大占用率(%)', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101141', 'MC7.2', '前向传输总帧数-不包括重传', 'SUM(FWD_RLP_DATA)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101143', 'MC7.4', 'RLP在前向信道中重传的数据量(字节)', 'sum(TOTALRLPBYTESRETRFWDTRAFFIC)', 'ZY0810', '', '1', '1X朗讯公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101144', 'MC7.5', 'RLP前向丢弃数据量(字节)', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101145', 'MC7.6', '前向信道重传率(%)', '[MC7.4] / 1024 * [MC7.3] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101146', 'MC7.7', '反向重传总帧数', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101149', 'MC7.10', '反向信道重传率(%)', '[MC7.7] / [MC7.8] * 100', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101150', 'MC8.1', 'C1.19基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101151', 'MC8.2', 'C1.20单载频基站数量', '', 'ZY0810', '', '1', '1X朗讯公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081084', 'MC5.10', '软切换请求次数-CS', 'SUM(S_SHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081085', 'MC5.11', '软切换成功次数-CS', 'SUM(S_SHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4001', '', '时间戳', '''{0}''', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4003', '', '外部网元标识', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4004', '', '省份', '''{1}''', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4005', '', '城市', 'CITY.CITY_NAME', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4006', '', '行政区', 'replace(ADM.COUNTY_NAME,''区'','''') ', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4009', '', '厂商侧扇区标识', 'case BSC.vendor
when ''ZY0808'' then  SECTOR.SECTOR_ID
when ''ZY0804'' then  BTS.BTS_ID
when ''ZY0810'' then  SECTOR.SECTOR_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4010', '', '厂商侧sector编号', 'case BSC.vendor
when ''ZY0808'' then  SECTOR.SECTOR_ID
when ''ZY0804'' then  SECTOR.SECTOR_ID
when ''ZY0810'' then  SECTOR.SECTOR_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4012', '', '扇区标识_DO', 'case BSC.vendor
when ''ZY0808'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''')
when ''ZY0804'' then  to_char(SECTOR.CI)
when ''ZY0810'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4013', '', '扇区中文名', 'case BSC.vendor
when ''ZY0808'' then  replace(SECTOR.CHINA_NAME,'','',''，'')
when ''ZY0804'' then  replace(SECTOR.CHINA_NAME,'','',''，'')
when ''ZY0810'' then  replace(SECTOR.CHINA_NAME,'','',''，'') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4014', '', '经度', 'SECTOR.LONGITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4015', '', '纬度', 'SECTOR.LATITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4016', '', 'PN', 'SECTOR.PN', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4017', '', '扇区类型', 'DECODE(SECTOR.SITE_TYPE,''1'',''标准小区'',''2'',''微蜂窝'',''3'',''RRU'',SECTOR.SITE_TYPE)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4018', '', '是否室内', 'DECODE(SECTOR.ISINDOOR,0,''否'',1,''是'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4019', '', '是否RRU扇区', 'DECODE(SECTOR.SITE_TYPE,''3'',''是'',''否'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4020', '', '是否为多RRU共PN扇区', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4021', '', '是否功分扇区', 'SECTOR.ISCELLSPLIT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4022', '', '设计无线容量', 'SECTOR.WIRE_LOAD_P', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4023', '', 'MSC标识', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.MSCNAME
when ''ZY0810'' then CITY.ENNAME||''_''||MSC.MSCNAME
when ''ZY0804'' then CITY.ENNAME||''_''||MSC.MSCNAME end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4024', '', 'MGW标识', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4025', '', 'BSC标识', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.MSCNAME||''.''||MSC.BSCNAME
when ''ZY0810'' then CITY.ENNAME||''_''||MSC.MSCNAME||''.''||MSC.BSCNAME
when ''ZY0804'' then MSC.BSCNAME end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4026', '', 'BTS标识', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.BSCNAME||''.''||BTS.BTS_ID
when ''ZY0810'' then MSC.BSCNAME||''.''||BTS.BTS_ID
when ''ZY0804'' then CITY.ENNAME||''_''||MSC.BSCNAME||''.''||BTS.BTS_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4027', '', 'LAC', 'SECTOR.LAC', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041187', 'MC10.10', 'C10.10超忙小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041188', 'MC10.11', 'C10.11忙小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041189', 'MC10.12', 'C10.12超闲小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041190', 'MC10.13', 'C11.17坏小区数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041191', 'MC10.14', 'C10.13严重溢出基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041192', 'MC10.15', 'C10.14溢出基站数量', '', 'ZY0804', '', '1', '1X中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042001', 'MD1.1', 'D1.1 DO基站总数', '', 'ZY0804', '', '2', 'DO中兴公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041053', 'MC4.21', '业务信道分配请求次数-硬切换-CS', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4028', '', '工程状态', 'SECTOR.PROJECT_STATE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4029', '', '天线经度', 'SECTOR.LONGITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4030', '', '天线纬度', 'SECTOR.LATITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4031', '', '天线海拔高度', 'SECTOR.ANT_FRAME_HIGH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4032', '', '天线总挂高', 'SECTOR.ANT_HIGH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4033', '', '天线方向角', 'SECTOR.ANT_AZIMUTH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082006', 'MD1.6', 'D1.6 载扇数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082007', 'MD1.7', 'D1.7 反向CE最高利用率', 'CASE WHEN SUM(RCE_RLB_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RCE_MAX_BUSY_NUM_DO)/SUM(RCE_RLB_NUM_DO) * 100,2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082010', 'MD1.10', 'D1.10 前向业务MacIndex最高利用率', '[MD1.11] / [MD10.10] * 100 ', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082012', 'MD1.12', 'D1.12 PCF数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082013', 'MD1.13', 'D1.13 PCF主处理器平均负荷', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082014', 'MD1.14', 'D1.14 PCF内最大可同时支持的HRPD会话数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082015', 'MD1.15', 'D1.15 PCF内最大可同时支持的激活的HRPD会话数量', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082016', 'MD1.16', 'D1.16 PCF配置的上行最大吞吐率', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082017', 'MD1.17', 'D1.17 PCF配置的下行最大吞吐率', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082018', 'MD1.18', 'D1.18 A-Bis接口带宽平均利用率', '[MD1.20] / [MD10.19]', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082019', 'MD1.19', 'D1.19 A-Bis接口配置的端口带宽', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082020', 'MD1.20', 'D1.20 A-Bis接口平均占用带宽', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082021', 'MD1.21', 'D1.21 超忙基站数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082022', 'MD1.22', 'D1.22 超闲基站数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082024', 'MD2.2', 'D2.2 AT发起的连接成功率', 'DECODE(SUM(AT_CONN_ATT_DO),0,0,ROUND(SUM(AT_CONN_SUC_DO)/SUM(AT_CONN_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082025', 'MD2.3', 'D2.3 AN发起的连接成功率', 'DECODE(SUM(AN_CONN_ATT_DO),0,0,ROUND(SUM(AN_CONN_SUC_DO)/SUM(AN_CONN_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082030', 'MD2.8', 'D2.8 无线网络连接成功率（含A8、A10 接口）', '[MD2.9] / [MD2.10] * 100', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082031', 'MD2.9', 'D2.9 无线网络连接成功次数（含A8、A10 接口）', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082032', 'MD2.10', 'D2.10 无线网络连接请求次数（含A8、A10 接口）', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082033', 'MD2.11', 'D2.11 用户早释率', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082034', 'MD2.12', 'D2.12 用户早释次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082039', 'MD2.17', 'D2.17 无线连接释放次数(不含PDSN 要求释放次数)', '[MD2.16] - [MD2.18]', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082040', 'MD2.18', 'D2.18 PDSN原因要求释放次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082045', 'MD2.23', 'D2.23 网络掉线率', 'CASE WHEN (SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))=0 THEN 0 ELSE ROUND((SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))/(SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100,2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082048', 'MD2.26', 'D2.26 DRC 前向速率为﹝小于307.2K﹞的申请比率', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_LESS_3072_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081037', 'MC4.5', '业务信道分配请求次数(不含切)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082056', 'MD3.6', 'D3.6 Session接入鉴权成功率', 'CASE WHEN SUM(AUTH_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AUTH_SUC_DO) / SUM(AUTH_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082061', 'MD3.11', 'D3.11 Session协商成功率', 'CASE WHEN (SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO) / (SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082064', 'MD3.14', 'D3.14 Session跨AN Dormant切换成功率(%)', '[MD3.16] /  [MD3.15] * 100', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082065', 'MD3.15', 'D3.15 Session跨AN Dormant切换次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082066', 'MD3.16', 'D3.16 Session跨AN Dormant切换成功次数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082067', 'MD3.17', 'D3.17 Session会话数', 'SUM(SESSION_ACTIVE_NUM_DO)+SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082071', 'MD4.2', 'D4.2 用户从Dormant态到Active态的激活请求总次数', 'SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082072', 'MD4.3', 'D4.3 用户从Dormant态到Active态的激活成功总次数', 'SUM(AT_DOR2ACT_SUC_DO) + SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082073', 'MD4.4', 'D4.4 AT 发起的Dormant态到Active态的激活成功率', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO) / SUM(AT_DOR2ACT_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082077', 'MD4.8', 'D4.8 AN发起的Dormant态到Active态激活成功率', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AN_DOR2ACT_SUC_DO) / SUM(AN_DOR2ACT_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082085', 'MD5.5', 'D5.5 软切换因子', 'CASE WHEN SUM(TRAFFIC_DO_COMMON)=0 THEN 0 ELSE ROUND((ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)-SUM(TRAFFIC_DO_COMMON)) / SUM(TRAFFIC_DO_COMMON) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082092', 'MD6.7', 'D6.7 PCF反向分组丢包率', 'CASE WHEN SUM(REV_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(REV_PAK_DISCARD_NUM_DO) / SUM(REV_PAK_TOTAL_NUM_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082093', 'MD6.8', 'D6.8 PCF前向分组丢包率', 'CASE WHEN SUM(FWD_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(FWD_PAK_DISCARD_NUM_DO) / SUM(FWD_PAK_TOTAL_NUM_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082095', 'MD6.10', 'D6.10 前向RLP重传率', 'CASE WHEN SUM(FTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO) / SUM(FTCH_RLP_TX_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082097', 'MD6.12', 'D6.12 反向RLP重传率', 'CASE WHEN SUM(RTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(RTCH_RLP_RETX_DO) / SUM(RTCH_RLP_TX_DO)/1024 * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082099', 'MD6.14', 'D6.14 前向业务信道物理层突发吞吐量', '[MD10.14] / ([MD10.15] * 100)', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082049', 'MD2.27', 'D2.27 DRC 前向速率为﹝307.2K ～1228K﹞的申请比率', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_3072_1228_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082101', 'MD6.16', 'D6.16 反向业务信道物理层突发吞吐量', '[MD10.16] / ([MD10.17] * 100)', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082103', 'MD6.18', 'D6.18 前向物理层控制信道时隙占用率', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082104', 'MD6.19', 'D6.19 反向接入信道时隙占用率', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081063', 'MC4.31', '业务信道分配请求次数(不含切)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081069', 'MC4.37', '业务信道分配请求次数-硬切换-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081070', 'MC4.38', '业务信道分配成功次数-硬切换-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081108', 'MC5.34', 'BS内硬切换请求次数', 'SUM(INNER_BSC_HHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081109', 'MC5.35', 'BS内硬切换成功次数', 'SUM(INNER_BSC_HHO_SUCC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081114', 'MC5.40', 'BS内更软切换请求次数', 'SUM(INTRA_BS_SSHO_ATT_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081115', 'MC5.41', 'BS内更软切换成功次数', 'SUM(INTRA_BS_SSHO_SUC_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081128', 'MC6.6', '信道配置总数', 'SUM(CH_CFG_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081129', 'MC6.7', '信道可用数', 'SUM(CH_RLB_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081130', 'MC6.8', '信道最大占用数', 'SUM(FWD_CH_MAX_NUM)+SUM(REV_CH_MAX_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081131', 'MC6.9', '信道最大占用率(%)', 'CASE WHEN SUM(CH_RLB_NUM)=0 THEN 0 ELSE ROUND((SUM(FWD_CH_MAX_NUM) + SUM(REV_CH_MAX_NUM)) / SUM(CH_RLB_NUM) * 100,4) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081133', 'MC6.11', '前向信道可用数', 'SUM(FWD_CH_RLB_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081134', 'MC6.12', '前向信道最大占用数', 'SUM(FWD_CH_MAX_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081135', 'MC6.13', '前向信道最大占用率(%)', 'SUM(FWD_TCH_MAX_OCCU_RATE)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081137', 'MC6.15', '反向信道可用数', 'SUM(REV_CH_RLB_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081138', 'MC6.16', '反向信道最大占用数', 'SUM(REV_CH_MAX_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081139', 'MC6.17', '反向信道最大占用率(%)', 'SUM(REV_TCH_MAX_OCCU_RATE)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081141', 'MC7.2', '前向传输总帧数-不包括重传', 'SUM(FRM_NUM_FWD_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081142', 'MC7.3', 'RLP在前向信道中发送的数据量-不含重传(KB)', 'SUM(DATA_THROUGHPUT_FWD_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081143', 'MC7.4', 'RLP在前向信道中重传的数据量(字节)', 'SUM(FTCH_RLP_RETX_BYTE_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081146', 'MC7.7', '反向重传总帧数', 'SUM(RETX_FRM_NUM_REV_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081147', 'MC7.8', '反向传输总帧数-不包括重传', 'SUM(TX_FRM_NUM_REV_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081148', 'MC7.9', 'RLP在反向信道中接收的数据量(KB)', 'SUM(DATA_THROUGHPUT_REV_1X)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082102', 'MD6.17', 'D6.17 前向物理层业务信道时隙占用率', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),3)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081178', 'MC10.1', 'C10.1信道单元可用数', 'SUM(CH_RLB_NUM)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082008', 'MD1.8', 'D1.8 反向CE最大忙数', 'SUM(RCE_MAX_BUSY_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082009', 'MD1.9', 'D1.9 反向CE可用数', 'SUM(RCE_RLB_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082011', 'MD1.11', 'D1.11 前向业务MacIndex最大忙数', 'SUM(FWD_MACINDEX_MAX_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082035', 'MD2.13', 'D2.13 无线连接建立失败次数（原因为分配资源失败）', 'SUM(CONN_SETUP_FAILED_RESF_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082036', 'MD2.14', 'D2.14 无线连接建立失败次数（原因为反向业务信道俘获失败）', 'SUM(CONN_SETUP_FAILED_FEVF_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082037', 'MD2.15', 'D2.15 无线连接建立失败次数（原因为没有收到TCC 消息）', 'SUM(CONN_SETUP_FAILED_NOTCC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082054', 'MD3.4', 'D3.4 UATI分配失败次数', 'SUM(UATI_ATT_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082055', 'MD3.5', 'D3.5 UATI平均建立时长', 'SUM(UATI_AVG_SETUP_DURATION_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082057', 'MD3.7', 'D3.7 Session接入鉴权成功次数', 'SUM(AUTH_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082058', 'MD3.8', 'D3.8 Session接入鉴权请求次数', 'SUM(AUTH_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082059', 'MD3.9', 'D3.9 Session接入鉴权拒绝次数', 'SUM(AUTH_DENY_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082060', 'MD3.10', 'D3.10 Session接入鉴权失败次数', 'SUM(AUTH_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082062', 'MD3.12', 'D3.12 Session协商成功次数', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082063', 'MD3.13', 'D3.13 Session协商失败次数', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082068', 'MD3.18', 'D3.18 Active态Session会话数', 'SUM(SESSION_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082069', 'MD3.19', 'D3.19 非Active态Session会话数', 'SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082074', 'MD4.5', 'D4.5 AT 发起的Dormant态到Active态激活请求次数', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082075', 'MD4.6', 'D4.6 AT 发起的Dormant态到Active态激活成功次数', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082076', 'MD4.7', 'D4.7 AT发起的Dormant 态到Active 态激活失败次数', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082078', 'MD4.9', 'D4.9 AN发起的Dormant到Active态的激活请求次数', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082079', 'MD4.10', 'D4.10 AN发起的Dormant到Active态的激活成功次数', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082116', 'MD7.11', 'D7.11 AN内硬切换请求次数', 'SUM(INN_AN_HHO_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082080', 'MD4.11', 'D4.11 AN发起的Dormant态到Active态的激活失败次数', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082082', 'MD5.2', 'D5.2 呼叫话务量', 'SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082083', 'MD5.3', 'D5.3 CE话务量', 'ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082084', 'MD5.4', 'D5.4 软切换话务量', 'ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)-SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082081', 'MD5.1', 'D5.1 等效用户数', 'SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082117', 'MD7.12', 'D7.12 AN内硬切换成功次数', 'SUM(INN_AN_HHO_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082118', 'MD7.13', 'D7.13 AN间硬切换成功率', 'CASE WHEN (SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(INTER_AN_HHO_IN_SUC_DO)+SUM(INTER_AN_HHO_OUT_SUC_DO)) / (SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082121', 'MD8.1', 'D8.1 寻呼响应率', 'CASE WHEN SUM(PAGE_ATT_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(PAGE_SUC_NUM_DO)/SUM(PAGE_ATT_NUM_DO)*100,4) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082124', 'MD9.1', '存在DO载频(37)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082125', 'MD9.2', '存在DO载频(78)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082126', 'MD9.3', '存在DO载频(119)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082127', 'MD9.4', 'DO载频总数', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082128', 'MD9.5', 'Do载频话务量(37)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082129', 'MD9.6', 'Do载频话务量(78)', '', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082123', 'MD8.3', 'D8.3 寻呼响应总次数', 'SUM(PAGE_SUC_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082145', 'MD10.11', 'DRC 前向速率为﹝小于307.2K﹞的申请次数', 'SUM(DRC_FWD_LESS_3072_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082146', 'MD10.12', 'DRC 前向速率为﹝307.2K ～1228K﹞的申请次数', 'SUM(DRC_FWD_3072_1228_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082147', 'MD10.13', 'DRC 前向速率为﹝大于1228K﹞的申请次数', 'SUM(DRC_FWD_MORE_1228_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082137', 'MD10.3', 'Session建立总时长', 'SUM(SESS_SETUP_TOTAL_DUR_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082144', 'MD10.10', '前向业务MacIndex可用数', 'SUM(FWD_MACINDEX_AVA_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081087', 'MC5.13', '更软切换请求次数-CS', 'SUM(S_SSHO_ATT)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081088', 'MC5.14', '更软切换成功次数-CS', 'SUM(S_SSHO_SUC)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081089', 'MC5.15', '更软切换成功率-CS(%)', 'CASE WHEN SUM(S_SSHO_ATT) = 0 THEN 0 ELSE ROUND(SUM(S_SSHO_SUC) / SUM(S_SSHO_ATT),4)*100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081072', 'MC4.40', '业务信道分配请求次数-软切换-PS', 'SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081073', 'MC4.41', '业务信道分配成功次数-软切换-PS', 'SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081093', 'MC5.19', '硬切换请求次数-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081094', 'MC5.20', '硬切换成功次数-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081095', 'MC5.21', '硬切换成功率-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_HHO_PS) / SUM(TCH_ASSIGN_ATT_HHO_PS),4)*100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081022', 'MC2.13', '更软切换话务量-PS(Erl)', 'SUM(FCH_WALSHCODE_TRAFFIC_PS)-SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081053', 'MC4.21', '业务信道分配请求次数-硬切换-CS', 'SUM(TCH_ASSIGN_ATT_HHO_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081054', 'MC4.22', '业务信道分配成功次数-硬切换-CS', 'SUM(TCH_ASSIGN_SUC_HHO_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081056', 'MC4.24', '业务信道分配请求次数-软切换-CS', 'SUM(TCH_ASSIGN_ATT_SHO_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081057', 'MC4.25', '业务信道分配成功次数-软切换-CS', 'SUM(TCH_ASSIGN_SUC_SHO_CS)', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082086', 'MD6.1', 'D6.1 PCF反向数据流量', 'SUM(REV_THROUGHOUT_PCF_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082087', 'MD6.2', 'D6.2 PCF前向数据流量', 'SUM(FWD_THROUGHOUT_PCF_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082109', 'MD7.4', 'D7.4 AN内软切换成功率', 'CASE WHEN SUM(INN_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_BS_SHO_SUC_DO) / SUM(INN_BS_SHO_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082112', 'MD7.7', 'D7.7 AN间软切换成功率', 'CASE WHEN SUM(INTER_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_BS_SHO_SUC_DO)/SUM(INTER_BS_SHO_ATT_DO),4) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082115', 'MD7.10', 'D7.10 AN内硬切换成功率', 'DECODE(SUM(INN_AN_HHO_ATT_DO),0,0,ROUND(SUM(INN_AN_HHO_SUC_DO)/SUM(INN_AN_HHO_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082088', 'MD6.3', 'D6.3 PCF接收的反向分组业务的总包数', 'SUM(REV_PAK_TOTAL_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082089', 'MD6.4', 'D6.4 PCF接收的前向分组数据的总包数', 'SUM(FWD_PAK_TOTAL_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082090', 'MD6.5', 'D6.5 反向分组业务在PCF丢弃的包数', 'SUM(REV_PAK_DISCARD_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082091', 'MD6.6', 'D6.6 前向分组业务在PCF丢弃的包数', 'SUM(FWD_PAK_DISCARD_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082094', 'MD6.9', 'D6.9 前向RLP数据吞吐量', 'ROUND(SUM(FTCH_RLP_TX_DO) * 8 / 1000 / 3600,4)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082096', 'MD6.11', 'D6.11 反向RLP数据吞吐量', 'ROUND(SUM(RTCH_RLP_TX_DO) * 8 / 3600,4)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082110', 'MD7.5', 'D7.5 AN内软切换请求次数', 'SUM(INN_BS_SHO_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082111', 'MD7.6', 'D7.6 AN内软切换成功次数', 'SUM(INN_BS_SHO_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082113', 'MD7.8', 'D7.8 AN间软切换请求次数', 'SUM(INTER_BS_SHO_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082114', 'MD7.9', 'D7.9 AN间软切换成功次数', 'SUM(INTER_BS_SHO_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082119', 'MD7.14', 'D7.14 AN间硬切换请求次数', 'SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082120', 'MD7.15', 'D7.15 AN间硬切换成功次数', 'SUM(INTER_AN_HHO_IN_SUC_DO)+SUM(INTER_AN_HHO_OUT_SUC_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082122', 'MD8.2', 'D8.2 寻呼请求次数', 'SUM(PAGE_ATT_NUM_DO)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082044', 'MD2.22', 'D2.22 无线掉线率', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082026', 'MD2.4', 'D2.4 AT发起的无线连接请求次数', 'SUM(nvl(AT_CONN_ATT_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081017', 'MC2.8', '软切换比例-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081011', 'MC2.2', '业务信道话务量(不含切)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082098', 'MD6.13', 'D6.13 前向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081164', 'MC9.2', 'C3.2软切换因子(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081180', 'MC10.3', 'C10.3业务信道承载的话务量(含切换)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041102', 'MC5.28', 'BS内切换请求次数', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041103', 'MC5.29', 'BS内切换成功次数', 'SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INNER_BSC_SOFTERHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041105', 'MC5.31', 'BS间切换请求次数', 'SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041106', 'MC5.32', 'BS间切换成功次数', 'SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041107', 'MC5.33', 'BS间切换成功率(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND((SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC))/(SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041108', 'MC5.34', 'BS内硬切换请求次数', 'SUM(INNER_BSC_HHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041109', 'MC5.35', 'BS内硬切换成功次数', 'SUM(INNER_BSC_HHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041110', 'MC5.36', 'BS内硬切换成功率(%)', 'CASE WHEN SUM(INNER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_HHO_SUCC) / SUM(INNER_BSC_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041111', 'MC5.37', 'BS内软切换请求次数', 'SUM(INNER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041112', 'MC5.38', 'BS内软切换成功次数', 'SUM(INNER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041113', 'MC5.39', 'BS内软切换成功率(%)', 'CASE WHEN SUM(INNER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SHO_SUCC) / SUM(INNER_BSC_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041114', 'MC5.40', 'BS内更软切换请求次数', 'SUM(INNER_BSC_SOFTERHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041115', 'MC5.41', 'BS内更软切换成功次数', 'SUM(INNER_BSC_SOFTERHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041117', 'MC5.43', 'BS间硬切换请求次数', 'SUM(INTER_BSC_HHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041118', 'MC5.44', 'BS间硬切换成功次数', 'SUM(INTER_BSC_HHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041119', 'MC5.45', 'BS间硬切换成功率(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_HHO_SUCC) / SUM(INTER_BSC_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041120', 'MC5.46', 'BS间软切换请求次数', 'SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041121', 'MC5.47', 'BS间软切换成功次数', 'SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041122', 'MC5.48', 'BS间软切换成功率(%)', 'CASE WHEN SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_SHO_SUCC) / SUM(INTER_BSC_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041128', 'MC6.6', '信道配置总数', 'SUM(FWD_CH_NUM)+SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041129', 'MC6.7', '信道可用数', 'SUM(FWD_CH_RLB_NUM)+SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041130', 'MC6.8', '信道最大占用数', 'SUM(FWD_CH_MAX_NUM)+SUM(REV_CH_MAX_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041131', 'MC6.9', '信道最大占用率(%)', 'CASE WHEN SUM(FWD_CH_RLB_NUM) + SUM(REV_CH_RLB_NUM)=0 THEN 0 ELSE ROUND((SUM(FWD_CH_MAX_NUM) + SUM(REV_CH_MAX_NUM))/(SUM(FWD_CH_RLB_NUM) + SUM(REV_CH_RLB_NUM)) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041132', 'MC6.10', '前向信道配置总数', 'SUM(FWD_CH_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041133', 'MC6.11', '前向信道可用数', 'SUM(FWD_CH_RLB_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041134', 'MC6.12', '前向信道最大占用数', 'SUM(FWD_CH_MAX_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041116', 'MC5.42', 'BS内更软切换成功率(%)', 'CASE WHEN SUM(INNER_BSC_SOFTERHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SOFTERHO_SUCC) / SUM(INNER_BSC_SOFTERHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041135', 'MC6.13', '前向信道最大占用率(%)', 'CASE WHEN SUM(FWD_CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(FWD_CH_MAX_NUM) / SUM(FWD_CH_RLB_NUM),4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041136', 'MC6.14', '反向信道配置总数', 'SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041137', 'MC6.15', '反向信道可用数', 'SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4036', '', '机械倾角', 'SECTOR.ANT_ENGINE_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4038', '', '天线数量', 'SECTOR.ANT_NUM', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4039', '', '天线水平3db波瓣宽度', 'SECTOR.HORIZONTAL', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4041', '', '是否扇区分裂', 'SECTOR.ISCELLSPLIT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4043', '', '软件版本', 'case BSC.vendor
when ''ZY0808'' then ''BSC6680''
when ''ZY0804'' then ''V8''
when ''ZY0810'' then ''R32'' end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4044', '', '1X载扇数量', 'DECODE(SECTOR.ISDO,0,SECTOR.CARRIER_NUM,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4045', '', '1X信道板数量', 'DECODE(BTS.ISDO,0,BTS.TCH_COUNT,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4046', '', '1X信道配置数', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4048', '', '系统类型', 'BTS.SITE_TYPE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4049', '', '是否DO扇区', 'DECODE(SECTOR.ISDO,0,''否'',1,''是'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4052', '', 'DO信道配置数', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4053', '', 'DO站型配置', 'DECODE(BTS.ISDO,1,BTS.SITE_MODEL,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4054', '', '是否多载波边界', 'SECTOR.BORDERSECTOR', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4056', '', '接壤省份名称', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4057', '', '接壤城市名称', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4059', '', '伪导频频点', 'SECTOR.FAKEPILOT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4060', '', '是否安装塔顶放大器', 'SECTOR.ISTOWER', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4062', '', '环境类型', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4063', '', '环境描述', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4064', '', '场景类型1', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4065', '', '场景类型2', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4066', '', '场景类型3', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4067', '', '场景描述', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4068', '', '建筑类型', 'BTS.ARCHITECTURE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4069', '', '地址', 'BTS.ADDRESS', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4007', '', '地理归属', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4008', '', '厂商侧基站标识', 'case BSC.vendor
when ''ZY0808'' then BTS.BTS_ID
when ''ZY0804'' then BTS.BTS_ID
when ''ZY0810'' then BTS.BTS_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4070', '', '备注', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4071', '', '预留1', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4072', '', '预留2', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4073', '', '预留3', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4074', '', '预留4', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4075', '', '预留5', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4035', '', '电子下倾角', 'SECTOR.ANT_ELECTRON_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4037', '', '天线是否可以电调', 'SECTOR.ISELECADJUST', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4040', '', '天线垂直3db波瓣宽度', 'SECTOR.VERTICAL', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4042', '', '所属厂家', 'case BSC.vendor when ''ZY0808'' THEN ''华为'' when ''ZY0810'' THEN ''阿朗'' when ''ZY0804'' THEN ''中兴'' end ', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4047', '', '1X站型配置', 'DECODE(BTS.ISDO,0,BTS.SITE_MODEL,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4050', '', 'DO载扇数量', 'DECODE(SECTOR.ISDO,1,SECTOR.CARRIER_NUM,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4051', '', 'DO信道板配置数量', 'DECODE(BTS.ISDO,1,BTS.TCH_COUNT,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4058', '', '是否使用伪导频', 'DECODE(SECTOR.FAKEPILOT,NULL,''否'',''是'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082105', 'MD6.20', 'D6.20 反向链路繁忙率', '[MD10.8] / ([MD10.8] + [MD10.9]) * 100', 'ZY0808', '', '2', 'DO华为公式', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081181', 'MC10.4', 'C10.4业务信道承载的话务量(不含切换)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082100', 'MD6.15', 'D6.15 反向业务信道物理层平均吞吐量', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082023', 'MD2.1', 'D2.1 无线连接成功率', 'CASE WHEN SUM(nvl(DO_CONN_ATT,0))=0 THEN 0 WHEN SUM(nvl(DO_SUC_CONN_NUM,0))>=SUM(nvl(DO_CONN_ATT,0)) THEN 99.99 ELSE ROUND(SUM(nvl(DO_SUC_CONN_NUM,0)) / SUM(nvl(DO_CONN_ATT,0)) * 100, 2) END', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082041', 'MD2.19', 'D2.19 无线掉线次数（空口丢失）', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081028', 'MC3.5', '业务信道掉话率-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0808', '', '1', '华为1X公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082038', 'MD2.16', 'D2.16 无线连接释放次数(含PDSN 要求释放次数)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082042', 'MD2.20', 'D2.20 无线掉线次数（硬切换失败导致的掉线）', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082043', 'MD2.21', 'D2.21 无线掉线次数（其他原因）', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0808', '', '2', 'DO华为公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4061', '', '是否安装基站放大器', 'SECTOR.ISAMPLIFIER', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4002', '', '扇区标识', 'case BSC.vendor
when ''ZY0808'' then  CITY.ENNAME||''_''||MSC.MSCNAME||''.''||BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID
when ''ZY0804'' then  BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID
when ''ZY0810'' then  CITY.ENNAME||''_''||MSC.MSCNAME||''.''||BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID  end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4011', '', '扇区标识_1X', 'case BSC.vendor
when ''ZY0808'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''')
when ''ZY0804'' then  to_char(SECTOR.CI)
when ''ZY0810'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5001', '', '时间戳', '''{0}''', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5002', '', '热点标识', 'HOT.HOTMARK', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5003', '', '省份名称', '''{1}''', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041101', 'MC5.27', '更软切换成功率-PS(%)', 'CASE WHEN SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)=0 THEN 0 ELSE ROUND((SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS))/(SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)) * 100,4) END', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042075', 'MD4.6', 'D4.6 AT 发起的Dormant态到Active态激活成功次数', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042076', 'MD4.7', 'D4.7 AT发起的Dormant 态到Active 态激活失败次数', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042135', 'MD10.1', '数据连接建立总时长', 'SUM(DO_SETUP_TIME)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042136', 'MD10.2', '数据连接占用总时长', 'SUM(DO_CONNECT_TIME)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042137', 'MD10.3', 'Session建立总时长', 'SUM(SESS_SETUP_TOTAL_DUR_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042140', 'MD10.6', '反向重传字节数', 'SUM(RTCH_RLP_RETX_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042142', 'MD10.8', 'RAB繁忙次数', 'SUM(RAB_BUSY_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042143', 'MD10.9', 'RAB闲次数', 'SUM(RAB_IDLE_NUM_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042148', 'MD10.14', '前向业务信道物理层发送的bit数', 'SUM(FTCH_PHY_TX_BIT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042149', 'MD10.15', '前向物理层发送实际占用时隙时长', 'SUM(FTCH_PHY_SLOT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042150', 'MD10.16', '反向业务信道物理层接收的bit数', 'SUM(RTCH_PHY_TX_BIT_DO)', 'ZY0804', '', '2', 'DO中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041018', 'MC2.9', '业务信道话务量(含切)-PS(Erl)', 'SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041019', 'MC2.10', '业务信道话务量(不含切)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041020', 'MC2.11', 'Walsh码话务量-PS(Erl)', 'SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)+SUM(SSHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X中兴公式', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5004', '', '城市名称', 'CITY.CITY_NAME', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5005', '', '热点名称', 'HOT.HOTNAME', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5006', '', '热点地址', 'HOT.HOTADDR', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5007', '', '热点经度', 'HOT.LONGITUDE', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5008', '', '热点纬度', 'HOT.LATITUDE', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5009', '', '热点使用的AP数量', 'HOT.HOTUSEAPNUM', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5010', '', '热点使用的AC数量', 'HOT.HOTUSEACNUM', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5011', '', '覆盖区关联EVDO扇区信息1', 'to_char(HOT.CELLIDONE)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5012', '', '覆盖区关联EVDO扇区信息2', 'to_char(HOT.CELLIDTWO)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5013', '', '覆盖区关联EVDO扇区信息3', 'to_char(HOT.CELLIDTHREE)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5014', '', '预留字段1', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5015', '', '预留字段2', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5016', '', '预留字段3', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5017', '', '预留字段4', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5018', '', '预留字段5', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6001', '', '时间戳', '''{0}''', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6002', '', '盲点标识', 'BLIND.BLINDID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6003', '', '省份名称', '''{1}''', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6004', '', '城市名称', 'CITY.CITY_NAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6005', '', '盲点详细地点', 'BLIND.BLINDADDRESS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6006', '', '盲点序号', 'BLIND.SERIAL_ID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6007', '', '加入日期', 'BLIND.CREATETIME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6008', '', '盲区编号', 'BLIND.BLINDAREAID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6009', '', '盲区名称', 'BLIND.BLINDNAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6010', '', '盲点所属县市', 'BLIND.BLINDPROPERTYCITY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6011', '', '盲点所属乡镇', 'BLIND.BLINDPROPERTYCITYTOWN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6012', '', '盲点地点别名', 'BLIND.BLINDADDNAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6013', '', '标志性建筑', 'BLIND.MARKBUILD', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6014', '', '盲点级别', 'BLIND.BLINDLEVEL', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6015', '', '盲点经度', 'BLIND.LONGITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6015', '', '盲点纬度', 'BLIND.LATITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6016', '', '盲点区域类型', 'BLIND.AREATYPE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6017', '', '盲点室内外分布', 'BLIND.BLINDINOROUT', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4034', '', '天线俯仰角', 'SECTOR.ANT_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6018', '', '是否1x盲区', 'BLIND.IS1XBLIND', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6019', '', '是否DO盲区', 'BLIND.ISDOCELL', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6020', '', '形成原因', 'BLIND.FORMREASON', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6021', '', '影响半径', 'BLIND.RADIUS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6022', '', '解决方案', 'BLIND.SETPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6023', '', '是否有规划', 'BLIND.ISHASPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6024', '', '规划站名', 'BLIND.PLANSITE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '用户原因类投诉计数', 'COM.USERRELUCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '漫游问题类投诉计数', 'COM.ROAMRESCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '手机上网类投诉计数', 'COM.TELEPHONECOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', 'UIM卡问题类投诉计数', 'COM.UIMRESCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '3G上网类投诉计数', 'COM.THNETCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6025', '', '规划站经度', 'BLIND.PLANSITELONGITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '不明原因类投诉计数', 'COM.NORESCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', '网管数据配置类投诉计数', 'COM.NETMANAGCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', '预留字段1', '', 'ZY0000', '', '1', '客户投诉统计数据上报', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '预留字段2', '', 'ZY0000', '', '1', '客户投诉统计数据上报', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '预留字段3', '', 'ZY0000', '', '1', '客户投诉统计数据上报', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '预留字段4', '', 'ZY0000', '', '1', '客户投诉统计数据上报', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', '预留字段5', '', 'ZY0000', '', '1', '客户投诉统计数据上报', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', '序号', 'HOT.SERIAL_ID', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '辖区城市', 'HOT.CITY_NAME', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', '辖区省份', '''{1}''', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '辖区区/县', 'HOT.AREA_NAME', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '辖区镇区', 'HOT.TOWN_NAME', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '信息点场所或建筑物名称', 'HOT.BUILDNAME', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', '时间戳', '''{0}''', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '信息点详细地址', 'HOT.ADDRESS', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '信息点GPS经度', 'HOT.LONGITUDE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '信息点GPS纬度', 'HOT.LATITUDE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '信息类型所属1级类型', 'HOT.PROPERTYONETYPE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '信息类型所属2级类型', 'HOT.PROPERTYTWOTYPE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '信息类型所属3级类型', 'HOT.PROPERTYTHREETYPE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113012', '', '邻区顺序', 'pro.nbrseq', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113013', '', '切换方法', 'pro.switchtype', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113014', '', '邻扇区标识', 'pro.nei_sid ||''.''||pro.nei_ne_pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113015', '', '邻扇区行政区', 'pro.nei_county_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113016', '', '邻扇区所属MSC标识', 'pro.nei_msc_nam', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113017', '', '邻扇区所属MGW标识', 'pro.nei_mgw', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113018', '', '邻扇区所属BSC标识', 'pro.nei_bsc_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113019', '', '邻扇区所属BTS标识', 'pro.nei_bts_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113020', '', '邻扇区编号', 'pro.nei_cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113021', '', '邻扇区名称', 'pro.nei_cell_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113022', '', '邻pn', 'pro.nei_ne_pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113023', '', '邻扇区所属省', 'pro.nei_province_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113024', '', '邻扇区所属城市', 'pro.nei_city_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113025', '', '邻扇区边界类型', 'pro.bordertype', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113026', '', '邻扇区所属厂家', 'case pro.nei_vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113027', '', '是否为外部邻区', '1', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113050', 'MP4.11.1.1.1', 'ncs_c', 'pro.ncs_c', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113051', 'MP4.11.1.1.2', 'nghbrantf', 'pro.nghbrantf', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113052', 'MP4.11.1.1.3', 'pilot_pn', 'pro.pilot_pn', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113053', 'MP4.11.1.1.4', 'pgn_c', 'pro.pgn_c', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113054', 'MP4.11.1.1.5', 'nghb_conf', 'pro.nghb_conf', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113055', 'MP4.11.1.1.6', 'hdhandoff', 'pro.hdhandoff', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113056', 'MP4.11.1.1.7', 'dcs_c', 'pro.dcs_c', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113057', 'MP4.11.1.1.8', 'ecp_c', 'pro.ecp_c', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113058', 'MP4.11.1.1.9', 'sid_c', 'pro.sid_c', 'ZY0810', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113096', 'MP4.11.2.1.32', 'nbrbandsubclass4', 'pro.nbrbandsubclass4', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113097', 'MP4.11.2.1.33', 'nbrbandsubclass5', 'pro.nbrbandsubclass5', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113098', 'MP4.11.2.1.34', 'directedifhotarget', 'pro.directedifhotarget', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113099', 'MP4.11.2.1.35', 'directedifhotarget2', 'pro.directedifhotarget2', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113100', 'MP4.11.2.1.36', 'directedifhotarget3', 'pro.directedifhotarget3', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113094', 'MP4.11.2.1.37', 'directedifhotarget4', 'pro.directedifhotarget4', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113095', 'MP4.11.2.1.38', 'directedifhotarget5', 'pro.directedifhotarget5', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113065', 'MP4.11.2.1.1', 'hdrsnid', 'pro.hdrsnid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113066', 'MP4.11.2.1.2', 'fmsframeid', 'pro.fmsframeid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113067', 'MP4.11.2.1.3', 'cellsiteid', 'pro.cellsiteid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113068', 'MP4.11.2.1.4', 'sectorid', 'pro.sectorid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113069', 'MP4.11.2.1.5', 'nbrid', 'pro.nbrid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113070', 'MP4.11.2.1.6', 'nbrnbrhdrcellsiteid', 'pro.nbrnbrhdrcellsiteid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113071', 'MP4.11.2.1.7', 'nbrnbrsectorid', 'pro.nbrnbrsectorid', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113072', 'MP4.11.2.1.8', 'nbrwithinsn', 'pro.nbrwithinsn', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113073', 'MP4.11.2.1.9', 'nbrpnoff', 'pro.nbrpnoff', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113074', 'MP4.11.2.1.10', 'nbrsystemtype', 'pro.nbrsystemtype', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113075', 'MP4.11.2.1.11', 'nbrbandclass', 'pro.nbrbandclass', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113076', 'MP4.11.2.1.12', 'nbrbandsubclass', 'pro.nbrbandsubclass', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113077', 'MP4.11.2.1.13', 'nbrchannelnumber', 'pro.nbrchannelnumber', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113078', 'MP4.11.2.1.14', 'nbrsearchwindowsize', 'pro.nbrsearchwindowsize', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113079', 'MP4.11.2.1.15', 'nbrsearchwindowsizecarrier', 'pro.nbrsearchwindowsizecarrier', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113080', 'MP4.11.2.1.16', 'nbrsearchwindowsizecarrier2', 'pro.nbrsearchwindowsizecarrier2', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113081', 'MP4.11.2.1.17', 'nbrsearchwindowsizecarrier3', 'pro.nbrsearchwindowsizecarrier3', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113082', 'MP4.11.2.1.18', 'nbrsearchwindowsizecarrier4', 'pro.nbrsearchwindowsizecarrier4', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113083', 'MP4.11.2.1.19', 'nbrsearchwindowsizecarrier5', 'pro.nbrsearchwindowsizecarrier5', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113084', 'MP4.11.2.1.20', 'nbrsectorasocactiveapipaddress', 'pro.nbrsectorasocactiveapipaddress', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113085', 'MP4.11.2.1.21', 'nbrsectorasocbackupapipaddress', 'pro.nbrsectorasocbackupapipaddress', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113086', 'MP4.11.2.1.22', 'nbrchannelnumber2', 'pro.nbrchannelnumber2', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113087', 'MP4.11.2.1.23', 'nbrchannelnumber3', 'pro.nbrchannelnumber3', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113088', 'MP4.11.2.1.24', 'nbrchannelnumber4', 'pro.nbrchannelnumber4', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113089', 'MP4.11.2.1.25', 'nbrchannelnumber5', 'pro.nbrchannelnumber5', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113090', 'MP4.11.2.1.26', 'nbrbandclass2', 'pro.nbrbandclass2', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113091', 'MP4.11.2.1.27', 'nbrbandclass3', 'pro.nbrbandclass3', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113092', 'MP4.11.2.1.28', 'nbrbandclass4', 'pro.nbrbandclass4', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113093', 'MP4.11.2.1.29', 'nbrbandclass5', 'pro.nbrbandclass5', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113094', 'MP4.11.2.1.30', 'nbrbandsubclass2', 'pro.nbrbandsubclass2', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113095', 'MP4.11.2.1.31', 'nbrbandsubclass3', 'pro.nbrbandsubclass3', 'ZY0810', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113120', '', '源省际边界载扇标识', 'pro.omc_name||''.''||pro.bts_id || ''.''||pro.cell_id||''.''||pro.carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113121', '', '时间戳', '''{0}''', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113122', '', '省份', '''{1}''', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113123', '', '城市', 'pro.city_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113124', '', '源载扇所属MSC标识', 'pro.msc_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113125', '', '源载扇所属MGW标识', 'pro.mgw', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113126', '', '源载扇所属BSC标识', 'pro.msc_name  ||''.''||pro.bsc_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113127', '', '源载扇所属BTS标识', 'pro.msc_name||''.''||pro.bsc_id||''.''||pro.bts_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '1x覆盖等级', 'HOT.ONEXGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', 'DO覆盖等级', 'HOT.DOGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', '移动GSM覆盖等级', 'HOT.MOVEGSMGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '移动TD覆盖等级', 'HOT.MOVETDGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '联通GSM覆盖等级', 'HOT.LINKGSMGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '联通WCDMA覆盖等级', 'HOT.LINKWCDMAGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', 'C网最强信号PN1', 'HOT.CGOODPNONE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', 'C网最强信号PN2', 'HOT.CGOODPNTWO', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', '室内分布方式', 'HOT.INDOORDISTRIBUT', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', 'C网信号未覆盖的位置', 'HOT.CSIGNAL', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', '语音业务重要级', 'HOT.VOICEGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', '数据业务重要级', 'HOT.DATAGRADE', 'ZY0000', '', '1', '测评信息-城区热点', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', '预留字段1', '', 'ZY0000', '', '1', '测评信息-城区热点', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1027', '', '预留字段2', '', 'ZY0000', '', '1', '测评信息-城区热点', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1028', '', '预留字段3', '', 'ZY0000', '', '1', '测评信息-城区热点', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1029', '', '预留字段4', '', 'ZY0000', '', '1', '测评信息-城区热点', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1030', '', '预留字段5', '', 'ZY0000', '', '1', '测评信息-城区热点', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', '时间戳', '''{0}''', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', '序号', 'ROAD.SERIAL_ID', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', '辖区城市', 'ROAD.CITY_NAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', '辖区省份', '''{1}''', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '辖区区/县', 'ROAD.AREA_NAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', '辖区镇区', 'ROAD.TOWN_NAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', '道路类型', 'ROAD.ROADTYPE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '道路名称', 'ROAD.ROADNAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '道路起点名称', 'ROAD.STARNAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '道路起点GPS经度', 'ROAD.STARLONGITUDE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '道路起点GPS纬度', 'ROAD.STARLATITUDE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '道路终点名称', 'ROAD.ENDNAME', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '道路终点GPS经度', 'ROAD.ENDLONGITUDE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '道路终点GPS纬度', 'ROAD.ENDLATITUDE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '道路长度或公里数', 'ROAD.ROADLONG', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '1x覆盖等级', 'ROAD.ONEXGRADE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', 'DO覆盖等级', 'ROAD.DOGRADE', 'ZY0000', '', '2', '测评信息-城市道路', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '预留字段1', '', 'ZY0000', '', '2', '测评信息-城市道路', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '预留字段2', '', 'ZY0000', '', '2', '测评信息-城市道路', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', '预留字段3', '', 'ZY0000', '', '2', '测评信息-城市道路', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '预留字段4', '', 'ZY0000', '', '2', '测评信息-城市道路', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', '预留字段5', '', 'ZY0000', '', '2', '测评信息-城市道路', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3001', '', '时间戳', '''{0}''', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3002', '', '序号', 'TOWN.SERIAL_ID', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3003', '', '辖区城市', 'TOWN.CITY_NAME', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3004', '', '辖区省份', '''{1}''', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3005', '', '辖区区/县', 'TOWN.AREA_NAME', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3006', '', '辖区镇区', 'TOWN.TOWN_NAME', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3007', '', '村名称', 'TOWN.VILLAGENAME', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3008', '', '村中心GPS经度', 'TOWN.VILLAGLONGITUDE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3009', '', '村中心GPS纬度', 'TOWN.VILLAGLATITUDE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3010', '', '出行道路1', 'TOWN.OUTROADONE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3011', '', '出行道路2', 'TOWN.OUTROADTWO', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3012', '', '出行道路3', 'TOWN.OUTROADTHREE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3013', '', '1x覆盖等级', 'TOWN.ONEXGRADE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3014', '', 'DO覆盖等级', 'TOWN.DOGRADE', 'ZY0000', '', '3', '测评信息-行政村', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3015', '', '预留字段1', '', 'ZY0000', '', '3', '测评信息-行政村', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3016', '', '预留字段2', '', 'ZY0000', '', '3', '测评信息-行政村', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3017', '', '预留字段3', '', 'ZY0000', '', '3', '测评信息-行政村', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3018', '', '预留字段4', '', 'ZY0000', '', '3', '测评信息-行政村', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3019', '', '预留字段5', '', 'ZY0000', '', '3', '测评信息-行政村', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1202', '', 'DO率指标', '7,10,16,17,18,23,24,25,30,33,44,45,48,49,50,51,56,61,64,70,73,77,92,93,95,97,102,103,104,105,106,109,112,115,118,121', 'ZY0000', '', '2', 'DO率指标', '1', '12');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1201', '', '1X率指标', '3,6,9,17,23,25,28,31,36,40,42,46,50,52,55,58,62,66,68,71,74,77,80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,131,135,139,145,149,163,164,165,166,172,173,174,175', 'ZY0000', '', '1', '1X率指标', '1', '12');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113128', '', '源载扇所属扇区标识', 'pro.msc_name||''.''||pro.bsc_id||''.''||pro.bts_id||''.''||pro.cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113129', '', '源载扇所属扇区名称', 'pro.cell_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113130', '', '源载扇所属扇区编号', 'pro.cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113131', '', '源载波编号', 'pro.carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113001', '', '源省际边界扇区标识', 'pro.omc_name || ''.'' ||pro.bts_id || ''.'' ||pro.cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6026', '', '规划站纬度', 'BLIND.PLANSITELATITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6027', '', '规划详细地址', 'BLIND.PLANADDRESS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6028', '', '规划站室内外分布', 'BLIND.PLANINDOROUT', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6029', '', '规划站设备类型', 'BLIND.EQUIPMENTTYPE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6030', '', '1X配置', 'BLIND.ONEXDEPLOY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6032', '', '建站理由简述', 'BLIND.BUILDREASON', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6034', '', '计划建站时间', 'BLIND.PLANBUILDTIME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6037', '', '解决进度', 'BLIND.RESOLVE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6039', '', '最终解决方案', 'BLIND.LASTSETPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6040', '', '预留字段1', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6041', '', '预留字段2', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6042', '', '预留字段3', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6043', '', '预留字段4', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6044', '', '预留字段5', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6031', '', 'DO配置', 'BLIND.DODEPLOY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6033', '', '列入几期规划', 'BLIND.PUTONLIST', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6035', '', '填报人', 'BLIND.FILLINMAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6038', '', '解决时间', 'TO_CHAR(BLIND.SETTIME,''YYYY-MM-DD HH24:MI:SS'')', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6036', '', '填报时间', 'TO_CHAR(BLIND.FILLTIME,''YYYY-MM-DD HH24:MI:SS'')', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', '时间戳', 'to_char(COM.accepttime,''yyyy-mm-dd hh24:mi:ss'')', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', '省份名称', '''{0}''', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '城市名称', 'CITY.CITY_NAME', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', '弱覆盖类投诉计数', 'COM.YGCOVERCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '过覆盖类投诉计数', 'COM.CRCOVERCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '导频污染类投诉计数', 'COM.PILOTPOLLCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '干扰类投诉计数', 'COM.OBSTACCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '设备故障类投诉计数', 'COM.EQUIPMENTCOUNT', 'ZY0000', '', '1', '客户投诉统计数据上报', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113002', '', '时间戳', '''{0}''', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113003', '', '源省际边界扇区名称', 'pro.cell_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113004', '', '省份', '''{1}''', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113005', '', '城市', 'pro.city_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113006', '', '源扇区所属MSC标识', 'pro.msc_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113007', '', '源扇区所属MGW标识', 'pro.mgw', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113008', '', '源扇区所属BSC标识', 'pro.msc_name ||''.''||pro.bsc_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113009', '', '源扇区所属BTS标识', 'pro.msc_name || ''.'' || pro.bsc_id ||''.'' ||pro.bts_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113010', '', '源扇区编号', 'pro.cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113011', '', '源pn', 'pro.pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114290', 'MP1.7.2.2.2', '相邻载频', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114291', 'MP1.7.2.2.3', '是否包含相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWININC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114292', 'MP1.7.2.2.4', '相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114293', 'MP1.7.2.2.5', '是否包含相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114294', 'MP1.7.2.2.6', '相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114295', 'MP1.7.2.2.7', '搜索优先级', 'pro.PARA_SRCHP', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114296', 'MP1.7.2.3.1', '中心载频', 'pro.DOPARA_CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114297', 'MP1.7.2.3.2', '相邻载频', 'pro.DOPARA_NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114298', 'MP1.7.2.3.3', '是否包含相邻集分支搜索窗口大小', 'pro.DOPARA_NSRCHWININC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114299', 'MP1.7.2.3.4', '相邻集分支搜索窗口大小', 'pro.DORA_NSRCHWINSIZE', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114300', 'MP1.7.2.3.5', '是否包含相邻集分支搜索窗口偏置', 'pro.DOPARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114301', 'MP1.7.2.3.6', '相邻集分支搜索窗口偏置', 'pro.DOPARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '源扇区所属BTS标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '源扇区编号', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '源pn', 'SECTOR.PN', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '邻区顺序', 'para_sort.sortnum', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '切换方法', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '邻扇区标识', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '邻扇区行政区', 'replace(NEIADM.COUNTY_NAME, ''区'', '''')', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '邻扇区所属MSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '邻扇区所属MGW标识', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '邻扇区所属BSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '邻扇区所属BTS标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', '邻扇区编号', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '邻扇区名称', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', '邻pn', 'NEISECTOR.PN', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '邻扇区所属省', 'NEITZCELL.PROVINCE', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '邻扇区所属城市', 'NEITZCELL.CITY_NAME', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '邻扇区边界类型', 'case NEITZCELL.BORDER_TYPE when ''非边界'' then ''0'' when ''省际边界'' then ''1'' when ''省内边界'' then ''2'' when ''同为省际省内边界'' then ''3'' end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', '邻扇区所属厂家', 'case neitzcell.vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '是否为外部邻区', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8074', '', '源扇区所属BSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME      end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8075', '', '源扇区所属BTS标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8076', '', '源载扇所属扇区标识', 'case BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || BSC.CHINA_NAME || ''.'' ||BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || BSC.CHINA_NAME || ''.'' ||BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8077', '', '源载扇所属扇区名称', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then         replace(SECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8078', '', '源扇区编号', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8079', '', '源载波编号', 'carr.carr_seq', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8080', '', '源载波频点', 'carr.carrier_id', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081', '', '源pn', 'SECTOR.PN', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082', '', '邻区顺序', 'para_sort.sortnum', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8083', '', '切换方法', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8084', '', '邻扇区标识', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8085', '', '邻扇区行政区', 'replace(NEIADM.COUNTY_NAME, ''区'', '''')', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8086', '', '邻扇区所属MSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8087', '', '邻扇区所属MGW标识', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8088', '', '邻扇区所属BSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then          NEIMSC.BSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8089', '', '邻扇区所属BTS标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8090', '', '邻扇区编号', 'case BSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8091', '', '邻扇区名称', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8092', '', '邻载波标识', 'NEICARR.CARR_SEQ', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8093', '', '邻载波频点', 'NEICARR.CARRIER_ID', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8094', '', '邻pn', 'NEISECTOR.PN', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8095', '', '邻扇区所属省', 'NEITZCELL.PROVINCE', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8096', '', '邻扇区所属城市', 'NEITZCELL.CITY_NAME', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8097', '', '邻扇区边界类型', 'case NEITZCELL.BORDER_TYPE when ''非边界'' then ''0'' when ''省际边界'' then ''1'' when ''省内边界'' then ''2'' when ''同为省际省内边界'' then ''3'' end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8098', '', '邻扇区所属厂家', 'case neitzcell.vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8099', '', '是否为外部邻区', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', '源省际边界扇区标识', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', '时间戳', '''{0}''', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', '源省际边界扇区标识', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', '时间戳', '''{0}''', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '源省际边界扇区名称', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', '省份', '''{1}''', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '城市', 'CITY.CITY_NAME', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '源扇区所属MSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '源扇区所属MGW标识', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '源扇区所属BSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '源扇区所属BTS标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8067', '', '源省际边界扇区标识', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8068', '', '时间戳', '''{0}''', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8069', '', '源省际边界扇区名称', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then         replace(SECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8070', '', '省份', '''{1}''', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8071', '', '城市', 'CITY.CITY_NAME', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', '邻pn', 'NEISECTOR.PN', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '邻扇区所属省', 'NEITZCELL.PROVINCE', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '邻扇区所属城市', 'NEITZCELL.CITY_NAME', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '邻扇区边界类型', 'case NEITZCELL.BORDER_TYPE when ''非边界'' then ''0'' when ''省际边界'' then ''1'' when ''省内边界'' then ''2'' when ''同为省际省内边界'' then ''3'' end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', '邻扇区所属厂家', 'case neitzcell.vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '是否为外部邻区', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114056', '', '时间戳', '''{0}''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114057', '', '省份', '''{1}''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114058', '', '城市', 'ne_carr.city_name', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8072', '', '源扇区所属MSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8073', '', '源扇区所属MGW标识', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114241', 'MP1.7.1.3.1', '中心载频', 'pro.CCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114242', 'MP1.7.1.3.2', '相邻载频', 'pro.NBRCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114243', 'MP1.7.1.3.3', '异频优先级', 'pro.DFRSN', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114244', 'MP1.7.1.4.1', '中心载频', 'pro.PARA_CCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114245', 'MP1.7.1.4.2', '相邻载频', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114246', 'MP1.7.1.4.3', '搜索集', 'pro.PARA_SRCHSET', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114247', 'MP1.7.1.4.4', '相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114248', 'MP1.7.1.4.5', '是否包含相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114249', 'MP1.7.1.4.6', '相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114250', 'MP1.7.1.4.7', '搜索优先级', 'pro.PARA_SRCHP', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114286', 'MP1.7.2.1.1', '中心载频', 'pro.CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114287', 'MP1.7.2.1.2', '相邻载频', 'pro.NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114288', 'MP1.7.2.1.3', '同频优先级', 'pro.SFRSN', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114289', 'MP1.7.2.2.1', '中心载频', 'pro.PARA_CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114113', 'MP2.7.1.1.26', 'alias_b', 'nbr_carr.alias_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114114', 'MP2.7.1.1.27', 'ncell_bs_id', 'nbr_carr.ncell_bs_id', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214001', '', '源省际边界载扇标识', 'ne_carr.bscname || ''.'' ||ne_carr.bts || ''.'' ||ne_carr.cell || ''.'' || ne_carr.carr_seq', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214002', '', '时间戳', '''{0}''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214003', '', '省份', '''{1}''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214004', '', '城市', 'ne_carr.city_name', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214005', '', '源载扇所属MSC标识', 'ne_carr.mscname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214006', '', '源载扇所属MGW标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214007', '', '源载扇所属BSC标识', 'ne_carr.bscname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214008', '', '源载扇所属BTS标识', 'ne_carr.bscname || ''.'' || ne_carr.bts', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214009', '', '源载扇所属扇区标识', 'ne_carr.bscname || ''.'' || ne_carr.bts || ''.'' ||ne_carr.cell', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214010', '', '源载扇所属扇区名称', 'replace(ne_carr.cell_name, '','', ''，'')', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214011', '', '源载扇所属扇区编号', 'ne_carr.cell', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214012', '', '源载波编号', 'ne_carr.carr_seq', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214013', '', '源载波频点', 'ne_carr.carr', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214014', '', '源pn', 'ne_carr.pn', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214015', '', '邻区顺序', 'nbr_carr_o.sequence_b', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214016', '', '切换方法', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214017', '', '邻载扇标识', 'bss_ncell.marketid || ''_'' || bss_ncell.ci || ''_'' || bss_ncell.pilot_pn || ''_'' || bss_ncarr_o.channelnumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214018', '', '邻载扇行政区', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214019', '', '邻载扇所属MSC标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214020', '', '邻载扇所属MGW标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214021', '', '邻载扇所属BSC标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214022', '', '邻载扇所属BTS标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214023', '', '邻载扇所属扇区标识', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214024', '', '邻扇区名称', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214025', '', '邻扇区编号', 'bss_ncell_o.nbcellid', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214026', '', '邻载波标识', 'bss_ncarr_o.nbcarrierid', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114059', '', '源载扇所属MSC标识', 'ne_carr.mscname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114112', 'MP2.7.1.1.25', 'locked_b', 'nbr_carr.locked_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214027', '', '邻载波频点', 'bss_ncarr_o.channelnumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214028', '', '邻pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214029', '', '邻扇区所属省', 'bss_ncell.provincename', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214030', '', '邻扇区所属城市', 'bss_ncell.cityname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214031', '', '邻扇区边界类型', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214032', '', '邻扇区所属厂家', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214033', '', '是否为外部邻区', '''1''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214034', 'MP2.7.2.1.1', 'PILOTPN', 'nbr_carr_o.PILOTPN', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214035', 'MP2.7.2.1.2', 'SYSTEMTYPE', 'nbr_carr_o.SYSTEMTYPE', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214036', 'MP2.7.2.1.3', 'BANDCLASS', 'nbr_carr_o.BANDCLASS', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214037', 'MP2.7.2.1.4', 'ChannelNumber', 'nbr_carr_o.ChannelNumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114164', '', '源省际边界载扇标识', 'pro.omc_name || ''.'' || pro.bsc_name || ''.'' ||pro.bts_id || ''.'' ||pro.cell_id || ''.'' || pro.carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114165', '', '时间戳', '''{0}''', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114166', '', '省份', '''{1}''', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114167', '', '城市', 'pro.city_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114168', '', '源载扇所属MSC标识', 'pro.MSC_NAME', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114169', '', '源载扇所属MGW标识', 'pro.mgw', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114170', '', '源载扇所属BSC标识', 'pro.omc_name || ''.''|| pro.bsc_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114171', '', '源载扇所属BTS标识', 'pro.omc_name || ''.''|| pro.bsc_name || ''.'' || pro.bts_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114172', '', '源载扇所属扇区标识', 'pro.omc_name || ''.''|| pro.bsc_name || ''.'' || pro.bts_id || ''.'' ||pro.cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114173', '', '源载扇所属扇区名称', 'replace(pro.cell_name, '','', ''，'')', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114174', '', '源载扇所属扇区编号', 'pro.cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114175', '', '源载波编号', 'pro.carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114176', '', '源载波频点', 'pro.carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114177', '', '源pn', 'pro.pn', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114178', '', '邻区顺序', 'pro.nbrseq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114179', '', '切换方法', 'pro.switchtype', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114180', '', '邻载扇标识', 'pro.nei_sid || ''_'' || pro.nei_bts_id || ''_'' || pro.nei_ne_pn || ''_'' || pro.nei_carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114181', '', '邻载扇行政区', 'pro.nei_county_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114182', '', '邻载扇所属MSC标识', 'pro.nei_msc_nam', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114183', '', '邻载扇所属MGW标识', 'pro.nei_mgw', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114184', '', '邻载扇所属BSC标识', 'pro.nei_bsc_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114185', '', '邻载扇所属BTS标识', 'pro.nei_bts_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114186', '', '邻载扇所属扇区标识', 'pro.nei_cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114187', '', '邻扇区名称', 'pro.nei_cell_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114188', '', '邻扇区编号', 'pro.nei_cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114189', '', '邻载波标识', 'pro.nei_carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114190', '', '邻载波频点', 'pro.nei_carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114191', '', '邻pn', 'pro.nei_ne_pn', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114192', '', '邻扇区所属省', 'pro.nei_province_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114193', '', '邻扇区所属城市', 'pro.nei_city_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114194', '', '邻扇区边界类型', 'pro.bordertype', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114195', '', '邻扇区所属厂家', 'case pro.nei_vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114196', '', '是否为外部邻区', 'pro.isouter', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114197', 'MP1.7.1.1.1', '中心载频', 'pro.CCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114198', 'MP1.7.1.1.2', '相邻载频', 'pro.NBRCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114199', 'MP1.7.1.1.3', '同频优先级', 'pro.SFRSN', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114200', 'MP1.7.1.2.1', '中心载频', 'pro.PARA_CCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114201', 'MP1.7.1.2.2', '相邻载频', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114202', 'MP1.7.1.2.3', '是否包含相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWININC', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114203', 'MP1.7.1.2.4', '相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114204', 'MP1.7.1.2.5', '是否包含相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114205', 'MP1.7.1.2.6', '相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114206', 'MP1.7.1.2.7', '搜索优先级', 'pro.PARA_SRCHP', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214038', 'MP2.7.2.1.5', 'SEARCHWINDOWSIZE', 'nbr_carr_o.SEARCHWINDOWSIZE', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214039', 'MP2.7.2.1.6', 'SEARCHWINDOWOFFSET', 'nbr_carr_o.SEARCHWINDOWOFFSET', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214040', 'MP2.7.2.1.7', 'BCSubnet', 'nbr_carr_o.BCSubnet', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214041', 'MP2.7.2.1.8', 'sequence_b', 'nbr_carr_o.sequence_b', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214042', 'MP2.7.2.1.9', 'CI', 'nbr_carr_o.CI', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113120', '', '源省际边界扇区标识', 'ne_carr.bscname || ''.'' ||ne_carr.bts_id || ''.'' ||ne_carr.sector_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113121', '', '时间戳', '''{0}''', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113122', '', '源省际边界扇区名称', 'ne_carr.china_name', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113123', '', '省份', '''{1}''', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113124', '', '城市', 'ne_carr.cityname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113125', '', '源扇区所属MSC标识', 'ne_carr.mscname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113126', '', '源扇区所属MGW标识', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113127', '', '源扇区所属BSC标识', 'ne_carr.bscname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113128', '', '源扇区所属BTS标识', 'ne_carr.bscname || ''.'' || ne_carr.bts_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113129', '', '源扇区编号', 'ne_carr.sector_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113130', '', '源pn', 'ne_carr.pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113131', '', '邻区顺序', 'nbr_cell.sequence_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113132', '', '切换方法', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113133', '', '邻扇区标识', 'bss_ncell.marketid || ''_'' || bss_ncell.ci || ''_'' ||bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113134', '', '邻扇区行政区', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113135', '', '邻扇区所属MSC标识', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113136', '', '邻扇区所属MGW标识', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113137', '', '邻扇区所属BSC标识', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113138', '', '邻扇区所属BTS标识', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113139', '', '邻扇区编号', 'bss_ncell.gncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113140', '', '邻扇区名称', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113141', '', '邻pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113142', '', '邻扇区所属省', 'bss_ncell.provincename', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113143', '', '邻扇区所属城市', 'bss_ncell.cityname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113144', '', '邻扇区边界类型', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113145', '', '邻扇区所属厂家', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113146', '', '是否为外部邻区', '1', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113147', 'MP2.11.1.1.1', '导频PN序列偏置', 'nbr_cell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113148', 'MP2.11.1.1.2', '相邻小区类型', 'nbr_cell.ncelltype', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113149', 'MP2.11.1.1.3', '相邻小区局向号', 'nbr_cell.ncellofficeid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113150', 'MP2.11.1.1.4', '相邻小区BTS号', 'nbr_cell.ncellsystemid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113151', 'MP2.11.1.1.5', '相邻小区Cell号', 'nbr_cell.ncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113152', 'MP2.11.1.1.6', '邻区全局标示', 'nbr_cell.gncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113153', 'MP2.11.1.1.7', '小区识别鉴别方式', 'nbr_cell.ci_discriminator', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113154', 'MP2.11.1.1.8', '所在位置区域编码', 'nbr_cell.lac', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113155', 'MP2.11.1.1.9', '小区识别', 'nbr_cell.ci', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113156', 'MP2.11.1.1.10', '市场号', 'nbr_cell.marketid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113157', 'MP2.11.1.1.11', '交换号', 'nbr_cell.switchnumber', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113158', 'MP2.11.1.1.12', '协议版本号', 'nbr_cell.p_rev', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113159', 'MP2.11.1.1.13', '小区模式', 'nbr_cell.ncellmode', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113160', 'MP2.11.1.1.14', 'PTT调度服务区ID号', 'nbr_cell.dla_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113161', 'MP2.11.1.1.15', 'ncell_bs_id', 'nbr_cell.ncell_bs_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113162', 'MP2.11.1.1.16', 'alias别名', 'nbr_cell.alias_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113163', 'MP2.11.1.1.17', 'sequence_b', 'nbr_cell.sequence_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', '源省际边界扇区标识', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', '时间戳', '''{0}''', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', '源省际边界扇区名称', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', '省份', '''{1}''', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '城市', 'CITY.CITY_NAME', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', '源扇区所属MSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', '源扇区所属MGW标识', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '源扇区所属BSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '源扇区所属BTS标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '源扇区编号', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '源pn', 'SECTOR.PN', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '邻区顺序', 'para_sort.sortnum', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '切换方法', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '邻扇区标识', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '邻扇区行政区', 'replace(NEIADM.COUNTY_NAME, ''区'', '''')', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '邻扇区所属MSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '邻扇区所属MGW标识', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '邻扇区所属BSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '邻扇区所属BTS标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', '邻扇区编号', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '邻扇区名称', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', 'SID', 'sid.sid', 'ZY0000', '', '1', 'MSC数据', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3024', '', 'SID', 'CITY.SID', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4055', '', '边界扇区类型', 'case  sector.border_type when ''非边界'' then 0
when ''省际边界'' then 1
when ''省内边界'' then 2
when ''同为省际省内边界'' then 3
end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3053', '', '边界基站类型', 'case  BTS.border_type when ''非边界'' then 0
when ''省际边界'' then 1
when ''省内边界'' then 2
when ''同为省际省内边界'' then 3
end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114060', '', '源载扇所属MGW标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114061', '', '源载扇所属BSC标识', 'ne_carr.bscname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114062', '', '源载扇所属BTS标识', 'ne_carr.bscname || ''.'' || ne_carr.bts', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114063', '', '源载扇所属扇区标识', 'ne_carr.bscname || ''.'' || ne_carr.bts || ''.'' ||ne_carr.cell', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114064', '', '源载扇所属扇区名称', 'replace(ne_carr.cell_name, '','', ''，'')', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114065', '', '源载扇所属扇区编号', 'ne_carr.cell', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114066', '', '源载波编号', 'ne_carr.carr_seq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114067', '', '源载波频点', 'ne_carr.carr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114068', '', '源pn', 'ne_carr.pn', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114069', '', '邻区顺序', 'nbr_carr.sequence_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114070', '', '切换方法', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114071', '', '邻载扇标识', 'bss_ncell.marketid || ''_'' || bss_ncell.ci|| ''_'' || bss_ncell.pilot_pn || ''_'' || bss_ncarr.cdma_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114072', '', '邻载扇行政区', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114073', '', '邻载扇所属MSC标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114074', '', '邻载扇所属MGW标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114075', '', '邻载扇所属BSC标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114076', '', '邻载扇所属BTS标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114077', '', '邻载扇所属扇区标识', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114078', '', '邻扇区名称', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114079', '', '邻扇区编号', 'bss_ncell.gncellid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114080', '', '邻载波标识', 'bss_ncarr.gncarrierid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114081', '', '邻载波频点', 'bss_ncarr.cdma_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114082', '', '邻pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114083', '', '邻扇区所属省', 'bss_ncell.provincename', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114084', '', '邻扇区所属城市', 'bss_ncell.cityname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114085', '', '邻扇区边界类型', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114086', '', '邻扇区所属厂家', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114087', '', '是否为外部邻区', '''1''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114088', 'MP2.7.1.1.1', 'bssid', 'nbr_carr.bssid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214344', 'MP1.7.2.4.1', '中心载频', 'pro.CCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214345', 'MP1.7.2.4.2', '相邻载频', 'pro.NBRCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214346', 'MP1.7.2.4.3', '异频优先级', 'pro.DFRSN', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214347', 'MP1.7.2.5.1', '中心载频', 'pro.PARA_CCDMACH', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214348', 'MP1.7.2.5.2', '相邻载频', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214349', 'MP1.7.2.5.3', '搜索集', 'pro.PARA_SRCHSET', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214350', 'MP1.7.2.5.4', '相邻集分支搜索窗口大小', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214351', 'MP1.7.2.5.5', '是否包含相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214352', 'MP1.7.2.5.6', '相邻集分支搜索窗口偏置', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214353', 'MP1.7.2.5.7', '搜索优先级', 'pro.PARA_SRCHP', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214354', 'MP1.7.2.6.1', '中心载频', 'pro.DOPARA_CCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214355', 'MP1.7.2.6.2', '相邻载频', 'pro.DOPARA_NBRCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214356', 'MP1.7.2.6.3', '是否包含相邻集分支搜索窗口大小', 'pro.DOPARA_NSRCHWININC', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214357', 'MP1.7.2.6.4', '相邻集分支搜索窗口大小', 'pro.DOPARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214358', 'MP1.7.2.6.5', '是否包含相邻集分支搜索窗口偏置', 'pro.DOPARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214359', 'MP1.7.2.6.6', '相邻集分支搜索窗口偏置', 'pro.DOPARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114055', '', '源省际边界载扇标识', 'ne_carr.bscname || ''.'' ||ne_carr.bts || ''.'' ||ne_carr.cell || ''.'' || ne_carr.carr_seq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114089', 'MP2.7.1.1.2', 'system', 'nbr_carr.system', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114090', 'MP2.7.1.1.3', 'cellid', 'nbr_carr.cellid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114091', 'MP2.7.1.1.4', 'pilot_pn', 'nbr_carr.pilot_pn', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114092', 'MP2.7.1.1.5', 'carrierid', 'nbr_carr.carrierid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114093', 'MP2.7.1.1.6', 'mscid', 'nbr_carr.mscid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114094', 'MP2.7.1.1.7', 'ci', 'nbr_carr.ci', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114095', 'MP2.7.1.1.8', 'officeid', 'nbr_carr.officeid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '源扇区编号', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '源pn', 'SECTOR.PN', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '邻区顺序', 'para_sort.sortnum', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '切换方法', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '邻扇区标识', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', '邻扇区行政区', 'replace(NEIADM.COUNTY_NAME, ''区'', '''')', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', '邻扇区所属MSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '邻扇区所属MGW标识', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '邻扇区所属BSC标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '邻扇区所属BTS标识', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', '邻扇区编号', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', '邻扇区名称', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', '邻pn', 'NEISECTOR.PN', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', '邻扇区所属省', 'NEITZCELL.PROVINCE', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', '邻扇区所属城市', 'NEITZCELL.CITY_NAME', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', '邻扇区边界类型', 'case NEITZCELL.BORDER_TYPE when ''非边界'' then ''0'' when ''省际边界'' then ''1'' when ''省内边界'' then ''2'' when ''同为省际省内边界'' then ''3'' end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', '邻扇区所属厂家', 'case neitzcell.vendor when ''ZY0808'' then ''华为'' when ''ZY0804'' then ''中兴'' when ''ZY0810'' then ''朗讯'' end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1027', '', '是否为外部邻区', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', '源省际边界扇区名称', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''，'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''，'') end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', '省份', '''{1}''', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '城市', 'CITY.CITY_NAME', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', '源扇区所属MSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', '源扇区所属MGW标识', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '源扇区所属BSC标识', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114096', 'MP2.7.1.1.9', '邻区载频配置', 'nbr_carr.nghbr_config', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114097', 'MP2.7.1.1.10', '邻区导频搜索优先级', 'nbr_carr.search_priority', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114098', 'MP2.7.1.1.11', '导频搜索窗大小', 'nbr_carr.srch_win_nghbr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114099', 'MP2.7.1.1.12', '频率包含指示', 'nbr_carr.freq_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114100', 'MP2.7.1.1.13', '邻区频带类别', 'nbr_carr.nghbr_band', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114101', 'MP2.7.1.1.14', '邻区频率', 'nbr_carr.nghbr_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114102', 'MP2.7.1.1.15', '可否接入入口切换', 'nbr_carr.access_entry_ho', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114103', 'MP2.7.1.1.16', '可否接入切换', 'nbr_carr.access_ho_allowed', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114104', 'MP2.7.1.1.17', '邻区时间信息包含指示长', 'nbr_carr.timing_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114105', 'MP2.7.1.1.18', '邻区发送时间偏置', 'nbr_carr.nghbr_tx_offset', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114106', 'MP2.7.1.1.19', '邻区发送在每个周期的时长', 'nbr_carr.nghbr_tx_duration', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114107', 'MP2.7.1.1.20', '邻区发送时长', 'nbr_carr.nghbr_tx_period', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114108', 'MP2.7.1.1.21', '邻区导频附加信息包含指示', 'nbr_carr.add_pilot_rec_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114109', 'MP2.7.1.1.22', '邻区导频信息记录类型', 'nbr_carr.nghbr_pilot_rec_type', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114110', 'MP2.7.1.1.23', '邻区导频搜索窗大小的偏置', 'nbr_carr.srch_offset_nghbr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114111', 'MP2.7.1.1.24', 'sequence_b', 'nbr_carr.sequence_b', 'ZY0804', '', '1', '', '1', '14');

