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
values ('8082050', 'MD2.28', 'D2.28 DRC ǰ������Ϊ�z����1228K�{���������', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_MORE_1228_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081060', 'MC4.28', 'ҵ���ŵ�����ɹ�����(����)-PS', 'SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081061', 'MC4.29', 'ҵ���ŵ�����ʧ�ܴ���(����)-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081062', 'MC4.30', 'ҵ���ŵ�����ɹ���(����)-PS(%)', 'CASE WHEN (SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS))=0 THEN 0 ELSE ROUND((SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))/(SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081065', 'MC4.33', 'ҵ���ŵ�����ʧ�ܴ���(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081066', 'MC4.34', 'ҵ���ŵ�����ɹ���(������)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_SETUP_SUCC_PS,0))/SUM(TCH_ASSIGN_ATT_PS) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081067', 'MC4.35', 'ҵ���ŵ�ӵ������-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081068', 'MC4.36', 'ҵ���ŵ�ӵ����-PS(%)', 'CASE WHEN (SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS))=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)-(SUM(nvl(TCH_SETUP_SUCC_PS,0))+SUM(TCH_ASSIGN_SUC_HHO_PS)+SUM(TCH_ASSIGN_SUC_SHO_PS)))/(SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081071', 'MC4.39', 'ҵ���ŵ�ӵ����-Ӳ�л�PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_PS)-SUM(TCH_ASSIGN_SUC_HHO_PS))/SUM(TCH_ASSIGN_ATT_HHO_PS)* 100, 2) END  ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081103', 'MC5.29', 'BS���л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INTRA_BS_SSHO_SUC_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081104', 'MC5.30', 'BS���л��ɹ���(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INTRA_BS_SSHO_SUC_NUM))/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM))* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081105', 'MC5.31', 'BS���л��������', 'SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081106', 'MC5.32', 'BS���л��ɹ�����', 'SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081107', 'MC5.33', 'BS���л��ɹ���(%)', 'CASE WHEN (SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC))/(SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))* 100, 4) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081110', 'MC5.36', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN SUM(INNER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_HHO_SUCC)/SUM(INNER_BSC_HHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081111', 'MC5.37', 'BS�����л��������', 'SUM(INNER_BSC_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081112', 'MC5.38', 'BS�����л��ɹ�����', 'SUM(INNER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081113', 'MC5.39', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(INNER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SHO_SUCC)/SUM(INNER_BSC_SHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081116', 'MC5.42', 'BS�ڸ����л��ɹ���(%)', 'CASE WHEN SUM(INTRA_BS_SSHO_ATT_NUM)=0 THEN 0 ELSE ROUND(SUM(INTRA_BS_SSHO_SUC_NUM)/SUM(INTRA_BS_SSHO_ATT_NUM)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081117', 'MC5.43', 'BS��Ӳ�л��������', 'SUM(INTER_BSC_HHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081118', 'MC5.44', 'BS��Ӳ�л��ɹ�����', 'SUM(INTER_BSC_HHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081119', 'MC5.45', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_HHO_SUCC)/SUM(INTER_BSC_HHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081120', 'MC5.46', 'BS�����л��������', 'SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081121', 'MC5.47', 'BS�����л��ɹ�����', 'SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081122', 'MC5.48', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_SHO_SUCC)/SUM(INTER_BSC_SHO_ATT)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081123', 'MC6.1', '��һ��Ƶ(283)��վ��', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081124', 'MC6.2', '�ڶ���Ƶ(201)��վ��', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081125', 'MC6.3', '������Ƶ(242)��վ��', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081126', 'MC6.4', '������Ƶ(160)��վ��', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081127', 'MC6.5', '1X��Ƶ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081132', 'MC6.10', 'ǰ���ŵ���������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081136', 'MC6.14', '�����ŵ���������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081140', 'MC7.1', 'ǰ���ش���֡��', 'SUM(RETX_FRM_NUM_FWD_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081144', 'MC7.5', 'RLPǰ����������(�ֽ�)', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081145', 'MC7.6', 'ǰ���ŵ��ش���(%)', 'CASE WHEN SUM(DATA_THROUGHPUT_FWD_1X)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_BYTE_1X)/(1024*SUM(DATA_THROUGHPUT_FWD_1X))* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081149', 'MC7.10', '�����ŵ��ش���(%)', 'CASE WHEN SUM(TX_FRM_NUM_REV_1X)=0 THEN 0 ELSE ROUND(SUM(RETX_FRM_NUM_REV_1X)/SUM(TX_FRM_NUM_REV_1X)* 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081150', 'MC8.1', 'C1.19��վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081151', 'MC8.2', 'C1.20����Ƶ��վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081152', 'MC8.3', 'C1.21˫��Ƶ��վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081153', 'MC8.4', 'C1.22����Ƶ��վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081154', 'MC8.5', 'C1.23����Ƶ��վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081155', 'MC8.6', 'C1.24С������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081156', 'MC8.7', 'C1.25����ƵС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081157', 'MC8.8', 'C1.26˫��ƵС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081158', 'MC8.9', 'C1.27����ƵС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081159', 'MC8.10', 'C1.28����ƵС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081160', 'MC8.11', 'C1.31�ŵ���Ԫ��������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081161', 'MC8.12', 'C1.32��������', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081162', 'MC8.13', 'C1.33ҵ���ŵ�������', 'SUM(CH_CFG_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081163', 'MC9.1', 'C3.1ҵ���ŵ�������(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081165', 'MC9.3', 'C3.3�ŵ���Ԫ������(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081166', 'MC9.4', 'C3.4ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT)*100,4) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081167', 'MC9.5', 'C3.5��æС������(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081168', 'MC9.6', 'C3.6æС������(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081169', 'MC9.7', 'C3.7����С������(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081170', 'MC9.8', 'C3.8���������վ����(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081184', 'MC10.7', 'C10.7�ڶ���Ƶ(201)������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081185', 'MC10.8', 'C10.8������Ƶ(242)������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081186', 'MC10.9', 'C10.9������Ƶ(160)������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081187', 'MC10.10', 'C10.10��æС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081188', 'MC10.11', 'C10.11æС������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081189', 'MC10.12', 'C10.12����С������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081190', 'MC10.13', 'C11.17��С������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081191', 'MC10.14', 'C10.13���������վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081192', 'MC10.15', 'C10.14�����վ����', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081193', 'MC11.1', 'C11.4����ҵ���ŵ������������(�����л���������)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081194', 'MC11.2', 'C11.5����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081171', 'MC9.9', 'C3.9�����վ����(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081172', 'MC9.10', 'C6.2��վϵͳӲ�л��ɹ���(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081173', 'MC9.11', 'C6.3ϵͳ���л��ɹ���(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081174', 'MC9.12', 'C6.4ҵ���ŵ�������(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081175', 'MC9.13', 'C6.5ͨ���ж���(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081176', 'MC9.14', 'C6.6ƽ���������', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)) * 100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081177', 'MC9.15', 'C6.7��С������(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081179', 'MC10.2', 'C10.2ҵ���ŵ�ӵ������(���л�)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081182', 'MC10.5', 'C10.5WALSH����ػ�����', 'SUM(WALSHCODE_ERL)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081183', 'MC10.6', 'C10.6��һ��Ƶ(283)������', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081195', 'MC11.3', 'C11.6����ҵ���ŵ������������(�����л���������)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081196', 'MC11.4', 'C11.7����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081197', 'MC11.5', 'C11.8ҵ���ŵ������������(�����л�������)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081198', 'MC11.6', 'C11.9ҵ���ŵ�����ɹ�����(�����л�������)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081199', 'MC11.7', 'C11.10ҵ���ŵ������������(���л�������)', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081200', 'MC11.8', 'C11.11ҵ���ŵ�����ɹ�����(���л�������)', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081201', 'MC11.9', 'C11.12��վϵͳӲ�л��������', 'SUM(BSS_HHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081202', 'MC11.10', 'C11.13��վϵͳӲ�л��ɹ�����', 'SUM(BSS_HHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081203', 'MC11.11', 'C11.14ϵͳ���л��������', 'SUM(S_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081204', 'MC11.12', 'C11.15ϵͳ���л��ɹ�����', 'SUM(S_SHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081206', 'MC11.14', 'C11.18���г����ܴ���', 'SUM(CALL_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082001', 'MD1.1', 'D1.1 DO��վ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082002', 'MD1.2', 'D1.2 ����Ƶ��վ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082003', 'MD1.3', 'D1.3 ˫��Ƶ��վ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082004', 'MD1.4', 'D1.4 ����Ƶ��վ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113132', '', 'Դ�ز�Ƶ��', 'pro.carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113133', '', 'Դpn', 'pro.pn', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113134', '', '����˳��', 'pro.nbrseq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113135', '', '�л�����', 'pro.switchtype', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113136', '', '�����ȱ�ʶ', 'pro.nei_sid || ''_'' || pro.nei_bts_id || ''_'' || pro.nei_ne_pn || ''_'' || pro.nei_carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113137', '', '������������', 'pro.nei_county_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113138', '', '����������MSC��ʶ', 'pro.nei_bsc_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113139', '', '����������MGW��ʶ', 'pro.nei_mgw', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113140', '', '����������BSC��ʶ', 'pro.nei_bsc_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113141', '', '����������BTS��ʶ', 'pro.nei_bts_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113142', '', '����������������ʶ', 'pro.nei_cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113143', '', '����������', 'pro.nei_cell_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113144', '', '���������', 'pro.nei_cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113145', '', '���ز���ʶ', 'pro.nei_carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113146', '', '���ز�Ƶ��', 'pro.nei_carr_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113147', '', '��pn', 'pro.nei_ne_pn', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113148', '', '����������ʡ', 'pro.nei_province_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113149', '', '��������������', 'pro.nei_city_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113150', '', '�������߽�����', 'pro.bordertype', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113151', '', '��������������', 'case pro.nei_vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113152', '', '�Ƿ�Ϊ�ⲿ����', 'pro.isouter', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082051', 'MD3.1', 'D3.1 UATI����ɹ���', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082106', 'MD7.1', 'D7.1 ȫ�����л��ɹ���', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081001', 'MC1.1', '���г��Դ���', 'sum(nvl(CALL_ATT_CS,0))+sum(nvl(CALL_ATT_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081002', 'MC1.2', '���н����ɹ�����', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(CALL_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081004', 'MC1.4', '���г��Դ���-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081005', 'MC1.5', '���н����ɹ�����-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081024', 'MC3.1', 'ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(TCH_DROP_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081038', 'MC4.6', 'ҵ���ŵ�����ɹ�����(������)', 'SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081048', 'MC4.16', 'ҵ���ŵ�����ɹ�����(������)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081019', 'MC2.10', 'ҵ���ŵ�������(������)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081034', 'MC4.2', 'ҵ���ŵ�����ɹ�����(����)', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081050', 'MC4.18', 'ҵ���ŵ�����ɹ���(������)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ), 4)*100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081013', 'MC2.4', 'ҵ���ŵ�������(������)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081205', 'MC11.13', 'C11.16ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081006', 'MC1.6', '���н����ɹ���-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0  WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082148', 'MD10.14', 'ǰ��ҵ���ŵ�����㷢�͵�bit��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082149', 'MD10.15', 'ǰ������㷢��ʵ��ռ��ʱ϶ʱ��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082150', 'MD10.16', '����ҵ���ŵ��������յ�bit��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081008', 'MC1.8', '���н����ɹ�����-PS', 'SUM(CALL_SETUP_SUCC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081027', 'MC3.4', 'ҵ���ŵ���������-CS', 'SUM(TCH_DROP_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081030', 'MC3.7', 'ҵ���ŵ���������-PS', 'SUM(TCH_DROP_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081007', 'MC1.7', '���г��Դ���-PS', 'SUM(CALL_ATT_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081064', 'MC4.32', 'ҵ���ŵ�����ɹ�����(������)-PS', 'SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081003', 'MC1.3', '���н����ɹ���(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_PS,0))) = 0 THEN 0  WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CALL_SETUP_SUCC_PS,0)))>=(SUM(CALL_ATT) + SUM(CALL_ATT_PS)) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CALL_SETUP_SUCC_PS,0)))/(SUM(CALL_ATT) + SUM(CALL_ATT_PS)),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082151', 'MD10.17', '������������ʵ��ռ��ʱ϶ʱ��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082027', 'MD2.5', 'D2.5 AN��������������������', 'SUM(nvl(AN_CONN_ATT_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082028', 'MD2.6', 'D2.6 AT������������ӳɹ�����', 'SUM(nvl(AT_CONN_SUC_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082029', 'MD2.7', 'D2.7 AN������������ӳɹ�����', 'SUM(nvl(AN_CONN_SUC_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082052', 'MD3.2', 'D3.2 UATI�������', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082053', 'MD3.3', 'D3.3 UATI����ɹ�����', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082107', 'MD7.2', 'D7.2 ȫ�����л��������', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082108', 'MD7.3', 'D7.3 ȫ�����л��ɹ�����', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081042', 'MC4.10', 'ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT)+ (SUM(CALL_ATT_PS)-sum(CALL_SETUP_SUCC_PS)))/SUM(TCH_SETUP_ATT)*100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081052', 'MC4.20', 'ҵ���ŵ�ӵ����-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0   ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT),4)*100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081029', 'MC3.6', '���������-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081032', 'MC3.9', '���������-PS', 'CASE WHEN SUM(TCH_DROP_PS)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/SUM(TCH_DROP_PS),2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082130', 'MD9.7', 'Do��Ƶ������(119)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082131', 'MD9.8', '��DO��ƵС������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082132', 'MD9.9', '˫DO��ƵС������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082133', 'MD9.10', '��DO��ƵС������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082134', 'MD9.11', 'DOС������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082135', 'MD10.1', '�������ӽ�����ʱ��', 'SUM(DO_CONN_SETUP_TIME)*(SUM(nvl(AT_CONN_SUC_DO,0))+SUM(nvl(AN_CONN_SUC_DO,0)))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082136', 'MD10.2', '��������ռ����ʱ��', 'SUM(DO_CONN_OCCUPANCY_TIME)*(SUM(nvl(AT_CONN_SUC_DO,0))+SUM(nvl(AN_CONN_SUC_DO,0)))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082138', 'MD10.4', 'ǰ���ش��ֽ���', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082139', 'MD10.5', 'ǰ�����ֽ���', 'SUM(FTCH_RLP_TX_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082140', 'MD10.6', '�����ش��ֽ���', 'SUM(RTCH_RLP_RETX_DO) *1024', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082141', 'MD10.7', '������յ��ֽ���', 'SUM(RTCH_RLP_TX_DO)*1024', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082142', 'MD10.8', 'RAB��æ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082143', 'MD10.9', 'RAB�д���', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081075', 'MC5.1', '�л��������', 'SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081076', 'MC5.2', '�л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC) + SUM(INNER_BSC_SHO_SUCC) + SUM(INTER_BSC_HHO_SUCC) + SUM(INTER_BSC_SHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081077', 'MC5.3', '�л��ɹ���(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC) + SUM(INNER_BSC_SHO_SUCC) + SUM(INTER_BSC_HHO_SUCC) + SUM(INTER_BSC_SHO_SUCC))/(SUM(INNER_BSC_HHO_ATT) + SUM(INNER_BSC_SHO_ATT)  + SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT))*100,2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081078', 'MC5.4', '�л��������-CS', 'SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081079', 'MC5.5', '�л��ɹ�����-CS', 'SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081080', 'MC5.6', '�л��ɹ���-CS(%)', 'CASE WHEN (SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)) = 0 THEN 0 ELSE  ROUND( (SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC))/(SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)), 3) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081081', 'MC5.7', 'Ӳ�л��������-CS', 'SUM(BSS_HHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081082', 'MC5.8', 'Ӳ�л��ɹ�����-CS', 'SUM(BSS_HHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081083', 'MC5.9', 'Ӳ�л��ɹ���-CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081086', 'MC5.12', '���л��ɹ���-CS(%)', 'CASE WHEN (SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)) = 0 THEN 0 ELSE  ROUND((SUM(S_SHO_SUC)-SUM(S_SSHO_SUC))/(SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081026', 'MC3.3', '���������', 'CASE WHEN (SUM(TCH_DROP_NUM) + SUM(TCH_DROP_PS))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + SUM(TCH_DROP_PS)),2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081041', 'MC4.9', 'ҵ���ŵ�ӵ������', 'SUM(TCH_BLOCK_COUNT)+ (SUM(CALL_ATT_PS)-sum(CALL_SETUP_SUCC_PS))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081044', 'MC4.12', 'ҵ���ŵ�����ɹ�����(����)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081046', 'MC4.14', 'ҵ���ŵ�����ɹ���(����)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081051', 'MC4.19', 'ҵ���ŵ�ӵ������-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082046', 'MD2.24', 'D2.24 ��������ƽ������ʱ��', 'SUM(DO_CONN_SETUP_TIME)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082047', 'MD2.25', 'D2.25 ��������ƽ��ռ��ʱ��', 'SUM(DO_CONN_OCCUPANCY_TIME)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082070', 'MD4.1', 'D4.1 �û���Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN (SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)) /(SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081025', 'MC3.2', 'ҵ���ŵ�������(%)', 'CASE WHEN (SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(TCH_SETUP_SUCC_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(TCH_DROP_PS,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(TCH_DROP_PS,0)))/(SUM(TCH_ASSIGN_SUC) + SUM(TCH_SETUP_SUCC_PS)),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081074', 'MC4.42', 'ҵ���ŵ�ӵ����-���л�PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_PS)-SUM(TCH_ASSIGN_SUC_SHO_PS))/SUM(TCH_ASSIGN_ATT_SHO_PS)* 100, 2) END  ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081090', 'MC5.16', '�л��������-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081091', 'MC5.17', '�л��ɹ�����-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081092', 'MC5.18', '�л��ɹ���-PS(%)', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081096', 'MC5.22', '���л��������-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081097', 'MC5.23', '���л��ɹ�����-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081098', 'MC5.24', '���л��ɹ���-PS(%)', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081099', 'MC5.25', '�����л��������-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081100', 'MC5.26', '�����л��ɹ�����-PS', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081101', 'MC5.27', '�����л��ɹ���-PS(%)', '', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081102', 'MC5.28', 'BS���л��������', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INTRA_BS_SSHO_ATT_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082152', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082153', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082154', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082155', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082156', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081207', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0808', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081043', 'MC4.11', 'ҵ���ŵ������������(����)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081208', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0808', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081209', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0808', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081210', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0808', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081211', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0808', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081009', 'MC1.9', '���н����ɹ���-PS(%)', 'case when SUM(CALL_ATT_PS) = 0  THEN 0 WHEN (SUM(CALL_SETUP_SUCC_PS))>=SUM(CALL_ATT_PS) THEN 99.99 else     ROUND((SUM(CALL_SETUP_SUCC_PS)) / (SUM(CALL_ATT_PS)) * 100,4)END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081010', 'MC2.1', 'ҵ���ŵ�������(����)(Erl)', 'SUM(SHO_TRAFFIC_CS)+SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081012', 'MC2.3', 'ҵ���ŵ�������(����)-CS(Erl)', 'SUM(SHO_TRAFFIC_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081014', 'MC2.5', 'Walsh�뻰����-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081015', 'MC2.6', '���л�������-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081016', 'MC2.7', '�����л�������-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081018', 'MC2.9', 'ҵ���ŵ�������(����)-PS(Erl)', 'SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081020', 'MC2.11', 'Walsh�뻰����-PS(Erl)', 'SUM(FCH_WALSHCODE_TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081021', 'MC2.12', '���л�������-PS(Erl)', 'SUM(FCH_CE_TRAFFIC_PS) - SUM(TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081023', 'MC2.14', '���л�����-PS(%)', 'case when SUM(TRAFFIC_PS) = 0  THEN 0 else ROUND((SUM(FCH_CE_TRAFFIC_PS) - SUM(TRAFFIC_PS)) / SUM(TRAFFIC_PS)*100,4)END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081031', 'MC3.8', 'ҵ���ŵ�������-PS(%)', 'CASE WHEN SUM(TCH_SETUP_SUCC_PS)=0 THEN 0 WHEN SUM(TCH_DROP_PS)<=0 THEN 0.01 ELSE ROUND(SUM(TCH_DROP_PS) / SUM(TCH_SETUP_SUCC_PS) * 100, 2) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081033', 'MC4.1', 'ҵ���ŵ������������(����)', 'SUM(TCH_SETUP_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081035', 'MC4.3', 'ҵ���ŵ�����ʧ�ܴ���(����)', 'SUM(TCH_SETUP_ATT)-SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081036', 'MC4.4', 'ҵ���ŵ�����ɹ���(����)(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081039', 'MC4.7', 'ҵ���ŵ�����ʧ�ܴ���(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(TCH_SETUP_SUCC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081040', 'MC4.8', 'ҵ���ŵ�����ɹ���(������)(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS))=0 THEN 0 ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(nvl(TCH_SETUP_SUCC_PS,0))) /(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100, 4) END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081045', 'MC4.13', 'ҵ���ŵ�����ʧ�ܴ���(����)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081047', 'MC4.15', 'ҵ���ŵ������������(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081049', 'MC4.17', 'ҵ���ŵ�����ʧ�ܴ���(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081055', 'MC4.23', 'ҵ���ŵ�ӵ����-Ӳ�л�CS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_CS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_CS)-SUM(TCH_ASSIGN_SUC_HHO_CS))/SUM(TCH_ASSIGN_ATT_HHO_CS) * 100, 2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041056', 'MC4.24', 'ҵ���ŵ������������-���л�-CS', 'SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041057', 'MC4.25', 'ҵ���ŵ�����ɹ�����-���л�-CS', 'SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041035', 'MC4.3', 'ҵ���ŵ�����ʧ�ܴ���(����)', 'SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-(SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041058', 'MC4.26', 'ҵ���ŵ�ӵ����-���л�CS(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND((SUM(S_SHO_ATT) - SUM(S_SHO_SUC)) / SUM(S_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041138', 'MC6.16', '�����ŵ����ռ����', 'SUM(REV_CH_MAX_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041139', 'MC6.17', '�����ŵ����ռ����(%)', 'CASE WHEN SUM(REV_CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(REV_CH_MAX_NUM)/SUM(REV_CH_RLB_NUM),4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082005', 'MD1.5', 'D1.5 ����Ƶ�����ϻ�վ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041140', 'MC7.1', 'ǰ���ش���֡��', 'SUM(RETX_FRM_NUM_FWD_1X)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041059', 'MC4.27', 'ҵ���ŵ������������(����)-PS', 'SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041061', 'MC4.29', 'ҵ���ŵ�����ʧ�ܴ���(����)-PS', 'SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-(SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041063', 'MC4.31', 'ҵ���ŵ������������(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041067', 'MC4.35', 'ҵ���ŵ�ӵ������-PS', 'SUM(TCH_BLOCK_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041069', 'MC4.37', 'ҵ���ŵ������������-Ӳ�л�-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041070', 'MC4.38', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002046', 'ID46', 'D2.24 ��������ƽ������ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041078', 'MC5.4', '�л��������-CS', 'SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041178', 'MC10.1', 'C10.1�ŵ���Ԫ������', 'SUM(FWD_CH_RLB_NUM)+SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042138', 'MD10.4', 'ǰ���ش��ֽ���', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041054', 'MC4.22', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-CS', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041060', 'MC4.28', 'ҵ���ŵ�����ɹ�����(����)-PS', 'SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041062', 'MC4.30', 'ҵ���ŵ�����ɹ���(����)-PS(%)', 'CASE WHEN SUM(CALL_ATT_NUM_PS)+SUM(HHO_ATT_NUM_PS)+SUM(SHO_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)=0 THEN 0 ELSE ROUND((SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(HHO_SUC_NUM_PS) + SUM(SHO_SUC_NUM_PS) +SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS))/(SUM(CALL_ATT_NUM_PS)+SUM(HHO_ATT_NUM_PS)+SUM(SHO_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS))*100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042141', 'MD10.7', '������յ��ֽ���', 'SUM(DO_RTCH_RLP_TX)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042082', 'MD5.2', 'D5.2 ���л�����', 'SUM(TRAFFIC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042045', 'MD2.23', 'D2.23 ���������', 'CASE WHEN SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))=0 THEN 0 ELSE ROUND((SUM(REL_NUM_PDSN_DO)+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100/SUM(nvl(RELEASETIMES_INCLPDSN_DO,0)),4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041141', 'MC7.2', 'ǰ������֡��-�������ش�', 'SUM(TX_FRM_NUM_FWD_1X)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041146', 'MC7.7', '�����ش���֡��', 'SUM(RETX_FRM_NUM_REV_1X)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041147', 'MC7.8', '��������֡��-�������ش�', 'SUM(TX_FRM_NUM_REV_1X)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041160', 'MC8.11', 'C1.31�ŵ���Ԫ��������', 'SUM(FWD_CH_NUM)+SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041162', 'MC8.13', 'C1.33ҵ���ŵ�������', 'SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042069', 'MD3.19', 'D3.19 ��Active̬Session�Ự��', 'SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042074', 'MD4.5', 'D4.5 AT �����Dormant̬��Active̬�����������', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042100', 'MD6.15', 'D6.15 ����ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042098', 'MD6.13', 'D6.13 ǰ��ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041011', 'MC2.2', 'ҵ���ŵ�������(������)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041180', 'MC10.3', 'C10.3ҵ���ŵ����صĻ�����(���л�)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041181', 'MC10.4', 'C10.4ҵ���ŵ����صĻ�����(�����л�)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042023', 'MD2.1', 'D2.1 �������ӳɹ���', 'CASE WHEN SUM(nvl(DO_CONN_ATT,0))=0 THEN 0 WHEN SUM(nvl(DO_SUC_CONN_NUM,0))>=SUM(nvl(DO_CONN_ATT,0)) THEN 99.99 ELSE ROUND(SUM(nvl(DO_SUC_CONN_NUM,0)) / SUM(nvl(DO_CONN_ATT,0)) * 100, 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042044', 'MD2.22', 'D2.22 ���ߵ�����', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041164', 'MC9.2', 'C3.2���л�����(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041006', 'MC1.6', '���н����ɹ���-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0 WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042036', 'MD2.14', 'D2.14 �������ӽ���ʧ�ܴ�����ԭ��Ϊ����ҵ���ŵ�����ʧ�ܣ�', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042037', 'MD2.15', 'D2.15 �������ӽ���ʧ�ܴ�����ԭ��Ϊû���յ�TCC ��Ϣ��', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042107', 'MD7.2', 'D7.2 ȫ�����л��������', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042108', 'MD7.3', 'D7.3 ȫ�����л��ɹ�����', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041028', 'MC3.5', 'ҵ���ŵ�������-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042038', 'MD2.16', 'D2.16 ���������ͷŴ���(��PDSN Ҫ���ͷŴ���)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042041', 'MD2.19', 'D2.19 ���ߵ��ߴ������տڶ�ʧ��', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042042', 'MD2.20', 'D2.20 ���ߵ��ߴ�����Ӳ�л�ʧ�ܵ��µĵ��ߣ�', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042043', 'MD2.21', 'D2.21 ���ߵ��ߴ���������ԭ��', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042051', 'MD3.1', 'D3.1 UATI����ɹ���', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042106', 'MD7.1', 'D7.1 ȫ�����л��ɹ���', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041003', 'MC1.3', '���н����ɹ���(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_NUM_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CMO_CALLSUCCNUM_PS,0)))>=(SUM(nvl(CALL_ATT,0)) + SUM(nvl(CALL_ATT_NUM_PS,0))) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(CMO_CALLSUCCNUM_PS,0))+SUM(nvl(PAG_SUCC_NUM_PS,0)))/(SUM(CALL_ATT) + SUM(CALL_ATT_NUM_PS)),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041001', 'MC1.1', '���г��Դ���', 'sum(nvl(CALL_ATT,0))+sum(nvl(CALL_ATT_NUM_PS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041004', 'MC1.4', '���г��Դ���-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041005', 'MC1.5', '���н����ɹ�����-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041024', 'MC3.1', 'ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(DATE_DROP_NUM,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041038', 'MC4.6', 'ҵ���ŵ�����ɹ�����(������)', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041048', 'MC4.16', 'ҵ���ŵ�����ɹ�����(������)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042048', 'MD2.26', 'D2.26 DRC ǰ������Ϊ�zС��307.2K�{���������', '[MD10.11] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042049', 'MD2.27', 'D2.27 DRC ǰ������Ϊ�z307.2K ��1228K�{���������', '[MD10.12] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042050', 'MD2.28', 'D2.28 DRC ǰ������Ϊ�z����1228K�{���������', '[MD10.13] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042056', 'MD3.6', 'D3.6 Session�����Ȩ�ɹ���', 'CASE WHEN SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(AUTH_SUC_DO)/(SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042058', 'MD3.8', 'D3.8 Session�����Ȩ�������', 'SUM(AUTH_SUC_DO) + SUM(AUTH_FAILED_NUM_DO) + SUM(AUTH_DENY_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042061', 'MD3.11', 'D3.11 SessionЭ�̳ɹ���', 'CASE WHEN SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO)/(SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042064', 'MD3.14', 'D3.14 Session��AN Dormant�л��ɹ���(%)', 'CASE WHEN SUM(SESS_INTER_AN_DORMHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_INTER_AN_DORMHO_SUC_DO)/SUM(SESS_INTER_AN_DORMHO_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042093', 'MD6.8', 'D6.8 PCFǰ����鶪����', 'CASE WHEN SUM(FWD_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(FWD_PAK_DISCARD_NUM_DO)/SUM(FWD_PAK_TOTAL_NUM_DO),4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041155', 'MC8.6', 'C1.24С������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042095', 'MD6.10', 'D6.10 ǰ��RLP�ش���', 'CASE WHEN SUM(FWD_RLP_AVG_THROUGHPUT_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO)/SUM(FWD_RLP_AVG_THROUGHPUT_DO)/1000/3600*8*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042097', 'MD6.12', 'D6.12 ����RLP�ش���', 'CASE WHEN SUM(DO_RTCH_RLP_TX)=0 THEN 0 ELSE ROUND(SUM(RTCH_RLP_RETX_DO)/SUM(DO_RTCH_RLP_TX)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042099', 'MD6.14', 'D6.14 ǰ��ҵ���ŵ������ͻ��������', 'CASE WHEN SUM(FTCH_PHY_SLOT_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_PHY_TX_BIT_DO)/SUM(FTCH_PHY_SLOT_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042101', 'MD6.16', 'D6.16 ����ҵ���ŵ������ͻ��������', 'CASE WHEN SUM(RLP_CALLKDURATION)=0 THEN 0 ELSE ROUND(SUM(RTCH_PHY_TX_BIT_DO)/SUM(RLP_CALLKDURATION)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042102', 'MD6.17', 'D6.17 ǰ�������ҵ���ŵ�ʱ϶ռ����', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),4)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042104', 'MD6.19', 'D6.19 ��������ŵ�ʱ϶ռ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042105', 'MD6.20', 'D6.20 ������·��æ��', 'CASE WHEN SUM(RAB_BUSY_NUM_DO)+SUM(RAB_IDLE_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RAB_BUSY_NUM_DO)/(SUM(RAB_BUSY_NUM_DO)+SUM(RAB_IDLE_NUM_DO))*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042109', 'MD7.4', 'D7.4 AN�����л��ɹ���', 'CASE WHEN SUM(INN_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_BS_SHO_SUC_DO)/SUM(INN_BS_SHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042112', 'MD7.7', 'D7.7 AN�����л��ɹ���', 'CASE WHEN SUM(INTER_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_BS_SHO_SUC_DO)/SUM(INTER_BS_SHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042115', 'MD7.10', 'D7.10 AN��Ӳ�л��ɹ���', 'CASE WHEN SUM(INN_AN_HHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_AN_HHO_SUC_DO)/SUM(INN_AN_HHO_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042118', 'MD7.13', 'D7.13 AN��Ӳ�л��ɹ���', 'CASE WHEN SUM(INTER_AN_HHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_AN_HHO_ATT_DO)/SUM(INTER_AN_HHO_ATT_DO),4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042121', 'MD8.1', 'D8.1 Ѱ����Ӧ��', 'CASE WHEN SUM(PAGE_ATT_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(PAGE_SUC_NUM_DO)/SUM(PAGE_ATT_NUM_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042124', 'MD9.1', '����DO��Ƶ(37)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042125', 'MD9.2', '����DO��Ƶ(78)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042126', 'MD9.3', '����DO��Ƶ(119)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041013', 'MC2.4', 'ҵ���ŵ�������(������)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042077', 'MD4.8', 'D4.8 AN�����Dormant̬��Active̬����ɹ���', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AN_DOR2ACT_SUC_DO)/SUM(AN_DOR2ACT_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042068', 'MD3.18', 'D3.18 Active̬Session�Ự��', 'SUM(SESSION_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041198', 'MC11.6', 'C11.9ҵ���ŵ�����ɹ�����(�����л�������)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041199', 'MC11.7', 'C11.10ҵ���ŵ������������(���л�������)', 'SUM(TCH_SETUP_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042078', 'MD4.9', 'D4.9 AN�����Dormant��Active̬�ļ����������', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042085', 'MD5.5', 'D5.5 ���л�����', 'CASE WHEN SUM(TRAFFIC_DO)=0 THEN 0 ELSE ROUND(SUM(SFT_HO_TRAFFIC_DO)/SUM(TRAFFIC_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042087', 'MD6.2', 'D6.2 PCFǰ����������', 'SUM(FWD_THROUGHOUT_PCF_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042090', 'MD6.5', 'D6.5 �������ҵ����PCF�����İ���', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042092', 'MD6.7', 'D6.7 PCF������鶪����', '[MD6.5] / [MD6.3] ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041179', 'MC10.2', 'C10.2ҵ���ŵ�ӵ������(���л�)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041182', 'MC10.5', 'C10.5WALSH����ػ�����', 'SUM(WALSHCODE_ERL)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041007', 'MC1.7', '���г��Դ���-PS', 'SUM(CALL_ATT_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041008', 'MC1.8', '���н����ɹ�����-PS', 'SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041193', 'MC11.1', 'C11.4����ҵ���ŵ������������(�����л���������)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041194', 'MC11.2', 'C11.5����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041195', 'MC11.3', 'C11.6����ҵ���ŵ������������(�����л���������)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041196', 'MC11.4', 'C11.7����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041197', 'MC11.5', 'C11.8ҵ���ŵ������������(�����л�������)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041201', 'MC11.9', 'C11.12��վϵͳӲ�л��������', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041202', 'MC11.10', 'C11.13��վϵͳӲ�л��ɹ�����', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041200', 'MC11.8', 'C11.11ҵ���ŵ�����ɹ�����(���л�������)', 'SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041203', 'MC11.11', 'C11.14ϵͳ���л��������', 'SUM(S_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041204', 'MC11.12', 'C11.15ϵͳ���л��ɹ�����', 'SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041027', 'MC3.4', 'ҵ���ŵ���������-CS', 'SUM(TCH_DROP_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041206', 'MC11.14', 'C11.18���г����ܴ���', 'SUM(CALL_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042002', 'MD1.2', 'D1.2 ����Ƶ��վ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042003', 'MD1.3', 'D1.3 ˫��Ƶ��վ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042004', 'MD1.4', 'D1.4 ����Ƶ��վ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042005', 'MD1.5', 'D1.5 ����Ƶ�����ϻ�վ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042006', 'MD1.6', 'D1.6 ��������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042007', 'MD1.7', 'D1.7 ����CE���������', 'CASE WHEN SUM(RCE_RLB_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RCE_MAX_BUSY_NUM_DO) / SUM(RCE_RLB_NUM_DO) * 100, 2) END ', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042010', 'MD1.10', 'D1.10 ǰ��ҵ��MacIndex���������', '[MD1.11] / [MD10.10] * 100 ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042011', 'MD1.11', 'D1.11 ǰ��ҵ��MacIndex���æ��', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042012', 'MD1.12', 'D1.12 PCF����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042013', 'MD1.13', 'D1.13 PCF��������ƽ������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042014', 'MD1.14', 'D1.14 PCF������ͬʱ֧�ֵ�HRPD�Ự����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042015', 'MD1.15', 'D1.15 PCF������ͬʱ֧�ֵļ����HRPD�Ự����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101153', 'MC8.4', 'C1.22����Ƶ��վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042016', 'MD1.16', 'D1.16 PCF���õ��������������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101154', 'MC8.5', 'C1.23����Ƶ��վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101155', 'MC8.6', 'C1.24С������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101156', 'MC8.7', 'C1.25����ƵС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101157', 'MC8.8', 'C1.26˫��ƵС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101158', 'MC8.9', 'C1.27����ƵС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101159', 'MC8.10', 'C1.28����ƵС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101160', 'MC8.11', 'C1.31�ŵ���Ԫ��������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101161', 'MC8.12', 'C1.32��������', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101162', 'MC8.13', 'C1.33ҵ���ŵ�������', 'SUM(TCEA)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101163', 'MC9.1', 'C3.1ҵ���ŵ�������(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101165', 'MC9.3', 'C3.3�ŵ���Ԫ������(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101166', 'MC9.4', 'C3.4ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT)*100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101167', 'MC9.5', 'C3.5��æС������(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101168', 'MC9.6', 'C3.6æС������(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101169', 'MC9.7', 'C3.7����С������(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101170', 'MC9.8', 'C3.8���������վ����(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101171', 'MC9.9', 'C3.9�����վ����(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101008', 'MC1.8', '���н����ɹ�����-PS', 'sum(ESTDATACALLS3G)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101013', 'MC2.4', 'ҵ���ŵ�������(������)-CS(Erl)', 'SUM(TRAFFIC_CS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101172', 'MC9.10', 'C6.2��վϵͳӲ�л��ɹ���(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101173', 'MC9.11', 'C6.3ϵͳ���л��ɹ���(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101174', 'MC9.12', 'C6.4ҵ���ŵ�������(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101175', 'MC9.13', 'C6.5ͨ���ж���(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101176', 'MC9.14', 'C6.6ƽ���������', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101177', 'MC9.15', 'C6.7��С������(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101179', 'MC10.2', 'C10.2ҵ���ŵ�ӵ������(���л�)', 'SUM(TCH_BLOCK_COUNT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101182', 'MC10.5', 'C10.5WALSH����ػ�����', 'SUM(WALSHCODE_ERL)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101183', 'MC10.6', 'C10.6��һ��Ƶ(283)������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101184', 'MC10.7', 'C10.7�ڶ���Ƶ(201)������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101185', 'MC10.8', 'C10.8������Ƶ(242)������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101186', 'MC10.9', 'C10.9������Ƶ(160)������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101187', 'MC10.10', 'C10.10��æС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101188', 'MC10.11', 'C10.11æС������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101189', 'MC10.12', 'C10.12����С������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101190', 'MC10.13', 'C11.17��С������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101191', 'MC10.14', 'C10.13���������վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101192', 'MC10.15', 'C10.14�����վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101193', 'MC11.1', 'C11.4����ҵ���ŵ������������(�����л���������)', 'SUM(O_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101194', 'MC11.2', 'C11.5����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101195', 'MC11.3', 'C11.6����ҵ���ŵ������������(�����л���������)', 'SUM(P_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101196', 'MC11.4', 'C11.7����ҵ���ŵ�����ɹ�����(�����л���������)', 'SUM(P_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101197', 'MC11.5', 'C11.8ҵ���ŵ������������(�����л�������)', 'SUM(TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101198', 'MC11.6', 'C11.9ҵ���ŵ�����ɹ�����(�����л�������)', 'SUM(TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101199', 'MC11.7', 'C11.10ҵ���ŵ������������(���л�������)', 'SUM(TCH_SETUP_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101200', 'MC11.8', 'C11.11ҵ���ŵ�����ɹ�����(���л�������)', 'SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101201', 'MC11.9', 'C11.12��վϵͳӲ�л��������', 'SUM(BSS_HHO_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101202', 'MC11.10', 'C11.13��վϵͳӲ�л��ɹ�����', 'SUM(BSS_HHO_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101203', 'MC11.11', 'C11.14ϵͳ���л��������', 'SUM(S_SHO_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101204', 'MC11.12', 'C11.15ϵͳ���л��ɹ�����', 'SUM(S_SHO_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101206', 'MC11.14', 'C11.18���г����ܴ���', 'SUM(CALL_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810001', 'MD1.1', 'D1.1 DO��վ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101010', 'MC2.1', 'ҵ���ŵ�������(����)(Erl)', 'SUM(nvl(SHO_TRAFFIC_CS,0)) + SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101012', 'MC2.3', 'ҵ���ŵ�������(����)-CS(Erl)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101014', 'MC2.5', 'Walsh�뻰����-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101015', 'MC2.6', '���л�������-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101016', 'MC2.7', '�����л�������-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101009', 'MC1.9', '���н����ɹ���-PS(%)', 'CASE WHEN sum(DATACALLATT3G)=0 THEN 0 WHEN sum(ESTDATACALLS3G)>=sum(DATACALLATT3G) THEN 99.99 ELSE ROUND(sum(ESTDATACALLS3G)/sum(DATACALLATT3G) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101017', 'MC2.8', '���л�����-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101023', 'MC2.14', '���л�����-PS(%)', 'CASE WHEN SUM(TRAFFIC_PS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_PS)-SUM(TRAFFIC_PS))/SUM(TRAFFIC_PS) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101084', 'MC5.10', '���л��������-CS', 'sum(VOICECALLSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101077', 'MC5.3', '�л��ɹ���(%)', 'CASE WHEN (sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ))=0 THEN 0 ELSE ROUND((sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET))*100/(sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101031', 'MC3.8', 'ҵ���ŵ�������-PS(%)', 'CASE WHEN SUM(nvl(ESTDATACALLS3G,0))=0 THEN 0 WHEN sum(DATACALLSDROP)<=0 THEN 0.01 ELSE ROUND(sum(DATACALLSDROP)/SUM(nvl(ESTDATACALLS3G,0)) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101078', 'MC5.4', '�л��������-CS', 'sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101079', 'MC5.5', '�л��ɹ�����-CS', 'sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101081', 'MC5.7', 'Ӳ�л��������-CS', 'sum(VOICECALLHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101085', 'MC5.11', '���л��ɹ�����-CS', 'sum(VOICECALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101140', 'MC7.1', 'ǰ���ش���֡��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101087', 'MC5.13', '�����л��������-CS', 'sum(VOICECALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101045', 'MC4.13', 'ҵ���ŵ�����ʧ�ܴ���(����)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081058', 'MC4.26', 'ҵ���ŵ�ӵ����-���л�CS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_CS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_CS)-SUM(TCH_ASSIGN_SUC_SHO_CS))/SUM(TCH_ASSIGN_ATT_SHO_CS) * 100, 2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081059', 'MC4.27', 'ҵ���ŵ������������(����)-PS', 'SUM(TCH_ASSIGN_ATT_PS)+SUM(TCH_ASSIGN_ATT_HHO_PS)+SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101152', 'MC8.3', 'C1.21˫��Ƶ��վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101088', 'MC5.14', '�����л��ɹ�����-CS', 'sum(VOICECALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101047', 'MC4.15', 'ҵ���ŵ������������(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101049', 'MC4.17', 'ҵ���ŵ�����ʧ�ܴ���(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101050', 'MC4.18', 'ҵ���ŵ�����ɹ���(������)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) ), 4)*100 END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101090', 'MC5.16', '�л��������-PS', 'sum(DATACALLHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101091', 'MC5.17', '�л��ɹ�����-PS', 'sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101092', 'MC5.18', '�л��ɹ���-PS(%)', 'CASE WHEN sum(DATACALLHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLHOCOMPLET)/sum(DATACALLHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101093', 'MC5.19', 'Ӳ�л��������-PS', 'sum(DATACALLHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101094', 'MC5.20', 'Ӳ�л��ɹ�����-PS', 'sum(DATACALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101095', 'MC5.21', 'Ӳ�л��ɹ���-PS(%)', 'CASE WHEN sum(DATACALLHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLHARDHOCOMPLET)/sum(DATACALLHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101096', 'MC5.22', '���л��������-PS', 'sum(DATACALLSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101097', 'MC5.23', '���л��ɹ�����-PS', 'sum(DATACALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101098', 'MC5.24', '���л��ɹ���-PS(%)', 'CASE WHEN sum(DATACALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(sum(DATACALLSOFTHOCOMPLET)/sum(DATACALLSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101101', 'MC5.27', '�����л��ɹ���-PS(%)', 'CASE WHEN SUM(DATACALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND(SUM(DATACALLSOFTERHOCOMPLET)/SUM(DATACALLSOFTERHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101108', 'MC5.34', 'BS��Ӳ�л��������', 'sum(THEINTERMSCHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101109', 'MC5.35', 'BS��Ӳ�л��ɹ�����', 'sum(THEINTERMSCHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101110', 'MC5.36', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(THEINTERMSCHARDHOCOMPLET)/sum(THEINTERMSCHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101113', 'MC5.39', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(THEINTRAMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND(SUM(THEINTRAMSCSOFTHOCOMPLET)/SUM(THEINTRAMSCSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101116', 'MC5.42', 'BS�ڸ����л��ɹ���(%)', 'CASE WHEN (SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ))=0 THEN 0 ELSE ROUND((SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET))/(SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101117', 'MC5.43', 'BS��Ӳ�л��������', 'sum(THEINTERMSCHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101118', 'MC5.44', 'BS��Ӳ�л��ɹ�����', 'sum(THEINTERMSCHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101119', 'MC5.45', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(THEINTERMSCHARDHOCOMPLET)/sum(THEINTERMSCHARDHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101122', 'MC5.48', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(THEINTERMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND(SUM(THEINTERMSCSOFTHOCOMPLET)/SUM(THEINTERMSCSOFTHOREQ) * 100,2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101123', 'MC6.1', '��һ��Ƶ(283)��վ��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101124', 'MC6.2', '�ڶ���Ƶ(201)��վ��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101125', 'MC6.3', '������Ƶ(242)��վ��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101126', 'MC6.4', '������Ƶ(160)��վ��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101127', 'MC6.5', '1X��Ƶ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101128', 'MC6.6', '�ŵ���������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101129', 'MC6.7', '�ŵ�������', 'SUM(CH_RLB_NUM)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101131', 'MC6.9', '�ŵ����ռ����(%)', 'CASE WHEN SUM(CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(CH_MAX_NUM)/SUM(CH_RLB_NUM)*100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101178', 'MC10.1', 'C10.1�ŵ���Ԫ������', 'SUM(CH_RLB_NUM)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101132', 'MC6.10', 'ǰ���ŵ���������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101083', 'MC5.9', 'Ӳ�л��ɹ���-CS(%)', 'CASE WHEN sum(VOICECALLHARDHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLHARDHOCOMPLET)*100/sum(VOICECALLHARDHOREQ),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810046', 'MD2.24', 'D2.24 ��������ƽ������ʱ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810047', 'MD2.25', 'D2.25 ��������ƽ��ռ��ʱ��', 'CASE WHEN (SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN))=0 THEN 0 ELSE ROUND(SUM(DO_CONNECT_TIME) / (SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN)) * 100, 2) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101043', 'MC4.11', 'ҵ���ŵ������������(����)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101044', 'MC4.12', 'ҵ���ŵ�����ɹ�����(����)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101032', 'MC3.9', '���������-PS', 'CASE WHEN sum(DATACALLSDROP)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/sum(DATACALLSDROP),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101046', 'MC4.14', 'ҵ���ŵ�����ɹ���(����)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC)*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101051', 'MC4.19', 'ҵ���ŵ�ӵ������-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101052', 'MC4.20', 'ҵ���ŵ�ӵ����-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810074', 'MD4.5', 'D4.5 AT �����Dormant̬��Active̬�����������', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101075', 'MC5.1', '�л��������', 'sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '1', 'MSC����', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '�ⲿ��Ԫ��ʶ', '''�ⲿ��Ԫ��ʶ''', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', 'ʡ������', '''{1}''', 'ZY0000', '', '1', 'MSC����', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '�����б�', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '����汾', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', 'Ӳ���汾', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '�豸����', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '�豸��������', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '����ͺ�', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '����λ��', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', 'MSCID', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', 'NID', ' ', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', 'IP��ַ', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '��������', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '����������·��', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '�����м���', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', 'Ŀǰ��ϽBSC��', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', '��ע', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '1', 'MSC����', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101082', 'MC5.8', 'Ӳ�л��ɹ�����-CS', 'sum(VOICECALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101080', 'MC5.6', '�л��ɹ���-CS(%)', 'CASE WHEN (sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ))=0 THEN 0 ELSE ROUND((sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET))*100/(sum(VOICECALLHARDHOREQ) + sum(VOICECALLSOFTHOREQ) + sum(VOICECALLSOFTERHOREQ)+SUM(DATACALLHOREQ)),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101086', 'MC5.12', '���л��ɹ���-CS(%)', 'CASE WHEN sum(VOICECALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLSOFTHOCOMPLET)*100/sum(VOICECALLSOFTHOREQ),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101089', 'MC5.15', '�����л��ɹ���-CS(%)', 'CASE WHEN sum(VOICECALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND(sum(VOICECALLSOFTERHOCOMPLET)*100/sum(VOICECALLSOFTERHOREQ),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810076', 'MD4.7', 'D4.7 AT�����Dormant ̬��Active ̬����ʧ�ܴ���', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810078', 'MD4.9', 'D4.9 AN�����Dormant��Active̬�ļ����������', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810079', 'MD4.10', 'D4.10 AN�����Dormant��Active̬�ļ���ɹ�����', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810080', 'MD4.11', 'D4.11 AN�����Dormant̬��Active̬�ļ���ʧ�ܴ���', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810081', 'MD5.1', 'D5.1 ��Ч�û���', 'SUM(EQU_USER_NUM_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810082', 'MD5.2', 'D5.2 ���л�����', 'SUM(TCH_OCC)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810138', 'MD10.4', 'ǰ���ش��ֽ���', 'SUM(FTCH_RLP_RETX_DO)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810141', 'MD10.7', '������յ��ֽ���', 'SUM(RTCH_RLP_TX_DO)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101074', 'MC4.42', 'ҵ���ŵ�ӵ����-���л�PS(%)', 'CASE WHEN SUM(DATACALLSOFTERHOREQ) + SUM(DATACALLSOFTHOREQ)=0 THEN 0 ELSE ROUND(((SUM(DATACALLSOFTERHOREQ)+SUM(DATACALLSOFTHOREQ))-(SUM(DATACALLSOFTERHOCOMPLET) + SUM(DATACALLSOFTHOCOMPLET)))/(SUM(DATACALLSOFTERHOREQ) + SUM(DATACALLSOFTHOREQ))*100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810148', 'MD10.14', 'ǰ��ҵ���ŵ�����㷢�͵�bit��', 'SUM(FTCH_PHY_TX_BIT_DO)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101142', 'MC7.3', 'RLP��ǰ���ŵ��з��͵�������-�����ش�(KB)', 'SUM(FTCH_RLP_TX_1X)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002047', 'ID47', 'D2.25 ��������ƽ��ռ��ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101147', 'MC7.8', '��������֡��-�������ش�', 'SUM(TOTALFRAMESTRANSRESERVETRAFFIC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101148', 'MC7.9', 'RLP�ڷ����ŵ��н��յ�������(KB)', 'SUM(RTCH_RLP_TX_1X)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101018', 'MC2.9', 'ҵ���ŵ�������(����)-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101019', 'MC2.10', 'ҵ���ŵ�������(������)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101020', 'MC2.11', 'Walsh�뻰����-PS(Erl)', 'SUM(WALSHCODE_ERL_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101021', 'MC2.12', '���л�������-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)-SUM(TRAFFIC_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101034', 'MC4.2', 'ҵ���ŵ�����ɹ�����(����)', 'SUM(TCH_SETUP_SUC)+SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101036', 'MC4.4', 'ҵ���ŵ�����ɹ���(����)(%)', 'CASE WHEN SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS))/(SUM(TCH_SETUP_SUC) + SUM(TCH_ASSIGN_SUC_HO_PS)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101037', 'MC4.5', 'ҵ���ŵ������������(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101053', 'MC4.21', 'ҵ���ŵ������������-Ӳ�л�-CS', 'SUM(VOICECALLHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101056', 'MC4.24', 'ҵ���ŵ������������-���л�-CS', 'SUM(TCH_SETUP_ATT)-SUM(TCH_ASSIGN_ATT_NUM)-SUM(BSS_HHO_ATT)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101057', 'MC4.25', 'ҵ���ŵ�����ɹ�����-���л�-CS', 'SUM(TCH_SETUP_SUC)-SUM(TCH_ASSIGN_SUC)-SUM(BSS_HHO_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101059', 'MC4.27', 'ҵ���ŵ������������(����)-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101060', 'MC4.28', 'ҵ���ŵ�����ɹ�����(����)-PS', 'SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101062', 'MC4.30', 'ҵ���ŵ�����ɹ���(����)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_HO_PS) / SUM(TCH_ASSIGN_ATT_HO_PS) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101063', 'MC4.31', 'ҵ���ŵ������������(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101065', 'MC4.33', 'ҵ���ŵ�����ʧ�ܴ���(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101067', 'MC4.35', 'ҵ���ŵ�ӵ������-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101069', 'MC4.37', 'ҵ���ŵ������������-Ӳ�л�-PS', 'SUM(DATACALLHARDHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101039', 'MC4.7', 'ҵ���ŵ�����ʧ�ܴ���(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_ATT_PS)-SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101040', 'MC4.8', 'ҵ���ŵ�����ɹ���(������)(%)', 'CASE WHEN SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND((SUM(nvl(CALL_SETUP_SUCC_CS, 0))+SUM(nvl(ESTDATACALLS3G, 0)))/(SUM(O_TCH_ASSIGN_ATT) + SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101103', 'MC5.29', 'BS���л��ɹ�����', 'sum(THEINTERMSCHARDHOCOMPLET)+SUM(THEINTRAMSCSOFTHOCOMPLET)+SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101104', 'MC5.30', 'BS���л��ɹ���(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ) + SUM(THEINTRAMSCSOFTHOREQ)+SUM(VOICECALLSOFTERHOREQ) + SUM(DATACALLSOFTERHOREQ)=0 THEN 0 ELSE ROUND((sum(THEINTERMSCHARDHOCOMPLET) + SUM(THEINTRAMSCSOFTHOCOMPLET) +SUM(VOICECALLSOFTERHOCOMPLET) + SUM(DATACALLSOFTERHOCOMPLET)) /(sum(THEINTERMSCHARDHOREQ) + SUM(THEINTRAMSCSOFTHOREQ) +SUM(VOICECALLSOFTERHOREQ) + SUM(DATACALLSOFTERHOREQ)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101106', 'MC5.32', 'BS���л��ɹ�����', 'sum(THEINTERMSCHARDHOCOMPLET)+SUM(THEINTERMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101107', 'MC5.33', 'BS���л��ɹ���(%)', 'CASE WHEN sum(THEINTERMSCHARDHOREQ) + SUM(THEINTERMSCSOFTHOREQ)=0 THEN 0 ELSE ROUND((sum(THEINTERMSCHARDHOCOMPLET) + SUM(THEINTERMSCSOFTHOCOMPLET))/(sum(THEINTERMSCHARDHOREQ) + SUM(THEINTERMSCSOFTHOREQ)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101115', 'MC5.41', 'BS�ڸ����л��ɹ�����', 'SUM(VOICECALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101070', 'MC4.38', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-PS', 'SUM(DATACALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002048', 'ID48', 'D2.26 DRC ǰ������Ϊ�zС��307.2K�{���������', 'ID145/(ID145+ID146+ID147)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810075', 'MD4.6', 'D4.6 AT �����Dormant̬��Active̬����ɹ�����', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002049', 'ID49', 'D2.27 DRC ǰ������Ϊ�z307.2K ��1228K�{���������', 'ID146/(ID145+ID146+ID147)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002050', 'ID50', 'D2.28 DRC ǰ������Ϊ�z����1228K�{���������', 'ID147/(ID145+ID146+ID147)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002051', 'ID51', 'D3.1 UATI����ɹ���', 'ID53/ID52', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101073', 'MC4.41', 'ҵ���ŵ�����ɹ�����-���л�-PS', 'SUM(DATACALLSOFTERHOCOMPLET)+SUM(DATACALLSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002052', 'ID52', 'D3.2 UATI�������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101099', 'MC5.25', '�����л��������-PS', 'SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002053', 'ID53', 'D3.3 UATI����ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002054', 'ID54', 'D3.4 UATI����ʧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101100', 'MC5.26', '�����л��ɹ�����-PS', 'SUM(DATACALLSOFTERHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002055', 'ID55', 'D3.5 UATIƽ������ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002056', 'ID56', 'D3.6 Session�����Ȩ�ɹ���', 'ID57/ID58', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002057', 'ID57', 'D3.7 Session�����Ȩ�ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002058', 'ID58', 'D3.8 Session�����Ȩ�������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002059', 'ID59', 'D3.9 Session�����Ȩ�ܾ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002060', 'ID60', 'D3.10 Session�����Ȩʧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002061', 'ID61', 'D3.11 SessionЭ�̳ɹ���', 'ID62/ID62+ID63', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002062', 'ID62', 'D3.12 SessionЭ�̳ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002063', 'ID63', 'D3.13 SessionЭ��ʧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002064', 'ID64', 'D3.14 Session��AN Dormant�л��ɹ���(%)', 'ID66/ID65', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002065', 'ID65', 'D3.15 Session��AN Dormant�л�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002066', 'ID66', 'D3.16 Session��AN Dormant�л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002067', 'ID67', 'D3.17 Session�Ự��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002068', 'ID68', 'D3.18 Active̬Session�Ự��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002069', 'ID69', 'D3.19 ��Active̬Session�Ự��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002070', 'ID70', 'D4.1 �û���Dormant̬��Active̬�ļ���ɹ���', 'ID72/ID71', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002071', 'ID71', 'D4.2 �û���Dormant̬��Active̬�ļ��������ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002072', 'ID72', 'D4.3 �û���Dormant̬��Active̬�ļ���ɹ��ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002073', 'ID73', 'D4.4 AT �����Dormant̬��Active̬�ļ���ɹ���', 'ID75/ID74', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002074', 'ID74', 'D4.5 AT �����Dormant̬��Active̬�����������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002075', 'ID75', 'D4.6 AT �����Dormant̬��Active̬����ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002076', 'ID76', 'D4.7 AT�����Dormant ̬��Active ̬����ʧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101102', 'MC5.28', 'BS���л��������', 'sum(THEINTERMSCHARDHOREQ)+SUM(THEINTRAMSCSOFTHOREQ)+SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002077', 'ID77', 'D4.8 AN�����Dormant̬��Active̬����ɹ���', 'ID79/ID78', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002078', 'ID78', 'D4.9 AN�����Dormant��Active̬�ļ����������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002079', 'ID79', 'D4.10 AN�����Dormant��Active̬�ļ���ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002080', 'ID80', 'D4.11 AN�����Dormant̬��Active̬�ļ���ʧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002081', 'ID81', 'D5.1 ��Ч�û���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002082', 'ID82', 'D5.2 ���л�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002083', 'ID83', 'D5.3 CE������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002084', 'ID84', 'D5.4 ���л�������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002085', 'ID85', 'D5.5 ���л�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002086', 'ID86', 'D6.1 PCF������������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101105', 'MC5.31', 'BS���л��������', 'sum(THEINTERMSCHARDHOREQ)+SUM(THEINTERMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002087', 'ID87', 'D6.2 PCFǰ����������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101111', 'MC5.37', 'BS�����л��������', 'SUM(THEINTRAMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101112', 'MC5.38', 'BS�����л��ɹ�����', 'SUM(THEINTRAMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002088', 'ID88', 'D6.3 PCF���յķ������ҵ����ܰ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002089', 'ID89', 'D6.4 PCF���յ�ǰ��������ݵ��ܰ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002090', 'ID90', 'D6.5 �������ҵ����PCF�����İ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002091', 'ID91', 'D6.6 ǰ�����ҵ����PCF�����İ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002092', 'ID92', 'D6.7 PCF������鶪����', 'ID90/ID88', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002093', 'ID93', 'D6.8 PCFǰ����鶪����', 'ID91/ID89', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002094', 'ID94', 'D6.9 ǰ��RLP����������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002095', 'ID95', 'D6.10 ǰ��RLP�ش���', 'ID138/ID139', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002096', 'ID96', 'D6.11 ����RLP����������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002097', 'ID97', 'D6.12 ����RLP�ش���', 'ID140/ID141', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002098', 'ID98', 'D6.13 ǰ��ҵ���ŵ������ƽ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002099', 'ID99', 'D6.14 ǰ��ҵ���ŵ������ͻ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002100', 'ID100', 'D6.15 ����ҵ���ŵ������ƽ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002101', 'ID101', 'D6.16 ����ҵ���ŵ������ͻ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002102', 'ID102', 'D6.17 ǰ�������ҵ���ŵ�ʱ϶ռ����', 'ID149/3600', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002103', 'ID103', 'D6.18 ǰ�����������ŵ�ʱ϶ռ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002104', 'ID104', 'D6.19 ��������ŵ�ʱ϶ռ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002105', 'ID105', 'D6.20 ������·��æ��', 'ID142/(ID142+ID143)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002106', 'ID106', 'D7.1 ȫ�����л��ɹ���', 'ID108/ID107', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002107', 'ID107', 'D7.2 ȫ�����л��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002108', 'ID108', 'D7.3 ȫ�����л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002109', 'ID109', 'D7.4 AN�����л��ɹ���', 'ID111/ID110', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002110', 'ID110', 'D7.5 AN�����л��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002111', 'ID111', 'D7.6 AN�����л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002112', 'ID112', 'D7.7 AN�����л��ɹ���', 'ID114/ID113', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002113', 'ID113', 'D7.8 AN�����л��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002114', 'ID114', 'D7.9 AN�����л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002115', 'ID115', 'D7.10 AN��Ӳ�л��ɹ���', 'ID117/ID116', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002116', 'ID116', 'D7.11 AN��Ӳ�л��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002117', 'ID117', 'D7.12 AN��Ӳ�л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002118', 'ID118', 'D7.13 AN��Ӳ�л��ɹ���', 'ID120/ID119', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002119', 'ID119', 'D7.14 AN��Ӳ�л��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002120', 'ID120', 'D7.15 AN��Ӳ�л��ɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002121', 'ID121', 'D8.1 Ѱ����Ӧ��', 'ID123/ID122', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002122', 'ID122', 'D8.2 Ѱ���������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002123', 'ID123', 'D8.3 Ѱ����Ӧ�ܴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101114', 'MC5.40', 'BS�ڸ����л��������', 'SUM(VOICECALLSOFTERHOREQ)+SUM(DATACALLSOFTERHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101120', 'MC5.46', 'BS�����л��������', 'SUM(THEINTERMSCSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101121', 'MC5.47', 'BS�����л��ɹ�����', 'SUM(THEINTERMSCSOFTHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101130', 'MC6.8', '�ŵ����ռ����', 'SUM(CH_MAX_NUM)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101076', 'MC5.2', '�л��ɹ�����', 'sum(VOICECALLHARDHOCOMPLET)+sum(VOICECALLSOFTHOCOMPLET)+sum(VOICECALLSOFTERHOCOMPLET)+sum(DATACALLHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810070', 'MD4.1', 'D4.1 �û���Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO))/(SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO))*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101041', 'MC4.9', 'ҵ���ŵ�ӵ������', 'SUM(TCH_BLOCK_COUNT)+SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101042', 'MC4.10', 'ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) + SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT)+SUM(TCH_ASSIGN_ATT_HO_PS) -SUM(TCH_ASSIGN_SUC_HO_PS))/(SUM(TCH_SETUP_ATT) + SUM(TCH_ASSIGN_ATT_HO_PS)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101022', 'MC2.13', '�����л�������-PS(Erl)', 'SUM(WALSHCODE_ERL_PS)-SUM(SHO_TRAFFIC_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001091', 'ID91', '�л��ɹ�����-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001092', 'ID92', '�л��ɹ���-PS(%)', 'ID91/ID90', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001093', 'ID93', 'Ӳ�л��������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001094', 'ID94', 'Ӳ�л��ɹ�����-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001095', 'ID95', 'Ӳ�л��ɹ���-PS(%)', 'ID94/ID93', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001096', 'ID96', '���л��������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001097', 'ID97', '���л��ɹ�����-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001098', 'ID98', '���л��ɹ���-PS(%)', 'ID97/ID96', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001099', 'ID99', '�����л��������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001100', 'ID100', '�����л��ɹ�����-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001101', 'ID101', '�����л��ɹ���-PS(%)', 'ID100/ID99', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001102', 'ID102', 'BS���л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001103', 'ID103', 'BS���л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001104', 'ID104', 'BS���л��ɹ���(%)', 'ID103/ID102', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001105', 'ID105', 'BS���л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001106', 'ID106', 'BS���л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001107', 'ID107', 'BS���л��ɹ���(%)', 'ID106/ID105', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001108', 'ID108', 'BS��Ӳ�л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001109', 'ID109', 'BS��Ӳ�л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001110', 'ID110', 'BS��Ӳ�л��ɹ���(%)', 'ID109/ID108', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001111', 'ID111', 'BS�����л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001112', 'ID112', 'BS�����л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001113', 'ID113', 'BS�����л��ɹ���(%)', 'ID112/ID111', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001114', 'ID114', 'BS�ڸ����л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001115', 'ID115', 'BS�ڸ����л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001116', 'ID116', 'BS�ڸ����л��ɹ���(%)', 'ID115/ID114', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001117', 'ID117', 'BS��Ӳ�л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001118', 'ID118', 'BS��Ӳ�л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001119', 'ID119', 'BS��Ӳ�л��ɹ���(%)', 'ID118/ID117', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001120', 'ID120', 'BS�����л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001121', 'ID121', 'BS�����л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001122', 'ID122', 'BS�����л��ɹ���(%)', 'ID121/ID120', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001123', 'ID123', '��һ��Ƶ(283)��վ��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001124', 'ID124', '�ڶ���Ƶ(201)��վ��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001125', 'ID125', '������Ƶ(242)��վ��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001126', 'ID126', '������Ƶ(160)��վ��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001127', 'ID127', '1X��Ƶ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001128', 'ID128', '�ŵ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001129', 'ID129', '�ŵ�������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001130', 'ID130', '�ŵ����ռ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001131', 'ID131', '�ŵ����ռ����(%)', 'ID130/ID129', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001132', 'ID132', 'ǰ���ŵ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001133', 'ID133', 'ǰ���ŵ�������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001134', 'ID134', 'ǰ���ŵ����ռ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001135', 'ID135', 'ǰ���ŵ����ռ����(%)', '0', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001136', 'ID136', '�����ŵ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001137', 'ID137', '�����ŵ�������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001138', 'ID138', '�����ŵ����ռ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001139', 'ID139', '�����ŵ����ռ����(%)', '0', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001140', 'ID140', 'ǰ���ش���֡��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001141', 'ID141', 'ǰ������֡��-�������ش�', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001142', 'ID142', 'RLP��ǰ���ŵ��з��͵�������-�����ش�(KB)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001143', 'ID143', 'RLP��ǰ���ŵ����ش���������(�ֽ�)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001144', 'ID144', 'RLPǰ����������(�ֽ�)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001145', 'ID145', 'ǰ���ŵ��ش���(%)', '0', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001146', 'ID146', '�����ش���֡��', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001147', 'ID147', '��������֡��-�������ش�', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001148', 'ID148', 'RLP�ڷ����ŵ��н��յ�������(KB)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001149', 'ID149', '�����ŵ��ش���(%)', 'ID146/ID147', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001150', 'ID150', 'C1.19��վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001151', 'ID151', 'C1.20����Ƶ��վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001152', 'ID152', 'C1.21˫��Ƶ��վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001153', 'ID153', 'C1.22����Ƶ��վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001154', 'ID154', 'C1.23����Ƶ��վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001155', 'ID155', 'C1.24С������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001156', 'ID156', 'C1.25����ƵС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001157', 'ID157', 'C1.26˫��ƵС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001158', 'ID158', 'C1.27����ƵС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001159', 'ID159', 'C1.28����ƵС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001160', 'ID160', 'C1.31�ŵ���Ԫ��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001161', 'ID161', 'C1.32��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001162', 'ID162', 'C1.33ҵ���ŵ�������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001163', 'ID163', 'C3.1ҵ���ŵ�������(%)', 'ID180/ID161', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001164', 'ID164', 'C3.2���л�����(%)', '(ID180-ID181)/ID181', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001165', 'ID165', 'C3.3�ŵ���Ԫ������(%)', 'ID178/ID160', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001166', 'ID166', 'C3.4ҵ���ŵ�ӵ����(%)', 'ID179/ID199', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001167', 'ID167', 'C3.5��æС������(%)', 'ID187/ID155', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001168', 'ID168', 'C3.6æС������(%)', 'ID188/ID155', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001169', 'ID169', 'C3.7����С������(%)', 'ID189/ID155', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001170', 'ID170', 'C3.8���������վ����(%)', 'ID191/ID150', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001171', 'ID171', 'C3.9�����վ����(%)', 'ID192/ID150', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001172', 'ID172', 'C6.2��վϵͳӲ�л��ɹ���(%)', 'ID202/ID201', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001173', 'ID173', 'C6.3ϵͳ���л��ɹ���(%)', 'ID204/ID203', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001174', 'ID174', 'C6.4ҵ���ŵ�������(%)', 'ID205/(ID194+ID196)', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001175', 'ID175', 'C6.5ͨ���ж���(%)', 'ID205/ID197', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001176', 'ID176', 'C6.6ƽ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001177', 'ID177', 'C6.7��С������(%)', 'ID190/ID155', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001178', 'ID178', 'C10.1�ŵ���Ԫ������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001179', 'ID179', 'C10.2ҵ���ŵ�ӵ������(���л�)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001180', 'ID180', 'C10.3ҵ���ŵ����صĻ�����(���л�)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001181', 'ID181', 'C10.4ҵ���ŵ����صĻ�����(�����л�)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001182', 'ID182', 'C10.5WALSH����ػ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001183', 'ID183', 'C10.6��һ��Ƶ(283)������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001184', 'ID184', 'C10.7�ڶ���Ƶ(201)������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001185', 'ID185', 'C10.8������Ƶ(242)������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001186', 'ID186', 'C10.9������Ƶ(160)������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001187', 'ID187', 'C10.10��æС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001188', 'ID188', 'C10.11æС������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001189', 'ID189', 'C10.12����С������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001190', 'ID190', 'C11.17��С������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001191', 'ID191', 'C10.13���������վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001192', 'ID192', 'C10.14�����վ����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001193', 'ID193', 'C11.4����ҵ���ŵ������������(�����л���������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001194', 'ID194', 'C11.5����ҵ���ŵ�����ɹ�����(�����л���������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001195', 'ID195', 'C11.6����ҵ���ŵ������������(�����л���������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001196', 'ID196', 'C11.7����ҵ���ŵ�����ɹ�����(�����л���������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001197', 'ID197', 'C11.8ҵ���ŵ������������(�����л�������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001198', 'ID198', 'C11.9ҵ���ŵ�����ɹ�����(�����л�������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001199', 'ID199', 'C11.10ҵ���ŵ������������(���л�������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001200', 'ID200', 'C11.11ҵ���ŵ�����ɹ�����(���л�������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001201', 'ID201', 'C11.12��վϵͳӲ�л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001202', 'ID202', 'C11.13��վϵͳӲ�л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001203', 'ID203', 'C11.14ϵͳ���л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001204', 'ID204', 'C11.15ϵͳ���л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001205', 'ID205', 'C11.16ҵ���ŵ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001206', 'ID206', 'C11.18���г����ܴ���', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001207', 'ID207', 'Ԥ���ֶ�1', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001208', 'ID208', 'Ԥ���ֶ�2', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001209', 'ID209', 'Ԥ���ֶ�3', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001210', 'ID210', 'Ԥ���ֶ�4', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001211', 'ID211', 'Ԥ���ֶ�5', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042018', 'MD1.18', 'D1.18 A-Bis�ӿڴ���ƽ��������', '[MD1.20] / [MD10.19]', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042019', 'MD1.19', 'D1.19 A-Bis�ӿ����õĶ˿ڴ���', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042020', 'MD1.20', 'D1.20 A-Bis�ӿ�ƽ��ռ�ô���', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042021', 'MD1.21', 'D1.21 ��æ��վ��', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042022', 'MD1.22', 'D1.22 ���л�վ��', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041030', 'MC3.7', 'ҵ���ŵ���������-PS', 'SUM(DATE_DROP_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042024', 'MD2.2', 'D2.2 AT��������ӳɹ���', 'CASE WHEN SUM(nvl(AT_CONN_ATT_DO,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AT_CONN_SUC_DO,0))/SUM(nvl(AT_CONN_ATT_DO,0))*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042025', 'MD2.3', 'D2.3 AN��������ӳɹ���', 'CASE WHEN SUM(nvl(AN_CONN_ATT_DO,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AN_CONN_SUC_DO,0))/SUM(nvl(AN_CONN_ATT_DO,0))*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041064', 'MC4.32', 'ҵ���ŵ�����ɹ�����(������)-PS', 'SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042030', 'MD2.8', 'D2.8 �����������ӳɹ��ʣ���A8��A10 �ӿڣ�', '[MD2.9] / [MD2.10] * 100', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042031', 'MD2.9', 'D2.9 �����������ӳɹ���������A8��A10 �ӿڣ�', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042032', 'MD2.10', 'D2.10 �����������������������A8��A10 �ӿڣ�', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042033', 'MD2.11', 'D2.11 �û�������', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042034', 'MD2.12', 'D2.12 �û����ʹ���', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041025', 'MC3.2', 'ҵ���ŵ�������(%)', 'CASE WHEN (SUM(nvl(TCH_ASSIGN_SUC,0)) + SUM(nvl(DATA_SRLSNUM_PS,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATE_DROP_NUM,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATE_DROP_NUM,0)))/(SUM(TCH_ASSIGN_SUC) + SUM(DATA_SRLSNUM_PS)),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041074', 'MC4.42', 'ҵ���ŵ�ӵ����-���л�PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_SHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_SHO_PS)-SUM(TCH_ASSIGN_SUC_SHO_PS))/SUM(TCH_ASSIGN_ATT_SHO_PS) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041090', 'MC5.16', '�л��������-PS', 'SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041091', 'MC5.17', '�л��ɹ�����-PS', 'SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041092', 'MC5.18', '�л��ɹ���-PS(%)', 'CASE WHEN SUM(DATE_HO_ATT_NUM)=0 THEN 0 ELSE ROUND(SUM(DATA_HO_SUCC_NUM)/SUM(DATE_HO_ATT_NUM) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041095', 'MC5.21', 'Ӳ�л��ɹ���-PS(%)', 'CASE WHEN SUM(HHO_ATT_NUM_PS)=0 THEN 0 ELSE ROUND(SUM(HHO_SUC_NUM_PS)/SUM(HHO_ATT_NUM_PS) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041098', 'MC5.24', '���л��ɹ���-PS(%)', 'CASE WHEN SUM(SHO_ATT_NUM_PS)=0 THEN 0 ELSE ROUND(SUM(SHO_SUC_NUM_PS)/SUM(SHO_ATT_NUM_PS) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041104', 'MC5.30', 'BS���л��ɹ���(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INNER_BSC_SOFTERHO_SUCC))/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041142', 'MC7.3', 'RLP��ǰ���ŵ��з��͵�������-�����ش�(KB)', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041143', 'MC7.4', 'RLP��ǰ���ŵ����ش���������(�ֽ�)', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041144', 'MC7.5', 'RLPǰ����������(�ֽ�)', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041145', 'MC7.6', 'ǰ���ŵ��ش���(%)', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101026', 'MC3.3', '���������', 'CASE WHEN (SUM(TCH_DROP_NUM) + sum(DATACALLSDROP))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + sum(DATACALLSDROP)),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101029', 'MC3.6', '���������-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810152', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0810', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810153', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0810', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810154', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0810', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810155', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0810', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810156', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0810', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101207', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0810', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101208', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0810', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101209', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0810', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101210', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0810', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101211', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0810', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810062', 'MD3.12', 'D3.12 SessionЭ�̳ɹ�����', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810063', 'MD3.13', 'D3.13 SessionЭ��ʧ�ܴ���', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101033', 'MC4.1', 'ҵ���ŵ������������(����)', 'SUM(TCH_SETUP_ATT)+SUM(TCH_ASSIGN_ATT_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101055', 'MC4.23', 'ҵ���ŵ�ӵ����-Ӳ�л�CS(%)', 'CASE WHEN SUM(VOICECALLHARDHOREQ)=0 THEN 0 ELSE ROUND((SUM(VOICECALLHARDHOREQ)-SUM(VOICECALLHARDHOCOMPLET))/SUM(VOICECALLHARDHOREQ) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101058', 'MC4.26', 'ҵ���ŵ�ӵ����-���л�CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(((SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)) -(SUM(TCH_SETUP_SUC) - SUM(TCH_ASSIGN_SUC) - SUM(BSS_HHO_SUC))) /(SUM(TCH_SETUP_ATT) - SUM(TCH_ASSIGN_ATT_NUM) - SUM(BSS_HHO_ATT)) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101061', 'MC4.29', 'ҵ���ŵ�����ʧ�ܴ���(����)-PS', 'SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101054', 'MC4.22', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-CS', 'SUM(VOICECALLHARDHOCOMPLET)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101035', 'MC4.3', 'ҵ���ŵ�����ʧ�ܴ���(����)', '(SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC))+(SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101066', 'MC4.34', 'ҵ���ŵ�����ɹ���(������)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(nvl(ESTDATACALLS3G, 0)) / SUM(TCH_ASSIGN_ATT_PS) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101068', 'MC4.36', 'ҵ���ŵ�ӵ����-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HO_PS)-SUM(TCH_ASSIGN_SUC_HO_PS))/SUM(TCH_ASSIGN_ATT_HO_PS) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101071', 'MC4.39', 'ҵ���ŵ�ӵ����-Ӳ�л�PS(%)', 'CASE WHEN SUM(DATACALLHARDHOREQ)=0 THEN 0 ELSE ROUND((SUM(DATACALLHARDHOREQ)-SUM(DATACALLHARDHOCOMPLET))/SUM(DATACALLHARDHOREQ) * 100,4) END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101072', 'MC4.40', 'ҵ���ŵ������������-���л�-PS', 'SUM(DATACALLSOFTERHOREQ)+SUM(DATACALLSOFTHOREQ)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810008', 'MD1.8', 'D1.8 ����CE���æ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810009', 'MD1.9', 'D1.9 ����CE������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810010', 'MD1.10', 'D1.10 ǰ��ҵ��MacIndex���������', '[MD1.11] / [MD10.10] * 100 ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810011', 'MD1.11', 'D1.11 ǰ��ҵ��MacIndex���æ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810012', 'MD1.12', 'D1.12 PCF����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810013', 'MD1.13', 'D1.13 PCF��������ƽ������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042017', 'MD1.17', 'D1.17 PCF���õ��������������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810015', 'MD1.15', 'D1.15 PCF������ͬʱ֧�ֵļ����HRPD�Ự����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041149', 'MC7.10', '�����ŵ��ش���(%)', 'CASE WHEN SUM(TX_FRM_NUM_REV_1X)=0 THEN 0 ELSE ROUND(SUM(RETX_FRM_NUM_REV_1X)/SUM(TX_FRM_NUM_REV_1X) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810016', 'MD1.16', 'D1.16 PCF���õ��������������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810017', 'MD1.17', 'D1.17 PCF���õ��������������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041150', 'MC8.1', 'C1.19��վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041163', 'MC9.1', 'C3.1ҵ���ŵ�������(%)', 'case when SUM(WIRELESS_CAPACITY) = 0 then 0 else ROUND(SUM(SHO_TRAFFIC_CS) / SUM(WIRELESS_CAPACITY) * 100, 2) end', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041165', 'MC9.3', 'C3.3�ŵ���Ԫ������(%)', '[MC10.1] / [MC8.11] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810018', 'MD1.18', 'D1.18 A-Bis�ӿڴ���ƽ��������', '[MD1.20] / [MD10.19]', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041166', 'MC9.4', 'C3.4ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041167', 'MC9.5', 'C3.5��æС������(%)', '[MC10.10] / [MC8.6] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810019', 'MD1.19', 'D1.19 A-Bis�ӿ����õĶ˿ڴ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810020', 'MD1.20', 'D1.20 A-Bis�ӿ�ƽ��ռ�ô���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810021', 'MD1.21', 'D1.21 ��æ��վ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810022', 'MD1.22', 'D1.22 ���л�վ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810024', 'MD2.2', 'D2.2 AT��������ӳɹ���', 'CASE WHEN SUM(nvl(AT_INIT_ATT_CONN,0))=0 THEN 0 ELSE ROUND(SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))/SUM(nvl(AT_INIT_ATT_CONN,0))*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041168', 'MC9.6', 'C3.6æС������(%)', '[MC10.11] / [MC8.6] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810025', 'MD2.3', 'D2.3 AN��������ӳɹ���', 'DECODE(SUM(AN_INIT_ATT_CONN),0,0,ROUND(SUM(AN_INIT_ESTABLISHED_CONN)/SUM(AN_INIT_ATT_CONN),4)*100)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810030', 'MD2.8', 'D2.8 �����������ӳɹ��ʣ���A8��A10 �ӿڣ�', '[MD2.9] / [MD2.10] * 100', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810031', 'MD2.9', 'D2.9 �����������ӳɹ���������A8��A10 �ӿڣ�', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810032', 'MD2.10', 'D2.10 �����������������������A8��A10 �ӿڣ�', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041169', 'MC9.7', 'C3.7����С������(%)', '[MC10.12] / [MC8.6] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041170', 'MC9.8', 'C3.8���������վ����(%)', '[MC10.14] / [MC8.1] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810033', 'MD2.11', 'D2.11 �û�������', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810034', 'MD2.12', 'D2.12 �û����ʹ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810035', 'MD2.13', 'D2.13 �������ӽ���ʧ�ܴ�����ԭ��Ϊ������Դʧ�ܣ�', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810036', 'MD2.14', 'D2.14 �������ӽ���ʧ�ܴ�����ԭ��Ϊ����ҵ���ŵ�����ʧ�ܣ�', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810037', 'MD2.15', 'D2.15 �������ӽ���ʧ�ܴ�����ԭ��Ϊû���յ�TCC ��Ϣ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810039', 'MD2.17', 'D2.17 ���������ͷŴ���(����PDSN Ҫ���ͷŴ���)', '[MD2.16] - [MD2.18]', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041171', 'MC9.9', 'C3.9�����վ����(%)', '[MC10.15] / [MC8.1] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041172', 'MC9.10', 'C6.2��վϵͳӲ�л��ɹ���(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810040', 'MD2.18', 'D2.18 PDSNԭ��Ҫ���ͷŴ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810045', 'MD2.23', 'D2.23 ���������', 'CASE WHEN (SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))=0 THEN 0 ELSE ROUND((SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))/(SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100,2) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810048', 'MD2.26', 'D2.26 DRC ǰ������Ϊ�zС��307.2K�{���������', '[MD10.11] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810049', 'MD2.27', 'D2.27 DRC ǰ������Ϊ�z307.2K ��1228K�{���������', '[MD10.12] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041173', 'MC9.11', 'C6.3ϵͳ���л��ɹ���(%)', 'CASE WHEN SUM(S_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(S_SHO_SUC)/SUM(S_SHO_ATT) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041174', 'MC9.12', 'C6.4ҵ���ŵ�������(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/(SUM(O_TCH_ASSIGN_SUC)+SUM(P_TCH_ASSIGN_SUC)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810050', 'MD2.28', 'D2.28 DRC ǰ������Ϊ�z����1228K�{���������', '[MD10.13] / ([MD10.11] + [MD10.12] + [MD10.13]) ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810054', 'MD3.4', 'D3.4 UATI����ʧ�ܴ���', 'SUM(nvl(UATI_ATT_NUM,0))-SUM(nvl(UATI_SUC_NUM,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810055', 'MD3.5', 'D3.5 UATIƽ������ʱ��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810056', 'MD3.6', 'D3.6 Session�����Ȩ�ɹ���', '[MD3.7] / [MD3.8] * 100', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810057', 'MD3.7', 'D3.7 Session�����Ȩ�ɹ�����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810058', 'MD3.8', 'D3.8 Session�����Ȩ�������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810059', 'MD3.9', 'D3.9 Session�����Ȩ�ܾ�����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810060', 'MD3.10', 'D3.10 Session�����Ȩʧ�ܴ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810061', 'MD3.11', 'D3.11 SessionЭ�̳ɹ���', 'CASE WHEN SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO)/(SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810004', 'MD1.4', 'D1.4 ����Ƶ��վ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810005', 'MD1.5', 'D1.5 ����Ƶ�����ϻ�վ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810006', 'MD1.6', 'D1.6 ��������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041175', 'MC9.13', 'C6.5ͨ���ж���(%)', 'CASE WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(nvl(CALL_SETUP_SUCC_CS,0)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041176', 'MC9.14', 'C6.6ƽ���������', 'CASE WHEN SUM(nvl(TCH_DROP_NUM,0))=0 THEN 0 ELSE ROUND(SUM(nvl(TRAFFIC_CS,0))*60/SUM(nvl(TCH_DROP_NUM,0)),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810007', 'MD1.7', 'D1.7 ����CE���������', '[MD1.8] / [MD1.9] * 100 ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810064', 'MD3.14', 'D3.14 Session��AN Dormant�л��ɹ���(%)', '[MD3.16] /  [MD3.15] * 100', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810065', 'MD3.15', 'D3.15 Session��AN Dormant�л�����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810066', 'MD3.16', 'D3.16 Session��AN Dormant�л��ɹ�����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810067', 'MD3.17', 'D3.17 Session�Ự��', '[MD3.18] + [MD3.19]', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810068', 'MD3.18', 'D3.18 Active̬Session�Ự��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810069', 'MD3.19', 'D3.19 ��Active̬Session�Ự��', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810071', 'MD4.2', 'D4.2 �û���Dormant̬��Active̬�ļ��������ܴ���', 'SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810072', 'MD4.3', 'D4.3 �û���Dormant̬��Active̬�ļ���ɹ��ܴ���', 'SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810073', 'MD4.4', 'D4.4 AT �����Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO)/SUM(AT_DOR2ACT_ATT_DO)*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810077', 'MD4.8', 'D4.8 AN�����Dormant̬��Active̬����ɹ���', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND((SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO))/SUM(AN_DOR2ACT_ATT_DO)*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810084', 'MD5.4', 'D5.4 ���л�������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810085', 'MD5.5', 'D5.5 ���л�����', '[MD5.4] / [MD5.2] ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810086', 'MD6.1', 'D6.1 PCF������������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810087', 'MD6.2', 'D6.2 PCFǰ����������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810088', 'MD6.3', 'D6.3 PCF���յķ������ҵ����ܰ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810089', 'MD6.4', 'D6.4 PCF���յ�ǰ��������ݵ��ܰ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810090', 'MD6.5', 'D6.5 �������ҵ����PCF�����İ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810091', 'MD6.6', 'D6.6 ǰ�����ҵ����PCF�����İ���', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810092', 'MD6.7', 'D6.7 PCF������鶪����', '[MD6.5] / [MD6.3] ', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810093', 'MD6.8', 'D6.8 PCFǰ����鶪����', '[MD6.6] / [MD6.4]', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810094', 'MD6.9', 'D6.9 ǰ��RLP����������', 'ROUND(SUM(FWD_RLP_DATA)*8/(1000*3600),4)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810095', 'MD6.10', 'D6.10 ǰ��RLP�ش���', 'CASE WHEN SUM(FWD_RLP_DATA)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO)/SUM(FWD_RLP_DATA)*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810096', 'MD6.11', 'D6.11 ����RLP����������', 'ROUND(SUM(RLP_RXED_RTC)*8/(100*3600),4)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810097', 'MD6.12', 'D6.12 ����RLP�ش���', 'CASE WHEN SUM(RTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(MISSING_RLP_REQ_RTC)/SUM(RTCH_RLP_TX_DO)*100,4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810099', 'MD6.14', 'D6.14 ǰ��ҵ���ŵ������ͻ��������', 'CASE WHEN SUM(FWD_RLP_TOT_SLOT)=0 THEN 0 ELSE ROUND(SUM(FTCH_PHY_TX_BIT_DO)/1000/(SUM(FWD_RLP_TOT_SLOT)*0.001667),4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810101', 'MD6.16', 'D6.16 ����ҵ���ŵ������ͻ��������', 'CASE WHEN SUM(NUM_SUBPKTS_RL)=0 THEN 0 ELSE ROUND(SUM(REV_PHY_AVG_BYTE)*(8*1000)/(SUM(NUM_SUBPKTS_RL)* 0.00667),4) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810102', 'MD6.17', 'D6.17 ǰ�������ҵ���ŵ�ʱ϶ռ����', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),3)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810103', 'MD6.18', 'D6.18 ǰ�����������ŵ�ʱ϶ռ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810104', 'MD6.19', 'D6.19 ��������ŵ�ʱ϶ռ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810105', 'MD6.20', 'D6.20 ������·��æ��', '[MD10.8] / ([MD10.8] + [MD10.9]) * 100', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810109', 'MD7.4', 'D7.4 AN�����л��ɹ���', '[MD7.6] / [MD7.5]', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810110', 'MD7.5', 'D7.5 AN�����л��������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810111', 'MD7.6', 'D7.6 AN�����л��ɹ�����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810112', 'MD7.7', 'D7.7 AN�����л��ɹ���', '[MD7.9] / [MD7.8]', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113', 'MD7.8', 'D7.8 AN�����л��������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810114', 'MD7.9', 'D7.9 AN�����л��ɹ�����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810115', 'MD7.10', 'D7.10 AN��Ӳ�л��ɹ���', '[MD7.12] / [MD7.11] * 100', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810116', 'MD7.11', 'D7.11 AN��Ӳ�л��������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810117', 'MD7.12', 'D7.12 AN��Ӳ�л��ɹ�����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810118', 'MD7.13', 'D7.13 AN��Ӳ�л��ɹ���', '[MD7.15] / [MD7.14]', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810119', 'MD7.14', 'D7.14 AN��Ӳ�л��������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810120', 'MD7.15', 'D7.15 AN��Ӳ�л��ɹ�����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810121', 'MD8.1', 'D8.1 Ѱ����Ӧ��', '[MD8.3] / [MD8.2] * 100', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810122', 'MD8.2', 'D8.2 Ѱ���������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810123', 'MD8.3', 'D8.3 Ѱ����Ӧ�ܴ���', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810124', 'MD9.1', '����DO��Ƶ(37)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810125', 'MD9.2', '����DO��Ƶ(78)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810126', 'MD9.3', '����DO��Ƶ(119)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810127', 'MD9.4', 'DO��Ƶ����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810128', 'MD9.5', 'Do��Ƶ������(37)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810129', 'MD9.6', 'Do��Ƶ������(78)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810130', 'MD9.7', 'Do��Ƶ������(119)', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810131', 'MD9.8', '��DO��ƵС������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810132', 'MD9.9', '˫DO��ƵС������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810133', 'MD9.10', '��DO��ƵС������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810134', 'MD9.11', 'DOС������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810135', 'MD10.1', '�������ӽ�����ʱ��', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810136', 'MD10.2', '��������ռ����ʱ��', 'CASE WHEN (SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))+SUM(nvl(AN_INIT_ESTABLISHED_CONN,0)))=0 THEN 0 ELSE ROUND((SUM(EVM_AVG_DRC_POINTED_USERS)*3600*(SUM(AT_INIT_ESTABLISHED_CONN)+SUM(AN_INIT_ESTABLISHED_CONN)))/(SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))+SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))),2) END', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810137', 'MD10.3', 'Session������ʱ��', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810139', 'MD10.5', 'ǰ�����ֽ���', 'SUM(FWD_RLP_DATA)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810140', 'MD10.6', '�����ش��ֽ���', 'SUM(MISSING_RLP_REQ_RTC)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810142', 'MD10.8', 'RAB��æ����', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810143', 'MD10.9', 'RAB�д���', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810144', 'MD10.10', 'ǰ��ҵ��MacIndex������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810145', 'MD10.11', 'DRC ǰ������Ϊ�zС��307.2K�{���������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810146', 'MD10.12', 'DRC ǰ������Ϊ�z307.2K ��1228K�{���������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810147', 'MD10.13', 'DRC ǰ������Ϊ�z����1228K�{���������', '', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810149', 'MD10.15', 'ǰ������㷢��ʵ��ռ��ʱ϶ʱ��', 'SUM(FWD_RLP_TOT_SLOT)*0.001667', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810150', 'MD10.16', '����ҵ���ŵ��������յ�bit��', 'SUM(REV_PHY_AVG_BYTE)*(8*1000000)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041177', 'MC9.15', 'C6.7��С������(%)', '[MC10.13] / [MC8.6] * 100', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810151', 'MD10.17', '������������ʵ��ռ��ʱ϶ʱ��', 'SUM(FWD_RLP_TOT_SLOT)*0.001667', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101011', 'MC2.2', 'ҵ���ŵ�������(������)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101180', 'MC10.3', 'C10.3ҵ���ŵ����صĻ�����(���л�)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041148', 'MC7.9', 'RLP�ڷ����ŵ��н��յ�������(KB)', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042067', 'MD3.17', 'D3.17 Session�Ự��', 'SUM(SESSION_ACTIVE_NUM_DO)+SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042071', 'MD4.2', 'D4.2 �û���Dormant̬��Active̬�ļ��������ܴ���', 'SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042072', 'MD4.3', 'D4.3 �û���Dormant̬��Active̬�ļ���ɹ��ܴ���', 'SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042073', 'MD4.4', 'D4.4 AT �����Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO)/SUM(AT_DOR2ACT_ATT_DO)*100,4) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042039', 'MD2.17', 'D2.17 ���������ͷŴ���(����PDSN Ҫ���ͷŴ���)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))-SUM(REL_NUM_PDSN_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041205', 'MC11.13', 'C11.16ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042026', 'MD2.4', 'D2.4 AT��������������������', 'SUM(nvl(AT_CONN_ATT_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042027', 'MD2.5', 'D2.5 AN��������������������', 'SUM(nvl(AN_CONN_ATT_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042028', 'MD2.6', 'D2.6 AT������������ӳɹ�����', 'SUM(nvl(AT_CONN_SUC_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810014', 'MD1.14', 'D1.14 PCF������ͬʱ֧�ֵ�HRPD�Ự����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101181', 'MC10.4', 'C10.4ҵ���ŵ����صĻ�����(�����л�)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810003', 'MD1.3', 'D1.3 ˫��Ƶ��վ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101164', 'MC9.2', 'C3.2���л�����(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810002', 'MD1.2', 'D1.2 ����Ƶ��վ����', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810044', 'MD2.22', 'D2.22 ���ߵ�����', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810098', 'MD6.13', 'D6.13 ǰ��ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042029', 'MD2.7', 'D2.7 AN������������ӳɹ�����', 'SUM(nvl(AN_CONN_SUC_DO,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042070', 'MD4.1', 'D4.1 �û���Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN (SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(AT_DOR2ACT_SUC_DO)+SUM(AN_DOR2ACT_SUC_DO)) /(SUM(AT_DOR2ACT_ATT_DO)+SUM(AN_DOR2ACT_ATT_DO)) * 100, 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042052', 'MD3.2', 'D3.2 UATI�������', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042053', 'MD3.3', 'D3.3 UATI����ɹ�����', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042127', 'MD9.4', 'DO��Ƶ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042128', 'MD9.5', 'Do��Ƶ������(37)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042129', 'MD9.6', 'Do��Ƶ������(78)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042130', 'MD9.7', 'Do��Ƶ������(119)', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042131', 'MD9.8', '��DO��ƵС������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042132', 'MD9.9', '˫DO��ƵС������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042133', 'MD9.10', '��DO��ƵС������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042134', 'MD9.11', 'DOС������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042139', 'MD10.5', 'ǰ�����ֽ���', 'SUM(FWD_RLP_AVG_THROUGHPUT_DO)*1024', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042144', 'MD10.10', 'ǰ��ҵ��MacIndex������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042145', 'MD10.11', 'DRC ǰ������Ϊ�zС��307.2K�{���������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042146', 'MD10.12', 'DRC ǰ������Ϊ�z307.2K ��1228K�{���������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042147', 'MD10.13', 'DRC ǰ������Ϊ�z����1228K�{���������', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042151', 'MD10.17', '������������ʵ��ռ��ʱ϶ʱ��', 'SUM(RLP_CALLKDURATION)', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042046', 'MD2.24', 'D2.24 ��������ƽ������ʱ��', 'CASE WHEN (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO))=0 THEN 0 ELSE ROUND(SUM(DO_SETUP_TIME)/ (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO)), 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042047', 'MD2.25', 'D2.25 ��������ƽ��ռ��ʱ��', 'CASE WHEN  (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO))=0 THEN 0 ELSE ROUND(SUM(DO_CONNECT_TIME)/ (SUM(AT_CONN_SUC_DO) + SUM(AN_CONN_SUC_DO)), 2) END', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041009', 'MC1.9', '���н����ɹ���-PS(%)', 'CASE WHEN SUM(CALL_ATT_NUM_PS)=0 THEN 0 WHEN (SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS))>=SUM(CALL_ATT_NUM_PS) THEN 99.99ELSE ROUND((SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS))/SUM(CALL_ATT_NUM_PS)* 100, 4) END ', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041010', 'MC2.1', 'ҵ���ŵ�������(����)(Erl)', 'SUM(SHO_TRAFFIC_CS)+SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041014', 'MC2.5', 'Walsh�뻰����-CS(Erl)', 'SUM(WALSHCODE_ERL)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041015', 'MC2.6', '���л�������-CS(Erl)', 'SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041016', 'MC2.7', '�����л�������-CS(Erl)', 'SUM(WALSHCODE_ERL)-SUM(SHO_TRAFFIC_CS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041017', 'MC2.8', '���л�����-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041021', 'MC2.12', '���л�������-PS(Erl)', 'SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041022', 'MC2.13', '�����л�������-PS(Erl)', 'SUM(SSHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041023', 'MC2.14', '���л�����-PS(%)', 'CASE WHEN SUM(TRAFFIC_PS)=0 THEN 0 ELSE ROUND(SUM(SHO_TRAFFIC_PS)/SUM(TRAFFIC_PS)* 100, 4) END ', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041031', 'MC3.8', 'ҵ���ŵ�������-PS(%)', 'CASE WHEN SUM(DATA_SRLSNUM_PS)=0 THEN 0 WHEN SUM(DATE_DROP_NUM)<=0 THEN 0.01 ELSE ROUND(SUM(DATE_DROP_NUM)/SUM(DATA_SRLSNUM_PS),4)*100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041033', 'MC4.1', 'ҵ���ŵ������������(����)', 'SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041034', 'MC4.2', 'ҵ���ŵ�����ɹ�����(����)', 'SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041036', 'MC4.4', 'ҵ���ŵ�����ɹ���(����)(%)', 'CASE WHEN (SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM))=0 THEN 0 ELSE ROUND((SUM(TCH_SETUP_SUC)+SUM(CMO_CALLSUCCNUM_PS)+SUM(PAG_SUCC_NUM_PS)+SUM(DATA_HO_SUCC_NUM))/(SUM(TCH_SETUP_ATT)+SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041037', 'MC4.5', 'ҵ���ŵ������������(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041039', 'MC4.7', 'ҵ���ŵ�����ʧ�ܴ���(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)-(SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041040', 'MC4.8', 'ҵ���ŵ�����ɹ���(������)(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS))=0 THEN 0 ELSE ROUND(((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)+SUM(TCH_ASSIGN_SUC_PS)))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041045', 'MC4.13', 'ҵ���ŵ�����ʧ�ܴ���(����)-CS', 'SUM(TCH_SETUP_ATT) - SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041047', 'MC4.15', 'ҵ���ŵ������������(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041049', 'MC4.17', 'ҵ���ŵ�����ʧ�ܴ���(������)-CS', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT) - SUM(P_TCH_ASSIGN_SUC)-SUM(O_TCH_ASSIGN_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041050', 'MC4.18', 'ҵ���ŵ�����ɹ���(������)-CS(%)', 'CASE WHEN (SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)) = 0 THEN 0   ELSE ROUND((SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC))/(SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)), 4)*100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041066', 'MC4.34', 'ҵ���ŵ�����ɹ���(������)-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_PS)/SUM(TCH_ASSIGN_ATT_PS) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041065', 'MC4.33', 'ҵ���ŵ�����ʧ�ܴ���(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)-SUM(TCH_ASSIGN_SUC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041026', 'MC3.3', '���������', 'CASE WHEN (SUM(TCH_DROP_NUM) + SUM(DATE_DROP_NUM))=0 THEN 0 ELSE ROUND((SUM(TRAFFIC_CS)+SUM(TRAFFIC_PS))*60/(SUM(TCH_DROP_NUM) + SUM(DATE_DROP_NUM)),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041029', 'MC3.6', '���������-CS', 'CASE WHEN SUM(TCH_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_CS)*60/SUM(TCH_DROP_NUM),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041032', 'MC3.9', '���������-PS', 'CASE WHEN SUM(DATE_DROP_NUM)=0 THEN 0 ELSE ROUND(SUM(TRAFFIC_PS)*60/SUM(DATE_DROP_NUM),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041041', 'MC4.9', 'ҵ���ŵ�ӵ������', 'SUM(TCH_BLOCK_COUNT)+ SUM(TCH_BLOCK_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041042', 'MC4.10', 'ҵ���ŵ�ӵ����(%)', 'CASE WHEN SUM(TCH_SETUP_ATT)=0 THEN 0 ELSE ROUND((SUM(TCH_BLOCK_COUNT) + SUM(TCH_BLOCK_NUM_PS))*100/SUM(TCH_SETUP_ATT),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041043', 'MC4.11', 'ҵ���ŵ������������(����)-CS', 'SUM(TCH_SETUP_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041002', 'MC1.2', '���н����ɹ�����', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(CMO_CALLSUCCNUM_PS,0))+sum(nvl(PAG_SUCC_NUM_PS,0))', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042152', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0804', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042153', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0804', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042154', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0804', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042155', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0804', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042156', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0804', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041207', 'MC12.1', 'Ԥ���ֶ�1', '', 'ZY0804', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041208', 'MC12.2', 'Ԥ���ֶ�2', '', 'ZY0804', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041209', 'MC12.3', 'Ԥ���ֶ�3', '', 'ZY0804', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041210', 'MC12.4', 'Ԥ���ֶ�4', '', 'ZY0804', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041211', 'MC12.5', 'Ԥ���ֶ�5', '', 'ZY0804', '', '1', '1X��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041044', 'MC4.12', 'ҵ���ŵ�����ɹ�����(����)-CS', 'SUM(TCH_SETUP_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041071', 'MC4.39', 'ҵ���ŵ�ӵ����-Ӳ�л�PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND((SUM(TCH_ASSIGN_ATT_HHO_PS)-SUM(TCH_ASSIGN_SUC_HHO_PS))/SUM(TCH_ASSIGN_ATT_HHO_PS) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041046', 'MC4.14', 'ҵ���ŵ�����ɹ���(����)-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0 ELSE ROUND(SUM(TCH_SETUP_SUC) /SUM(TCH_SETUP_ATT) * 100, 4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041051', 'MC4.19', 'ҵ���ŵ�ӵ������-CS', 'SUM(TCH_BLOCK_COUNT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041052', 'MC4.20', 'ҵ���ŵ�ӵ����-CS(%)', 'CASE WHEN SUM(TCH_SETUP_ATT) = 0 THEN 0   ELSE ROUND(SUM(TCH_BLOCK_COUNT)/SUM(TCH_SETUP_ATT),4)*100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041075', 'MC5.1', '�л��������', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041076', 'MC5.2', '�л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC)+ SUM(INNER_BSC_SHO_SUCC) + SUM(INNER_BSC_SOFTERHO_SUCC) + SUM(INTER_BSC_HHO_SUCC)+ SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041077', 'MC5.3', '�л��ɹ���(%)', 'CASE WHEN (SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT))=0 THEN 0 ELSE ROUND((SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC) + SUM(INNER_BSC_SOFTERHO_SUCC) + SUM(INTER_BSC_HHO_SUCC)+ SUM(INTER_BSC_SHO_SUCC))*100/(SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)+ SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)),2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041079', 'MC5.5', '�л��ɹ�����-CS', 'SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041068', 'MC4.36', 'ҵ���ŵ�ӵ����-PS(%)', 'CASE WHEN (SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM))=0 THEN 0 ELSE ROUND(SUM(TCH_BLOCK_NUM_PS)/(SUM(CALL_ATT_NUM_PS)+SUM(DATE_HO_ATT_NUM)) * 100,2) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041080', 'MC5.6', '�л��ɹ���-CS(%)', 'CASE WHEN (SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)) = 0 THEN 0 ELSE  ROUND( (SUM(BSS_HHO_SUC)+SUM(S_SHO_SUC))/(SUM(BSS_HHO_ATT)+ SUM(S_SHO_ATT)), 3) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041081', 'MC5.7', 'Ӳ�л��������-CS', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002001', 'ID1', 'D1.1 DO��վ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002002', 'ID2', 'D1.2 ����Ƶ��վ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002003', 'ID3', 'D1.3 ˫��Ƶ��վ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002004', 'ID4', 'D1.4 ����Ƶ��վ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002005', 'ID5', 'D1.5 ����Ƶ�����ϻ�վ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002006', 'ID6', 'D1.6 ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002007', 'ID7', 'D1.7 ����CE���������', 'ID8/ID9', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002008', 'ID8', 'D1.8 ����CE���æ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002009', 'ID9', 'D1.9 ����CE������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002010', 'ID10', 'D1.10 ǰ��ҵ��MacIndex���������', 'ID11/ID144', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002011', 'ID11', 'D1.11 ǰ��ҵ��MacIndex���æ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002012', 'ID12', 'D1.12 PCF����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002013', 'ID13', 'D1.13 PCF��������ƽ������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002014', 'ID14', 'D1.14 PCF������ͬʱ֧�ֵ�HRPD�Ự����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002015', 'ID15', 'D1.15 PCF������ͬʱ֧�ֵļ����HRPD�Ự����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002016', 'ID16', 'D1.16 PCF���õ��������������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002017', 'ID17', 'D1.17 PCF���õ��������������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002018', 'ID18', 'D1.18 A-Bis�ӿڴ���ƽ��������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002019', 'ID19', 'D1.19 A-Bis�ӿ����õĶ˿ڴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002020', 'ID20', 'D1.20 A-Bis�ӿ�ƽ��ռ�ô���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002021', 'ID21', 'D1.21 ��æ��վ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002022', 'ID22', 'D1.22 ���л�վ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002023', 'ID23', 'D2.1 �������ӳɹ���', '(ID28+ID29)/(ID26+ID27)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002024', 'ID24', 'D2.2 AT��������ӳɹ���', 'ID28/ID26', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002025', 'ID25', 'D2.3 AN��������ӳɹ���', 'ID29/ID27', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002026', 'ID26', 'D2.4 AT��������������������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002027', 'ID27', 'D2.5 AN��������������������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002028', 'ID28', 'D2.6 AT������������ӳɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002029', 'ID29', 'D2.7 AN������������ӳɹ�����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002030', 'ID30', 'D2.8 �����������ӳɹ��ʣ���A8��A10 �ӿڣ�', 'ID31/ID32', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002031', 'ID31', 'D2.9 �����������ӳɹ���������A8��A10 �ӿڣ�', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002032', 'ID32', 'D2.10 �����������������������A8��A10 �ӿڣ�', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002033', 'ID33', 'D2.11 �û�������', 'ID34/(ID26+ID27)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002034', 'ID34', 'D2.12 �û����ʹ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002035', 'ID35', 'D2.13 �������ӽ���ʧ�ܴ�����ԭ��Ϊ������Դʧ�ܣ�', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002036', 'ID36', 'D2.14 �������ӽ���ʧ�ܴ�����ԭ��Ϊ����ҵ���ŵ�����ʧ�ܣ�', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002037', 'ID37', 'D2.15 �������ӽ���ʧ�ܴ�����ԭ��Ϊû���յ�TCC ��Ϣ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002038', 'ID38', 'D2.16 ���������ͷŴ���(��PDSN Ҫ���ͷŴ���)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002039', 'ID39', 'D2.17 ���������ͷŴ���(����PDSN Ҫ���ͷŴ���)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002040', 'ID40', 'D2.18 PDSNԭ��Ҫ���ͷŴ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002041', 'ID41', 'D2.19 ���ߵ��ߴ������տڶ�ʧ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002042', 'ID42', 'D2.20 ���ߵ��ߴ�����Ӳ�л�ʧ�ܵ��µĵ��ߣ�', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002043', 'ID43', 'D2.21 ���ߵ��ߴ���������ԭ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002044', 'ID44', 'D2.22 ���ߵ�����', '(ID41+ID42+ID43)/(ID38+ID41+ID42+ID43)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002045', 'ID45', 'D2.23 ���������', '(ID40+ID41+ID42+ID43)/(ID38+ID41+ID42+ID43)', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041082', 'MC5.8', 'Ӳ�л��ɹ�����-CS', 'SUM(BSS_HHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041083', 'MC5.9', 'Ӳ�л��ɹ���-CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(BSS_HHO_SUC)/SUM(BSS_HHO_ATT),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041084', 'MC5.10', '���л��������-CS', 'SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041085', 'MC5.11', '���л��ɹ�����-CS', 'SUM(S_SHO_SUC)-SUM(S_SSHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041086', 'MC5.12', '���л��ɹ���-CS(%)', 'CASE WHEN (SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)) = 0 THEN 0 ELSE  ROUND((SUM(S_SHO_SUC)-SUM(S_SSHO_SUC))/(SUM(S_SHO_ATT)-SUM(S_SSHO_ATT)),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041087', 'MC5.13', '�����л��������-CS', 'SUM(S_SSHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041088', 'MC5.14', '�����л��ɹ�����-CS', 'SUM(S_SSHO_SUC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041089', 'MC5.15', '�����л��ɹ���-CS(%)', 'CASE WHEN SUM(S_SSHO_ATT) = 0 THEN 0 ELSE  ROUND(SUM(S_SSHO_SUC)/SUM(S_SSHO_ATT),4) * 100 END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041156', 'MC8.7', 'C1.25����ƵС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041157', 'MC8.8', 'C1.26˫��ƵС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041158', 'MC8.9', 'C1.27����ƵС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041159', 'MC8.10', 'C1.28����ƵС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041123', 'MC6.1', '��һ��Ƶ(283)��վ��', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041124', 'MC6.2', '�ڶ���Ƶ(201)��վ��', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041125', 'MC6.3', '������Ƶ(242)��վ��', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041126', 'MC6.4', '������Ƶ(160)��վ��', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041127', 'MC6.5', '1X��Ƶ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041151', 'MC8.2', 'C1.20����Ƶ��վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', 'BSC��ʶ', 'case T1.VENDOR
when ''ZY0808'' THEN CITY.ENNAME||''.''||OMC.MSCNAME||''.''||T1.china_name
when ''ZY0810'' THEN CITY.ENNAME||''.''||OMC.MSCNAME|| ''.''||T1.china_name
whEN ''ZY0804'' THEN CITY.ENNAME||''.''||OMC.MSCNAME|| ''.''|| T1.china_name
ELSE ''ASS'' END', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', 'MSC��ʶ', 'OMC.MSCNAME', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3002', '', '��վ��ʶ', 'case BSC.vendor
when ''ZY0808'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
when ''ZY0804'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
when ''ZY0810'' then  CITY.ENNAME || ''.'' || replace(msc.mscname, ''MSC'', ''OMC'')|| ''.'' || BSC.CHINA_NAME||''.''||BTS.BTS_ID
else ''ASS''    end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3013', '', 'MSC��ʶ', 'MSC.MSCNAME', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3015', '', 'BSC��ʶ', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
when ''ZY0810'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
when ''ZY0804'' then CITY.ENNAME || ''.'' ||  MSC.MSCNAME || ''.'' || MSC.BSCNAME
else ''MSC��ʶ'' end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', 'MSC��ʶ', 'bb.MSCNAME', 'ZY0000', '', '1', 'MSC����', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '�豸��������', 'CITY.CITY_NAME ||''.''||OMC.MSCNAME ||''.'' || OMC.BSCNAME', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '��������', 'case T1.vendor when ''ZY0808'' THEN ''��Ϊ'' when ''ZY0810'' THEN ''����'' when ''ZY0804'' THEN ''����'' end ', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3016', '', '��������', 'case BSC.vendor when ''ZY0808'' THEN ''��Ϊ'' when ''ZY0810'' THEN ''����'' when ''ZY0804'' THEN ''����'' end ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '��������', '(case bb.vendor
       when ''ZY0808'' then ''��Ϊ''
       when ''ZY0810'' then ''����''  when ''ZY0804'' then ''����''

       end)', 'ZY0000', '', '1', 'MSC����', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', '�ⲿ��Ԫ��ʶ', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', 'ʡ��', '''{1}''', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '�����б�', 'CITY.CITY_NAME ', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', 'MGW��ʶ', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '����汾', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '�豸����', 'T1.EQUIP_NAME ', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '����ͺ�', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '��������', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '�����������', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '��վ����', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '��������', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '��Ƶ�BHCAֵ', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '��վ����', '(select count(*) bts_num
from ne_bts_c d
where d.related_bsc = T1. ne_sys_id) ', 'ZY0000', '', '2', '   BSC�����������', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '1X��վ����', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', 'DO��վ����', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '��������', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', 'PCF����', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '����λ��', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '��������', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '����', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', 'γ��', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '��ע', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2028', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2029', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2030', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2031', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2032', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '2', '   BSC�����������', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3003', '', '�ⲿ��Ԫ��ʶ', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3004', '', 'վ��', 'bts.bts_id', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3005', '', '��վ�豸����', 'bts.equip_name', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3006', '', '��վ������', 'replace(bts.china_name,'','',''.'')', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3007', '', '��վƴ��', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3008', '', '��վ����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3009', '', 'ʡ��', '''{1}''', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3010', '', '����', 'CITY.CITY_NAME', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3011', '', '��������', 'replace(ADM.COUNTY_NAME,''��'','''') ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3012', '', '�������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3014', '', 'MGW��ʶ', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3017', '', '����汾', 'case BSC.vendor
when ''ZY0808'' then  ''BSC6680''
when ''ZY0804'' then  ''V8''
when ''ZY0810'' then  ''R32''
else ''softVersion''    end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3018', '', '�豸�ͺ�', 'BTS.EQUIP_MODEL', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3019', '', '��վ�ȼ�', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3020', '', 'LAC', 'BTS.LAC', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3021', '', 'REG_ZONE', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3022', '', 'BSID', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3023', '', 'NID', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3025', '', '��������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3026', '', '1X��������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3027', '', 'DO��������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3028', '', '1X CE����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3029', '', 'DO CE����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3030', '', '����ABIS��E1��·����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3031', '', '��վ����', '1', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3032', '', 'ϵͳ����', 'case when (carr.bus_1x+carr.bus_do)= 2 then 1 else case when carr.bus_1x = 1 then 0 else 2 end  end ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3033', '', '���츲������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3034', '', '���߷�������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3035', '', '1Xվ������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3036', '', 'DOվ������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3037', '', '����״̬', '1', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3038', '', '����״̬', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3039', '', '����״̬�ж�ʱ��', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3040', '', '��վ��ͨ����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3041', '', '���Ժ', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3042', '', '����ڱ�', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3043', '', '��ά��λ', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3044', '', 'ά����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3045', '', 'ά���˵绰', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3046', '', 'Ӫ������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3047', '', '������������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3048', '', '��վ���', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3050', '', '������ֱ��վ����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3051', '', '����', 'BTS.LONGITUDE ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3052', '', 'γ��', 'BTS.LATITUDE    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3054', '', '��Φ����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3055', '', '��������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3056', '', '��������', 'BTS.WIRE_LOAD      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3057', '', '�����������', 'BTS.WIRE_LOAD_P    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3058', '', '����书��', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3059', '', '��������', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3060', '', '��������', 'BTS.ARCHITECTURE    ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3061', '', '��Դ', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3062', '', '���䷽ʽ', 'BTS.TRANSFERS      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3063', '', '�����豸', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3064', '', '�Ƿ���', 'BTS.ISRELATED      ', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3065', '', '�Ƿ�����', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3066', '', '���̲�BSC���', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3067', '', '���̲�SITE���', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3068', '', '��ע', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3069', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3070', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3071', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3072', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3073', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '3', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002124', 'ID124', '����DO��Ƶ(37)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002125', 'ID125', '����DO��Ƶ(78)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002126', 'ID126', '����DO��Ƶ(119)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002127', 'ID127', 'DO��Ƶ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002128', 'ID128', 'Do��Ƶ������(37)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002129', 'ID129', 'Do��Ƶ������(78)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002130', 'ID130', 'Do��Ƶ������(119)', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002131', 'ID131', '��DO��ƵС������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002132', 'ID132', '˫DO��ƵС������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002133', 'ID133', '��DO��ƵС������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002134', 'ID134', 'DOС������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002135', 'ID135', '�������ӽ�����ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002136', 'ID136', '��������ռ����ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002137', 'ID137', 'Session������ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002138', 'ID138', 'ǰ���ش��ֽ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002139', 'ID139', 'ǰ�����ֽ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002140', 'ID140', '�����ش��ֽ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002141', 'ID141', '������յ��ֽ���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002142', 'ID142', 'RAB��æ����', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002143', 'ID143', 'RAB�д���', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002144', 'ID144', 'ǰ��ҵ��MacIndex������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002145', 'ID145', 'DRC ǰ������Ϊ�zС��307.2K�{���������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002146', 'ID146', 'DRC ǰ������Ϊ�z307.2K ��1228K�{���������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002147', 'ID147', 'DRC ǰ������Ϊ�z����1228K�{���������', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002148', 'ID148', 'ǰ��ҵ���ŵ�����㷢�͵�bit��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002149', 'ID149', 'ǰ������㷢��ʵ��ռ��ʱ϶ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002150', 'ID150', '����ҵ���ŵ��������յ�bit��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002151', 'ID151', '������������ʵ��ռ��ʱ϶ʱ��', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002152', 'ID152', 'Ԥ���ֶ�1', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002153', 'ID153', 'Ԥ���ֶ�2', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002154', 'ID154', 'Ԥ���ֶ�3', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002155', 'ID155', 'Ԥ���ֶ�4', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002156', 'ID156', 'Ԥ���ֶ�5', '', 'ZY0000', '', '2', 'ʡ��˾DO��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001002', 'ID2', '���н����ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3049', '', 'վַ', 'substr(replace(BTS.ADDRESS,'','',''.''),0,30)', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001001', 'ID1', '���г��Դ���', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001003', 'ID3', '���н����ɹ���(%)', 'ID2/ID1', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001004', 'ID4', '���г��Դ���-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001005', 'ID5', '���н����ɹ�����-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001006', 'ID6', '���н����ɹ���-CS(%)', 'ID5/ID4', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001007', 'ID7', '���г��Դ���-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001008', 'ID8', '���н����ɹ�����-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001009', 'ID9', '���н����ɹ���-PS(%)', 'ID8/ID7', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001010', 'ID10', 'ҵ���ŵ�������(����)(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001011', 'ID11', 'ҵ���ŵ�������(������)(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001012', 'ID12', 'ҵ���ŵ�������(����)-CS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001013', 'ID13', 'ҵ���ŵ�������(������)-CS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001014', 'ID14', 'Walsh�뻰����-CS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001015', 'ID15', '���л�������-CS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001016', 'ID16', '�����л�������-CS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001017', 'ID17', '���л�����-CS(%)', 'ID15/(ID13+ID15)', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001018', 'ID18', 'ҵ���ŵ�������(����)-PS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001019', 'ID19', 'ҵ���ŵ�������(������)-PS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001020', 'ID20', 'Walsh�뻰����-PS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001021', 'ID21', '���л�������-PS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001022', 'ID22', '�����л�������-PS(Erl)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001023', 'ID23', '���л�����-PS(%)', 'ID21/ID19', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001024', 'ID24', 'ҵ���ŵ���������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001025', 'ID25', 'ҵ���ŵ�������(%)', 'ID24/ID38', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001026', 'ID26', '���������', 'ID11*60/ID24*100', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001027', 'ID27', 'ҵ���ŵ���������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001028', 'ID28', 'ҵ���ŵ�������-CS(%)', 'ID27/ID48', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001029', 'ID29', '���������-CS', 'ID13*60/ID27*100', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001030', 'ID30', 'ҵ���ŵ���������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001031', 'ID31', 'ҵ���ŵ�������-PS(%)', 'ID30/ID64', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001032', 'ID32', '���������-PS', 'ID19*60/ID30*100', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001033', 'ID33', 'ҵ���ŵ������������(����)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001034', 'ID34', 'ҵ���ŵ�����ɹ�����(����)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001035', 'ID35', 'ҵ���ŵ�����ʧ�ܴ���(����)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001036', 'ID36', 'ҵ���ŵ�����ɹ���(����)(%)', 'ID34/ID33', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001037', 'ID37', 'ҵ���ŵ������������(������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001038', 'ID38', 'ҵ���ŵ�����ɹ�����(������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001039', 'ID39', 'ҵ���ŵ�����ʧ�ܴ���(������)', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001040', 'ID40', 'ҵ���ŵ�����ɹ���(������)(%)', 'ID38/ID37', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001041', 'ID41', 'ҵ���ŵ�ӵ������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001042', 'ID42', 'ҵ���ŵ�ӵ����(%)', 'ID41/ID33', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001043', 'ID43', 'ҵ���ŵ������������(����)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001044', 'ID44', 'ҵ���ŵ�����ɹ�����(����)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001045', 'ID45', 'ҵ���ŵ�����ʧ�ܴ���(����)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001046', 'ID46', 'ҵ���ŵ�����ɹ���(����)-CS(%)', 'ID44/ID43', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001047', 'ID47', 'ҵ���ŵ������������(������)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001048', 'ID48', 'ҵ���ŵ�����ɹ�����(������)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001049', 'ID49', 'ҵ���ŵ�����ʧ�ܴ���(������)-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001050', 'ID50', 'ҵ���ŵ�����ɹ���(������)-CS(%)', 'ID48/ID47', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001051', 'ID51', 'ҵ���ŵ�ӵ������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001052', 'ID52', 'ҵ���ŵ�ӵ����-CS(%)', 'ID51/ID43', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001053', 'ID53', 'ҵ���ŵ������������-Ӳ�л�-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001054', 'ID54', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001055', 'ID55', 'ҵ���ŵ�ӵ����-Ӳ�л�CS(%)', '(ID53-ID54)/ID53', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001056', 'ID56', 'ҵ���ŵ������������-���л�-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001057', 'ID57', 'ҵ���ŵ�����ɹ�����-���л�-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001058', 'ID58', 'ҵ���ŵ�ӵ����-���л�CS(%)', '(ID56-ID57)/ID56', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001059', 'ID59', 'ҵ���ŵ������������(����)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001060', 'ID60', 'ҵ���ŵ�����ɹ�����(����)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001061', 'ID61', 'ҵ���ŵ�����ʧ�ܴ���(����)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001062', 'ID62', 'ҵ���ŵ�����ɹ���(����)-PS(%)', 'ID60/ID59', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001063', 'ID63', 'ҵ���ŵ������������(������)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001064', 'ID64', 'ҵ���ŵ�����ɹ�����(������)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001065', 'ID65', 'ҵ���ŵ�����ʧ�ܴ���(������)-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001066', 'ID66', 'ҵ���ŵ�����ɹ���(������)-PS(%)', 'ID64/ID63', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001067', 'ID67', 'ҵ���ŵ�ӵ������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001068', 'ID68', 'ҵ���ŵ�ӵ����-PS(%)', 'ID67/ID59', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001069', 'ID69', 'ҵ���ŵ������������-Ӳ�л�-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001070', 'ID70', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001071', 'ID71', 'ҵ���ŵ�ӵ����-Ӳ�л�PS(%)', '(ID69-ID70)/ID69', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001072', 'ID72', 'ҵ���ŵ������������-���л�-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001073', 'ID73', 'ҵ���ŵ�����ɹ�����-���л�-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001074', 'ID74', 'ҵ���ŵ�ӵ����-���л�PS(%)', '(ID72-ID73)/ID72', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001075', 'ID75', '�л��������', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001076', 'ID76', '�л��ɹ�����', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001077', 'ID77', '�л��ɹ���(%)', 'ID76/ID75', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001078', 'ID78', '�л��������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001079', 'ID79', '�л��ɹ�����-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001080', 'ID80', '�л��ɹ���-CS(%)', 'ID79/ID78', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001081', 'ID81', 'Ӳ�л��������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001082', 'ID82', 'Ӳ�л��ɹ�����-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001083', 'ID83', 'Ӳ�л��ɹ���-CS(%)', 'ID82/ID81', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001084', 'ID84', '���л��������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001085', 'ID85', '���л��ɹ�����-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001086', 'ID86', '���л��ɹ���-CS(%)', 'ID85/ID84', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001087', 'ID87', '�����л��������-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001088', 'ID88', '�����л��ɹ�����-CS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001089', 'ID89', '�����л��ɹ���-CS(%)', 'ID88/ID87', 'ZY0000', '', '1', 'ʡ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001090', 'ID90', '�л��������-PS', '', 'ZY0000', '', '1', 'ʡ1X��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810100', 'MD6.15', 'D6.15 ����ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101003', 'MC1.3', '���н����ɹ���(%)', 'CASE WHEN (SUM(nvl(CALL_ATT,0)) + SUM(nvl(DATACALLATT3G,0))) = 0 THEN 0 WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0)))>=(SUM(nvl(CALL_ATT,0)) + SUM(nvl(DATACALLATT3G,0))) THEN 99.99 ELSE   ROUND((SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0)))/(SUM(CALL_ATT) + SUM(DATACALLATT3G)),4) * 100 END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101028', 'MC3.5', 'ҵ���ŵ�������-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810038', 'MD2.16', 'D2.16 ���������ͷŴ���(��PDSN Ҫ���ͷŴ���)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810041', 'MD2.19', 'D2.19 ���ߵ��ߴ������տڶ�ʧ��', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041152', 'MC8.3', 'C1.21˫��Ƶ��վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042120', 'MD7.15', 'D7.15 AN��Ӳ�л��ɹ�����', 'SUM(INTER_AN_HHO_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041153', 'MC8.4', 'C1.22����Ƶ��վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041154', 'MC8.5', 'C1.23����Ƶ��վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041161', 'MC8.12', 'C1.32��������', 'round(AVG(WIRELESS_CAPACITY),2)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041183', 'MC10.6', 'C10.6��һ��Ƶ(283)������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041184', 'MC10.7', 'C10.7�ڶ���Ƶ(201)������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041185', 'MC10.8', 'C10.8������Ƶ(242)������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041186', 'MC10.9', 'C10.9������Ƶ(160)������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041055', 'MC4.23', 'ҵ���ŵ�ӵ����-Ӳ�л�CS(%)', 'CASE WHEN SUM(BSS_HHO_ATT)=0 THEN 0 ELSE ROUND((SUM(BSS_HHO_ATT) - SUM(BSS_HHO_SUC)) / SUM(BSS_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041072', 'MC4.40', 'ҵ���ŵ������������-���л�-PS', 'SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041073', 'MC4.41', 'ҵ���ŵ�����ɹ�����-���л�-PS', 'SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810042', 'MD2.20', 'D2.20 ���ߵ��ߴ�����Ӳ�л�ʧ�ܵ��µĵ��ߣ�', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810043', 'MD2.21', 'D2.21 ���ߵ��ߴ���������ԭ��', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810051', 'MD3.1', 'D3.1 UATI����ɹ���', 'CASE WHEN SUM(nvl(UATI_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(UATI_SUC_NUM,0))>=SUM(nvl(UATI_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(UATI_SUC_NUM,0)) / SUM(UATI_ATT_NUM) * 100, 2) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042054', 'MD3.4', 'D3.4 UATI����ʧ�ܴ���', 'SUM(UATI_ATT_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042055', 'MD3.5', 'D3.5 UATIƽ������ʱ��', 'SUM(UATI_AVG_SETUP_DURATION_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042059', 'MD3.9', 'D3.9 Session�����Ȩ�ܾ�����', 'SUM(AUTH_DENY_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042060', 'MD3.10', 'D3.10 Session�����Ȩʧ�ܴ���', 'SUM(AUTH_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042062', 'MD3.12', 'D3.12 SessionЭ�̳ɹ�����', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042063', 'MD3.13', 'D3.13 SessionЭ��ʧ�ܴ���', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042065', 'MD3.15', 'D3.15 Session��AN Dormant�л�����', 'SUM(SESS_INTER_AN_DORMHO_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042066', 'MD3.16', 'D3.16 Session��AN Dormant�л��ɹ�����', 'SUM(SESS_INTER_AN_DORMHO_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042094', 'MD6.9', 'D6.9 ǰ��RLP����������', 'ROUND(SUM(RLP_TXBYTENUM) * 8.0 / 1000 / 3600,4)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('701', '', '����38���ؼ�ָ��(1X)', '1,2,3,4,5,6,11,13,24,25,27,28,38,48,155,164,177,180,181,191', 'ZY0000', '', '1', '1X�ؼ�ָ��', '1', '7');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('702', '', '����38���ؼ�ָ��(DO)', '23,26,27,28,29,38,41,42,43,44,51,52,53,98,100,106,107,108', 'ZY0000', '', '2', 'DO�ؼ�ָ��', '1', '7');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042103', 'MD6.18', 'D6.18 ǰ�����������ŵ�ʱ϶ռ����', 'ROUND(AVG(FWD_PHY_CCH_SLOT_RATE_DO),4)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042110', 'MD7.5', 'D7.5 AN�����л��������', 'SUM(INN_BS_SHO_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042111', 'MD7.6', 'D7.6 AN�����л��ɹ�����', 'SUM(INN_BS_SHO_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042113', 'MD7.8', 'D7.8 AN�����л��������', 'SUM(INTER_BS_SHO_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042114', 'MD7.9', 'D7.9 AN�����л��ɹ�����', 'SUM(INTER_BS_SHO_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042057', 'MD3.7', 'D3.7 Session�����Ȩ�ɹ�����', 'SUM(AUTH_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042116', 'MD7.11', 'D7.11 AN��Ӳ�л��������', 'SUM(INN_AN_HHO_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042096', 'MD6.11', 'D6.11 ����RLP����������', 'ROUND(SUM(DO_RTCH_RLP_TX) * 8.0 / 1000 / 3600,4)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042117', 'MD7.12', 'D7.12 AN��Ӳ�л��ɹ�����', 'SUM(INN_AN_HHO_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042119', 'MD7.14', 'D7.14 AN��Ӳ�л��������', 'SUM(INTER_AN_HHO_ATT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042122', 'MD8.2', 'D8.2 Ѱ���������', 'SUM(PAGE_ATT_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042123', 'MD8.3', 'D8.3 Ѱ����Ӧ�ܴ���', 'SUM(PAGE_SUC_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042079', 'MD4.10', 'D4.10 AN�����Dormant��Active̬�ļ���ɹ�����', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042080', 'MD4.11', 'D4.11 AN�����Dormant̬��Active̬�ļ���ʧ�ܴ���', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042081', 'MD5.1', 'D5.1 ��Ч�û���', 'SUM(TRAFFIC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042083', 'MD5.3', 'D5.3 CE������', 'SUM(TRAFFIC_DO)+SUM(SFT_HO_TRAFFIC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042084', 'MD5.4', 'D5.4 ���л�������', 'SUM(SFT_HO_TRAFFIC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042086', 'MD6.1', 'D6.1 PCF������������', 'SUM(REV_THROUGHOUT_PCF_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042088', 'MD6.3', 'D6.3 PCF���յķ������ҵ����ܰ���', 'SUM(REV_PAK_TOTAL_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042089', 'MD6.4', 'D6.4 PCF���յ�ǰ��������ݵ��ܰ���', 'SUM(FWD_PAK_TOTAL_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042091', 'MD6.6', 'D6.6 ǰ�����ҵ����PCF�����İ���', 'SUM(FWD_PAK_DISCARD_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042008', 'MD1.8', 'D1.8 ����CE���æ��', 'SUM(RCE_MAX_BUSY_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042009', 'MD1.9', 'D1.9 ����CE������', 'SUM(RCE_RLB_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042035', 'MD2.13', 'D2.13 �������ӽ���ʧ�ܴ�����ԭ��Ϊ������Դʧ�ܣ�', 'SUM(CONN_SETUP_FAILED_RESF_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042040', 'MD2.18', 'D2.18 PDSNԭ��Ҫ���ͷŴ���', 'SUM(REL_NUM_PDSN_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041093', 'MC5.19', 'Ӳ�л��������-PS', 'SUM(HHO_ATT_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041094', 'MC5.20', 'Ӳ�л��ɹ�����-PS', 'SUM(HHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041096', 'MC5.22', '���л��������-PS', 'SUM(SHO_ATT_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041012', 'MC2.3', 'ҵ���ŵ�������(����)-CS(Erl)', 'SUM(TRAFFIC_CS)+SUM(SFT_HO_TRAFFIC_CS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041097', 'MC5.23', '���л��ɹ�����-PS', 'SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041099', 'MC5.25', '�����л��������-PS', 'SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041100', 'MC5.26', '�����л��ɹ�����-PS', 'SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810106', 'MD7.1', 'D7.1 ȫ�����л��ɹ���', 'CASE WHEN SUM(nvl(GSHO_ATT_NUM,0))=0 THEN 0 WHEN SUM(nvl(GSHO_SUC_NUM,0))>=SUM(nvl(GSHO_ATT_NUM,0)) THEN 99.99 ELSE ROUND(SUM(nvl(GSHO_SUC_NUM,0)) / SUM(GSHO_ATT_NUM) * 100, 2) END', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101001', 'MC1.1', '���г��Դ���', 'sum(nvl(CALL_ATT,0))+sum(nvl(DATACALLATT3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101002', 'MC1.2', '���н����ɹ�����', 'sum(nvl(CALL_SETUP_SUCC_CS,0))+sum(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101004', 'MC1.4', '���г��Դ���-CS', 'SUM(nvl(CALL_ATT,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101005', 'MC1.5', '���н����ɹ�����-CS', 'SUM(nvl(CALL_SETUP_SUCC_CS,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101024', 'MC3.1', 'ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))+SUM(nvl(DATACALLSDROP,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101038', 'MC4.6', 'ҵ���ŵ�����ɹ�����(������)', 'SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101048', 'MC4.16', 'ҵ���ŵ�����ɹ�����(������)-CS', 'SUM(P_TCH_ASSIGN_SUC)+SUM(O_TCH_ASSIGN_SUC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810023', 'MD2.1', 'D2.1 �������ӳɹ���', 'CASE WHEN (SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0)) )=0 THEN 0 WHEN (SUM(nvl(AT_INIT_ESTABLISHED_CONN,0)) +SUM(nvl(AN_INIT_ESTABLISHED_CONN,0)))>=(SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0))) THEN 99.99 ELSE ROUND((SUM(nvl(AT_INIT_ESTABLISHED_CONN,0)) +SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))) / (SUM(nvl(AT_INIT_ATT_CONN,0)) +SUM(nvl(AN_INIT_ATT_CONN,0))) * 100, 5) END', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810026', 'MD2.4', 'D2.4 AT��������������������', 'SUM(nvl(AT_INIT_ATT_CONN,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810083', 'MD5.3', 'D5.3 CE������', '', 'ZY0810', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810027', 'MD2.5', 'D2.5 AN��������������������', 'SUM(nvl(AN_INIT_ATT_CONN,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810028', 'MD2.6', 'D2.6 AT������������ӳɹ�����', 'SUM(nvl(AT_INIT_ESTABLISHED_CONN,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810029', 'MD2.7', 'D2.7 AN������������ӳɹ�����', 'SUM(nvl(AN_INIT_ESTABLISHED_CONN,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101205', 'MC11.13', 'C11.16ҵ���ŵ���������', 'SUM(nvl(TCH_DROP_NUM,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810052', 'MD3.2', 'D3.2 UATI�������', 'SUM(nvl(UATI_ATT_NUM,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810053', 'MD3.3', 'D3.3 UATI����ɹ�����', 'SUM(nvl(UATI_SUC_NUM,0))', 'ZY0810', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810107', 'MD7.2', 'D7.2 ȫ�����л��������', 'SUM(nvl(GSHO_ATT_NUM,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810108', 'MD7.3', 'D7.3 ȫ�����л��ɹ�����', 'SUM(nvl(GSHO_SUC_NUM,0))', 'ZY0810', '', '2', 'DO��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101006', 'MC1.6', '���н����ɹ���-CS(%)', 'CASE WHEN SUM(nvl(CALL_ATT,0)) = 0 THEN 0 WHEN SUM(nvl(CALL_SETUP_SUCC_CS,0))>=SUM(nvl(CALL_ATT,0)) THEN 99.99 ELSE   ROUND(SUM(nvl(CALL_SETUP_SUCC_CS,0))/SUM(nvl(CALL_ATT,0)),4) * 100 END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101007', 'MC1.7', '���г��Դ���-PS', 'sum(DATACALLATT3G)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101027', 'MC3.4', 'ҵ���ŵ���������-CS', 'SUM(TCH_DROP_NUM)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101030', 'MC3.7', 'ҵ���ŵ���������-PS', 'sum(DATACALLSDROP)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101064', 'MC4.32', 'ҵ���ŵ�����ɹ�����(������)-PS', 'SUM(nvl(ESTDATACALLS3G,0))', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101025', 'MC3.2', 'ҵ���ŵ�������(%)', 'CASE WHEN (SUM(nvl(CALL_SETUP_SUCC_CS,0)) + SUM(nvl(ESTDATACALLS3G,0))) = 0 THEN 0 WHEN (SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATACALLSDROP,0)))<=0 THEN 0.01 ELSE   ROUND((SUM(nvl(TCH_DROP_NUM,0)) + SUM(nvl(DATACALLSDROP,0)))/(SUM(CALL_SETUP_SUCC_CS) + SUM(ESTDATACALLS3G)),4) * 100 END', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101133', 'MC6.11', 'ǰ���ŵ�������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101134', 'MC6.12', 'ǰ���ŵ����ռ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101135', 'MC6.13', 'ǰ���ŵ����ռ����(%)', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101136', 'MC6.14', '�����ŵ���������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101137', 'MC6.15', '�����ŵ�������', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101138', 'MC6.16', '�����ŵ����ռ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101139', 'MC6.17', '�����ŵ����ռ����(%)', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101141', 'MC7.2', 'ǰ������֡��-�������ش�', 'SUM(FWD_RLP_DATA)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101143', 'MC7.4', 'RLP��ǰ���ŵ����ش���������(�ֽ�)', 'sum(TOTALRLPBYTESRETRFWDTRAFFIC)', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101144', 'MC7.5', 'RLPǰ����������(�ֽ�)', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101145', 'MC7.6', 'ǰ���ŵ��ش���(%)', '[MC7.4] / 1024 * [MC7.3] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101146', 'MC7.7', '�����ش���֡��', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101149', 'MC7.10', '�����ŵ��ش���(%)', '[MC7.7] / [MC7.8] * 100', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101150', 'MC8.1', 'C1.19��վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8101151', 'MC8.2', 'C1.20����Ƶ��վ����', '', 'ZY0810', '', '1', '1X��Ѷ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081084', 'MC5.10', '���л��������-CS', 'SUM(S_SHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081085', 'MC5.11', '���л��ɹ�����-CS', 'SUM(S_SHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4003', '', '�ⲿ��Ԫ��ʶ', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4004', '', 'ʡ��', '''{1}''', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4005', '', '����', 'CITY.CITY_NAME', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4006', '', '������', 'replace(ADM.COUNTY_NAME,''��'','''') ', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4009', '', '���̲�������ʶ', 'case BSC.vendor
when ''ZY0808'' then  SECTOR.SECTOR_ID
when ''ZY0804'' then  BTS.BTS_ID
when ''ZY0810'' then  SECTOR.SECTOR_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4010', '', '���̲�sector���', 'case BSC.vendor
when ''ZY0808'' then  SECTOR.SECTOR_ID
when ''ZY0804'' then  SECTOR.SECTOR_ID
when ''ZY0810'' then  SECTOR.SECTOR_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4012', '', '������ʶ_DO', 'case BSC.vendor
when ''ZY0808'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''')
when ''ZY0804'' then  to_char(SECTOR.CI)
when ''ZY0810'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4013', '', '����������', 'case BSC.vendor
when ''ZY0808'' then  replace(SECTOR.CHINA_NAME,'','',''��'')
when ''ZY0804'' then  replace(SECTOR.CHINA_NAME,'','',''��'')
when ''ZY0810'' then  replace(SECTOR.CHINA_NAME,'','',''��'') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4014', '', '����', 'SECTOR.LONGITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4015', '', 'γ��', 'SECTOR.LATITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4016', '', 'PN', 'SECTOR.PN', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4017', '', '��������', 'DECODE(SECTOR.SITE_TYPE,''1'',''��׼С��'',''2'',''΢����'',''3'',''RRU'',SECTOR.SITE_TYPE)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4018', '', '�Ƿ�����', 'DECODE(SECTOR.ISINDOOR,0,''��'',1,''��'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4019', '', '�Ƿ�RRU����', 'DECODE(SECTOR.SITE_TYPE,''3'',''��'',''��'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4020', '', '�Ƿ�Ϊ��RRU��PN����', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4021', '', '�Ƿ񹦷�����', 'SECTOR.ISCELLSPLIT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4022', '', '�����������', 'SECTOR.WIRE_LOAD_P', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4023', '', 'MSC��ʶ', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.MSCNAME
when ''ZY0810'' then CITY.ENNAME||''_''||MSC.MSCNAME
when ''ZY0804'' then CITY.ENNAME||''_''||MSC.MSCNAME end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4024', '', 'MGW��ʶ', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4025', '', 'BSC��ʶ', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.MSCNAME||''.''||MSC.BSCNAME
when ''ZY0810'' then CITY.ENNAME||''_''||MSC.MSCNAME||''.''||MSC.BSCNAME
when ''ZY0804'' then MSC.BSCNAME end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4026', '', 'BTS��ʶ', 'CASE BSC.vendor
when ''ZY0808'' then CITY.ENNAME||''_''||MSC.BSCNAME||''.''||BTS.BTS_ID
when ''ZY0810'' then MSC.BSCNAME||''.''||BTS.BTS_ID
when ''ZY0804'' then CITY.ENNAME||''_''||MSC.BSCNAME||''.''||BTS.BTS_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4027', '', 'LAC', 'SECTOR.LAC', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041187', 'MC10.10', 'C10.10��æС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041188', 'MC10.11', 'C10.11æС������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041189', 'MC10.12', 'C10.12����С������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041190', 'MC10.13', 'C11.17��С������', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041191', 'MC10.14', 'C10.13���������վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041192', 'MC10.15', 'C10.14�����վ����', '', 'ZY0804', '', '1', '1X���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042001', 'MD1.1', 'D1.1 DO��վ����', '', 'ZY0804', '', '2', 'DO���˹�ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041053', 'MC4.21', 'ҵ���ŵ������������-Ӳ�л�-CS', 'SUM(BSS_HHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4028', '', '����״̬', 'SECTOR.PROJECT_STATE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4029', '', '���߾���', 'SECTOR.LONGITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4030', '', '����γ��', 'SECTOR.LATITUDE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4031', '', '���ߺ��θ߶�', 'SECTOR.ANT_FRAME_HIGH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4032', '', '�����ܹҸ�', 'SECTOR.ANT_HIGH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4033', '', '���߷����', 'SECTOR.ANT_AZIMUTH', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082006', 'MD1.6', 'D1.6 ��������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082007', 'MD1.7', 'D1.7 ����CE���������', 'CASE WHEN SUM(RCE_RLB_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(RCE_MAX_BUSY_NUM_DO)/SUM(RCE_RLB_NUM_DO) * 100,2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082010', 'MD1.10', 'D1.10 ǰ��ҵ��MacIndex���������', '[MD1.11] / [MD10.10] * 100 ', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082012', 'MD1.12', 'D1.12 PCF����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082013', 'MD1.13', 'D1.13 PCF��������ƽ������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082014', 'MD1.14', 'D1.14 PCF������ͬʱ֧�ֵ�HRPD�Ự����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082015', 'MD1.15', 'D1.15 PCF������ͬʱ֧�ֵļ����HRPD�Ự����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082016', 'MD1.16', 'D1.16 PCF���õ��������������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082017', 'MD1.17', 'D1.17 PCF���õ��������������', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082018', 'MD1.18', 'D1.18 A-Bis�ӿڴ���ƽ��������', '[MD1.20] / [MD10.19]', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082019', 'MD1.19', 'D1.19 A-Bis�ӿ����õĶ˿ڴ���', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082020', 'MD1.20', 'D1.20 A-Bis�ӿ�ƽ��ռ�ô���', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082021', 'MD1.21', 'D1.21 ��æ��վ��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082022', 'MD1.22', 'D1.22 ���л�վ��', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082024', 'MD2.2', 'D2.2 AT��������ӳɹ���', 'DECODE(SUM(AT_CONN_ATT_DO),0,0,ROUND(SUM(AT_CONN_SUC_DO)/SUM(AT_CONN_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082025', 'MD2.3', 'D2.3 AN��������ӳɹ���', 'DECODE(SUM(AN_CONN_ATT_DO),0,0,ROUND(SUM(AN_CONN_SUC_DO)/SUM(AN_CONN_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082030', 'MD2.8', 'D2.8 �����������ӳɹ��ʣ���A8��A10 �ӿڣ�', '[MD2.9] / [MD2.10] * 100', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082031', 'MD2.9', 'D2.9 �����������ӳɹ���������A8��A10 �ӿڣ�', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082032', 'MD2.10', 'D2.10 �����������������������A8��A10 �ӿڣ�', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082033', 'MD2.11', 'D2.11 �û�������', '[MD2.12] / ([MD2.4] + [MD2.5]) ', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082034', 'MD2.12', 'D2.12 �û����ʹ���', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082039', 'MD2.17', 'D2.17 ���������ͷŴ���(����PDSN Ҫ���ͷŴ���)', '[MD2.16] - [MD2.18]', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082040', 'MD2.18', 'D2.18 PDSNԭ��Ҫ���ͷŴ���', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082045', 'MD2.23', 'D2.23 ���������', 'CASE WHEN (SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))=0 THEN 0 ELSE ROUND((SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))/(SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))+SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))+SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))+SUM(nvl(DROPCALLNUM_OTHER_DO,0)))*100,2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082048', 'MD2.26', 'D2.26 DRC ǰ������Ϊ�zС��307.2K�{���������', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_LESS_3072_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081037', 'MC4.5', 'ҵ���ŵ������������(������)', 'SUM(O_TCH_ASSIGN_ATT)+SUM(P_TCH_ASSIGN_ATT)+SUM(TCH_ASSIGN_ATT_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082056', 'MD3.6', 'D3.6 Session�����Ȩ�ɹ���', 'CASE WHEN SUM(AUTH_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AUTH_SUC_DO) / SUM(AUTH_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082061', 'MD3.11', 'D3.11 SessionЭ�̳ɹ���', 'CASE WHEN (SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO))=0 THEN 0 ELSE ROUND(SUM(SESS_NEGO_SUC_NUM_DO) / (SUM(SESS_NEGO_SUC_NUM_DO)+SUM(SESS_NEGO_FAILED_NUM_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082064', 'MD3.14', 'D3.14 Session��AN Dormant�л��ɹ���(%)', '[MD3.16] /  [MD3.15] * 100', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082065', 'MD3.15', 'D3.15 Session��AN Dormant�л�����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082066', 'MD3.16', 'D3.16 Session��AN Dormant�л��ɹ�����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082067', 'MD3.17', 'D3.17 Session�Ự��', 'SUM(SESSION_ACTIVE_NUM_DO)+SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082071', 'MD4.2', 'D4.2 �û���Dormant̬��Active̬�ļ��������ܴ���', 'SUM(AT_DOR2ACT_ATT_DO) + SUM(AN_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082072', 'MD4.3', 'D4.3 �û���Dormant̬��Active̬�ļ���ɹ��ܴ���', 'SUM(AT_DOR2ACT_SUC_DO) + SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082073', 'MD4.4', 'D4.4 AT �����Dormant̬��Active̬�ļ���ɹ���', 'CASE WHEN SUM(AT_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AT_DOR2ACT_SUC_DO) / SUM(AT_DOR2ACT_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082077', 'MD4.8', 'D4.8 AN�����Dormant̬��Active̬����ɹ���', 'CASE WHEN SUM(AN_DOR2ACT_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(AN_DOR2ACT_SUC_DO) / SUM(AN_DOR2ACT_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082085', 'MD5.5', 'D5.5 ���л�����', 'CASE WHEN SUM(TRAFFIC_DO_COMMON)=0 THEN 0 ELSE ROUND((ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)-SUM(TRAFFIC_DO_COMMON)) / SUM(TRAFFIC_DO_COMMON) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082092', 'MD6.7', 'D6.7 PCF������鶪����', 'CASE WHEN SUM(REV_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(REV_PAK_DISCARD_NUM_DO) / SUM(REV_PAK_TOTAL_NUM_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082093', 'MD6.8', 'D6.8 PCFǰ����鶪����', 'CASE WHEN SUM(FWD_PAK_TOTAL_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(FWD_PAK_DISCARD_NUM_DO) / SUM(FWD_PAK_TOTAL_NUM_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082095', 'MD6.10', 'D6.10 ǰ��RLP�ش���', 'CASE WHEN SUM(FTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(FTCH_RLP_RETX_DO) / SUM(FTCH_RLP_TX_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082097', 'MD6.12', 'D6.12 ����RLP�ش���', 'CASE WHEN SUM(RTCH_RLP_TX_DO)=0 THEN 0 ELSE ROUND(SUM(RTCH_RLP_RETX_DO) / SUM(RTCH_RLP_TX_DO)/1024 * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082099', 'MD6.14', 'D6.14 ǰ��ҵ���ŵ������ͻ��������', '[MD10.14] / ([MD10.15] * 100)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082049', 'MD2.27', 'D2.27 DRC ǰ������Ϊ�z307.2K ��1228K�{���������', 'CASE WHEN (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO))=0 THEN 0 ELSE ROUND(SUM(DRC_FWD_3072_1228_DO) / (SUM(DRC_FWD_LESS_3072_DO)+SUM(DRC_FWD_3072_1228_DO)+SUM(DRC_FWD_MORE_1228_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082101', 'MD6.16', 'D6.16 ����ҵ���ŵ������ͻ��������', '[MD10.16] / ([MD10.17] * 100)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082103', 'MD6.18', 'D6.18 ǰ�����������ŵ�ʱ϶ռ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082104', 'MD6.19', 'D6.19 ��������ŵ�ʱ϶ռ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081063', 'MC4.31', 'ҵ���ŵ������������(������)-PS', 'SUM(TCH_ASSIGN_ATT_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081069', 'MC4.37', 'ҵ���ŵ������������-Ӳ�л�-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081070', 'MC4.38', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081108', 'MC5.34', 'BS��Ӳ�л��������', 'SUM(INNER_BSC_HHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081109', 'MC5.35', 'BS��Ӳ�л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081114', 'MC5.40', 'BS�ڸ����л��������', 'SUM(INTRA_BS_SSHO_ATT_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081115', 'MC5.41', 'BS�ڸ����л��ɹ�����', 'SUM(INTRA_BS_SSHO_SUC_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081128', 'MC6.6', '�ŵ���������', 'SUM(CH_CFG_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081129', 'MC6.7', '�ŵ�������', 'SUM(CH_RLB_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081130', 'MC6.8', '�ŵ����ռ����', 'SUM(FWD_CH_MAX_NUM)+SUM(REV_CH_MAX_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081131', 'MC6.9', '�ŵ����ռ����(%)', 'CASE WHEN SUM(CH_RLB_NUM)=0 THEN 0 ELSE ROUND((SUM(FWD_CH_MAX_NUM) + SUM(REV_CH_MAX_NUM)) / SUM(CH_RLB_NUM) * 100,4) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081133', 'MC6.11', 'ǰ���ŵ�������', 'SUM(FWD_CH_RLB_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081134', 'MC6.12', 'ǰ���ŵ����ռ����', 'SUM(FWD_CH_MAX_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081135', 'MC6.13', 'ǰ���ŵ����ռ����(%)', 'SUM(FWD_TCH_MAX_OCCU_RATE)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081137', 'MC6.15', '�����ŵ�������', 'SUM(REV_CH_RLB_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081138', 'MC6.16', '�����ŵ����ռ����', 'SUM(REV_CH_MAX_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081139', 'MC6.17', '�����ŵ����ռ����(%)', 'SUM(REV_TCH_MAX_OCCU_RATE)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081141', 'MC7.2', 'ǰ������֡��-�������ش�', 'SUM(FRM_NUM_FWD_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081142', 'MC7.3', 'RLP��ǰ���ŵ��з��͵�������-�����ش�(KB)', 'SUM(DATA_THROUGHPUT_FWD_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081143', 'MC7.4', 'RLP��ǰ���ŵ����ش���������(�ֽ�)', 'SUM(FTCH_RLP_RETX_BYTE_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081146', 'MC7.7', '�����ش���֡��', 'SUM(RETX_FRM_NUM_REV_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081147', 'MC7.8', '��������֡��-�������ش�', 'SUM(TX_FRM_NUM_REV_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081148', 'MC7.9', 'RLP�ڷ����ŵ��н��յ�������(KB)', 'SUM(DATA_THROUGHPUT_REV_1X)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082102', 'MD6.17', 'D6.17 ǰ�������ҵ���ŵ�ʱ϶ռ����', 'ROUND(AVG(DO_TCH_AVG_SLOT_OCCUPY_RATE),3)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081178', 'MC10.1', 'C10.1�ŵ���Ԫ������', 'SUM(CH_RLB_NUM)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082008', 'MD1.8', 'D1.8 ����CE���æ��', 'SUM(RCE_MAX_BUSY_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082009', 'MD1.9', 'D1.9 ����CE������', 'SUM(RCE_RLB_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082011', 'MD1.11', 'D1.11 ǰ��ҵ��MacIndex���æ��', 'SUM(FWD_MACINDEX_MAX_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082035', 'MD2.13', 'D2.13 �������ӽ���ʧ�ܴ�����ԭ��Ϊ������Դʧ�ܣ�', 'SUM(CONN_SETUP_FAILED_RESF_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082036', 'MD2.14', 'D2.14 �������ӽ���ʧ�ܴ�����ԭ��Ϊ����ҵ���ŵ�����ʧ�ܣ�', 'SUM(CONN_SETUP_FAILED_FEVF_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082037', 'MD2.15', 'D2.15 �������ӽ���ʧ�ܴ�����ԭ��Ϊû���յ�TCC ��Ϣ��', 'SUM(CONN_SETUP_FAILED_NOTCC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082054', 'MD3.4', 'D3.4 UATI����ʧ�ܴ���', 'SUM(UATI_ATT_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082055', 'MD3.5', 'D3.5 UATIƽ������ʱ��', 'SUM(UATI_AVG_SETUP_DURATION_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082057', 'MD3.7', 'D3.7 Session�����Ȩ�ɹ�����', 'SUM(AUTH_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082058', 'MD3.8', 'D3.8 Session�����Ȩ�������', 'SUM(AUTH_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082059', 'MD3.9', 'D3.9 Session�����Ȩ�ܾ�����', 'SUM(AUTH_DENY_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082060', 'MD3.10', 'D3.10 Session�����Ȩʧ�ܴ���', 'SUM(AUTH_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082062', 'MD3.12', 'D3.12 SessionЭ�̳ɹ�����', 'SUM(SESS_NEGO_SUC_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082063', 'MD3.13', 'D3.13 SessionЭ��ʧ�ܴ���', 'SUM(SESS_NEGO_FAILED_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082068', 'MD3.18', 'D3.18 Active̬Session�Ự��', 'SUM(SESSION_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082069', 'MD3.19', 'D3.19 ��Active̬Session�Ự��', 'SUM(SESSION_NON_ACTIVE_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082074', 'MD4.5', 'D4.5 AT �����Dormant̬��Active̬�����������', 'SUM(AT_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082075', 'MD4.6', 'D4.6 AT �����Dormant̬��Active̬����ɹ�����', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082076', 'MD4.7', 'D4.7 AT�����Dormant ̬��Active ̬����ʧ�ܴ���', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082078', 'MD4.9', 'D4.9 AN�����Dormant��Active̬�ļ����������', 'SUM(AN_DOR2ACT_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082079', 'MD4.10', 'D4.10 AN�����Dormant��Active̬�ļ���ɹ�����', 'SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082116', 'MD7.11', 'D7.11 AN��Ӳ�л��������', 'SUM(INN_AN_HHO_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082080', 'MD4.11', 'D4.11 AN�����Dormant̬��Active̬�ļ���ʧ�ܴ���', 'SUM(AN_DOR2ACT_ATT_DO)-SUM(AN_DOR2ACT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082082', 'MD5.2', 'D5.2 ���л�����', 'SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082083', 'MD5.3', 'D5.3 CE������', 'ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082084', 'MD5.4', 'D5.4 ���л�������', 'ROUND((SUM(TRAFFIC_CE_TIME_DO) + SUM(TRAFFIC_CE_TIME_DO0)) / 3600,4)-SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082081', 'MD5.1', 'D5.1 ��Ч�û���', 'SUM(TRAFFIC_DO_COMMON)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082117', 'MD7.12', 'D7.12 AN��Ӳ�л��ɹ�����', 'SUM(INN_AN_HHO_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082118', 'MD7.13', 'D7.13 AN��Ӳ�л��ɹ���', 'CASE WHEN (SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO))=0 THEN 0 ELSE ROUND((SUM(INTER_AN_HHO_IN_SUC_DO)+SUM(INTER_AN_HHO_OUT_SUC_DO)) / (SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082121', 'MD8.1', 'D8.1 Ѱ����Ӧ��', 'CASE WHEN SUM(PAGE_ATT_NUM_DO)=0 THEN 0 ELSE ROUND(SUM(PAGE_SUC_NUM_DO)/SUM(PAGE_ATT_NUM_DO)*100,4) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082124', 'MD9.1', '����DO��Ƶ(37)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082125', 'MD9.2', '����DO��Ƶ(78)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082126', 'MD9.3', '����DO��Ƶ(119)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082127', 'MD9.4', 'DO��Ƶ����', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082128', 'MD9.5', 'Do��Ƶ������(37)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082129', 'MD9.6', 'Do��Ƶ������(78)', '', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082123', 'MD8.3', 'D8.3 Ѱ����Ӧ�ܴ���', 'SUM(PAGE_SUC_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082145', 'MD10.11', 'DRC ǰ������Ϊ�zС��307.2K�{���������', 'SUM(DRC_FWD_LESS_3072_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082146', 'MD10.12', 'DRC ǰ������Ϊ�z307.2K ��1228K�{���������', 'SUM(DRC_FWD_3072_1228_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082147', 'MD10.13', 'DRC ǰ������Ϊ�z����1228K�{���������', 'SUM(DRC_FWD_MORE_1228_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082137', 'MD10.3', 'Session������ʱ��', 'SUM(SESS_SETUP_TOTAL_DUR_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082144', 'MD10.10', 'ǰ��ҵ��MacIndex������', 'SUM(FWD_MACINDEX_AVA_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081087', 'MC5.13', '�����л��������-CS', 'SUM(S_SSHO_ATT)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081088', 'MC5.14', '�����л��ɹ�����-CS', 'SUM(S_SSHO_SUC)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081089', 'MC5.15', '�����л��ɹ���-CS(%)', 'CASE WHEN SUM(S_SSHO_ATT) = 0 THEN 0 ELSE ROUND(SUM(S_SSHO_SUC) / SUM(S_SSHO_ATT),4)*100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081072', 'MC4.40', 'ҵ���ŵ������������-���л�-PS', 'SUM(TCH_ASSIGN_ATT_SHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081073', 'MC4.41', 'ҵ���ŵ�����ɹ�����-���л�-PS', 'SUM(TCH_ASSIGN_SUC_SHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081093', 'MC5.19', 'Ӳ�л��������-PS', 'SUM(TCH_ASSIGN_ATT_HHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081094', 'MC5.20', 'Ӳ�л��ɹ�����-PS', 'SUM(TCH_ASSIGN_SUC_HHO_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081095', 'MC5.21', 'Ӳ�л��ɹ���-PS(%)', 'CASE WHEN SUM(TCH_ASSIGN_ATT_HHO_PS)=0 THEN 0 ELSE ROUND(SUM(TCH_ASSIGN_SUC_HHO_PS) / SUM(TCH_ASSIGN_ATT_HHO_PS),4)*100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081022', 'MC2.13', '�����л�������-PS(Erl)', 'SUM(FCH_WALSHCODE_TRAFFIC_PS)-SUM(FCH_CE_TRAFFIC_PS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081053', 'MC4.21', 'ҵ���ŵ������������-Ӳ�л�-CS', 'SUM(TCH_ASSIGN_ATT_HHO_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081054', 'MC4.22', 'ҵ���ŵ�����ɹ�����-Ӳ�л�-CS', 'SUM(TCH_ASSIGN_SUC_HHO_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081056', 'MC4.24', 'ҵ���ŵ������������-���л�-CS', 'SUM(TCH_ASSIGN_ATT_SHO_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081057', 'MC4.25', 'ҵ���ŵ�����ɹ�����-���л�-CS', 'SUM(TCH_ASSIGN_SUC_SHO_CS)', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082086', 'MD6.1', 'D6.1 PCF������������', 'SUM(REV_THROUGHOUT_PCF_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082087', 'MD6.2', 'D6.2 PCFǰ����������', 'SUM(FWD_THROUGHOUT_PCF_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082109', 'MD7.4', 'D7.4 AN�����л��ɹ���', 'CASE WHEN SUM(INN_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INN_BS_SHO_SUC_DO) / SUM(INN_BS_SHO_ATT_DO) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082112', 'MD7.7', 'D7.7 AN�����л��ɹ���', 'CASE WHEN SUM(INTER_BS_SHO_ATT_DO)=0 THEN 0 ELSE ROUND(SUM(INTER_BS_SHO_SUC_DO)/SUM(INTER_BS_SHO_ATT_DO),4) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082115', 'MD7.10', 'D7.10 AN��Ӳ�л��ɹ���', 'DECODE(SUM(INN_AN_HHO_ATT_DO),0,0,ROUND(SUM(INN_AN_HHO_SUC_DO)/SUM(INN_AN_HHO_ATT_DO),4)*100)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082088', 'MD6.3', 'D6.3 PCF���յķ������ҵ����ܰ���', 'SUM(REV_PAK_TOTAL_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082089', 'MD6.4', 'D6.4 PCF���յ�ǰ��������ݵ��ܰ���', 'SUM(FWD_PAK_TOTAL_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082090', 'MD6.5', 'D6.5 �������ҵ����PCF�����İ���', 'SUM(REV_PAK_DISCARD_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082091', 'MD6.6', 'D6.6 ǰ�����ҵ����PCF�����İ���', 'SUM(FWD_PAK_DISCARD_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082094', 'MD6.9', 'D6.9 ǰ��RLP����������', 'ROUND(SUM(FTCH_RLP_TX_DO) * 8 / 1000 / 3600,4)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082096', 'MD6.11', 'D6.11 ����RLP����������', 'ROUND(SUM(RTCH_RLP_TX_DO) * 8 / 3600,4)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082110', 'MD7.5', 'D7.5 AN�����л��������', 'SUM(INN_BS_SHO_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082111', 'MD7.6', 'D7.6 AN�����л��ɹ�����', 'SUM(INN_BS_SHO_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082113', 'MD7.8', 'D7.8 AN�����л��������', 'SUM(INTER_BS_SHO_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082114', 'MD7.9', 'D7.9 AN�����л��ɹ�����', 'SUM(INTER_BS_SHO_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082119', 'MD7.14', 'D7.14 AN��Ӳ�л��������', 'SUM(INTER_AN_HHO_OUT_ATT_DO)+SUM(INTER_AN_HHO_IN_ATT_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082120', 'MD7.15', 'D7.15 AN��Ӳ�л��ɹ�����', 'SUM(INTER_AN_HHO_IN_SUC_DO)+SUM(INTER_AN_HHO_OUT_SUC_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082122', 'MD8.2', 'D8.2 Ѱ���������', 'SUM(PAGE_ATT_NUM_DO)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082044', 'MD2.22', 'D2.22 ���ߵ�����', 'CASE WHEN SUM(nvl(DO_SUC_CONN,0))=0 THEN 0 WHEN SUM(nvl(DO_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(DO_DROP_NUM,0)) / SUM(DO_SUC_CONN) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082026', 'MD2.4', 'D2.4 AT��������������������', 'SUM(nvl(AT_CONN_ATT_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081017', 'MC2.8', '���л�����-CS(%)', 'CASE WHEN SUM(SHO_TRAFFIC_CS)=0 THEN 0 ELSE ROUND((SUM(SHO_TRAFFIC_CS) - SUM(TRAFFIC_CS))*100/SUM(SHO_TRAFFIC_CS),2) END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081011', 'MC2.2', 'ҵ���ŵ�������(������)(Erl)', 'SUM(nvl(TRAFFIC_CS,0))+SUM(nvl(TRAFFIC_PS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082098', 'MD6.13', 'D6.13 ǰ��ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_FTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081164', 'MC9.2', 'C3.2���л�����(%)', 'CASE WHEN SUM( nvl(TRAFFIC_CS,0)) = 0 THEN 0 ELSE      ROUND(SUM(nvl(SHO_TRAFFIC_CS,0) - nvl(TRAFFIC_CS,0))/SUM(nvl(TRAFFIC_CS,0)),4) * 100     END ', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081180', 'MC10.3', 'C10.3ҵ���ŵ����صĻ�����(���л�)', 'SUM(nvl(SHO_TRAFFIC_CS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041102', 'MC5.28', 'BS���л��������', 'SUM(INNER_BSC_HHO_ATT)+SUM(INNER_BSC_SHO_ATT)+SUM(INNER_BSC_SOFTERHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041103', 'MC5.29', 'BS���л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC)+SUM(INNER_BSC_SHO_SUCC)+SUM(INNER_BSC_SOFTERHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041105', 'MC5.31', 'BS���л��������', 'SUM(INTER_BSC_HHO_ATT)+SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041106', 'MC5.32', 'BS���л��ɹ�����', 'SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041107', 'MC5.33', 'BS���л��ɹ���(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND((SUM(INTER_BSC_HHO_SUCC)+SUM(INTER_BSC_SHO_SUCC))/(SUM(INTER_BSC_HHO_ATT) + SUM(INTER_BSC_SHO_ATT)) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041108', 'MC5.34', 'BS��Ӳ�л��������', 'SUM(INNER_BSC_HHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041109', 'MC5.35', 'BS��Ӳ�л��ɹ�����', 'SUM(INNER_BSC_HHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041110', 'MC5.36', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN SUM(INNER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_HHO_SUCC) / SUM(INNER_BSC_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041111', 'MC5.37', 'BS�����л��������', 'SUM(INNER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041112', 'MC5.38', 'BS�����л��ɹ�����', 'SUM(INNER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041113', 'MC5.39', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(INNER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SHO_SUCC) / SUM(INNER_BSC_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041114', 'MC5.40', 'BS�ڸ����л��������', 'SUM(INNER_BSC_SOFTERHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041115', 'MC5.41', 'BS�ڸ����л��ɹ�����', 'SUM(INNER_BSC_SOFTERHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041117', 'MC5.43', 'BS��Ӳ�л��������', 'SUM(INTER_BSC_HHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041118', 'MC5.44', 'BS��Ӳ�л��ɹ�����', 'SUM(INTER_BSC_HHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041119', 'MC5.45', 'BS��Ӳ�л��ɹ���(%)', 'CASE WHEN SUM(INTER_BSC_HHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_HHO_SUCC) / SUM(INTER_BSC_HHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041120', 'MC5.46', 'BS�����л��������', 'SUM(INTER_BSC_SHO_ATT)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041121', 'MC5.47', 'BS�����л��ɹ�����', 'SUM(INTER_BSC_SHO_SUCC)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041122', 'MC5.48', 'BS�����л��ɹ���(%)', 'CASE WHEN SUM(INTER_BSC_SHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INTER_BSC_SHO_SUCC) / SUM(INTER_BSC_SHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041128', 'MC6.6', '�ŵ���������', 'SUM(FWD_CH_NUM)+SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041129', 'MC6.7', '�ŵ�������', 'SUM(FWD_CH_RLB_NUM)+SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041130', 'MC6.8', '�ŵ����ռ����', 'SUM(FWD_CH_MAX_NUM)+SUM(REV_CH_MAX_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041131', 'MC6.9', '�ŵ����ռ����(%)', 'CASE WHEN SUM(FWD_CH_RLB_NUM) + SUM(REV_CH_RLB_NUM)=0 THEN 0 ELSE ROUND((SUM(FWD_CH_MAX_NUM) + SUM(REV_CH_MAX_NUM))/(SUM(FWD_CH_RLB_NUM) + SUM(REV_CH_RLB_NUM)) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041132', 'MC6.10', 'ǰ���ŵ���������', 'SUM(FWD_CH_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041133', 'MC6.11', 'ǰ���ŵ�������', 'SUM(FWD_CH_RLB_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041134', 'MC6.12', 'ǰ���ŵ����ռ����', 'SUM(FWD_CH_MAX_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041116', 'MC5.42', 'BS�ڸ����л��ɹ���(%)', 'CASE WHEN SUM(INNER_BSC_SOFTERHO_ATT)=0 THEN 0 ELSE ROUND(SUM(INNER_BSC_SOFTERHO_SUCC) / SUM(INNER_BSC_SOFTERHO_ATT) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041135', 'MC6.13', 'ǰ���ŵ����ռ����(%)', 'CASE WHEN SUM(FWD_CH_RLB_NUM)=0 THEN 0 ELSE ROUND(SUM(FWD_CH_MAX_NUM) / SUM(FWD_CH_RLB_NUM),4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041136', 'MC6.14', '�����ŵ���������', 'SUM(REV_CH_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041137', 'MC6.15', '�����ŵ�������', 'SUM(REV_CH_RLB_NUM)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4036', '', '��е���', 'SECTOR.ANT_ENGINE_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4038', '', '��������', 'SECTOR.ANT_NUM', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4039', '', '����ˮƽ3db������', 'SECTOR.HORIZONTAL', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4041', '', '�Ƿ���������', 'SECTOR.ISCELLSPLIT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4043', '', '����汾', 'case BSC.vendor
when ''ZY0808'' then ''BSC6680''
when ''ZY0804'' then ''V8''
when ''ZY0810'' then ''R32'' end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4044', '', '1X��������', 'DECODE(SECTOR.ISDO,0,SECTOR.CARRIER_NUM,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4045', '', '1X�ŵ�������', 'DECODE(BTS.ISDO,0,BTS.TCH_COUNT,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4046', '', '1X�ŵ�������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4048', '', 'ϵͳ����', 'BTS.SITE_TYPE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4049', '', '�Ƿ�DO����', 'DECODE(SECTOR.ISDO,0,''��'',1,''��'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4052', '', 'DO�ŵ�������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4053', '', 'DOվ������', 'DECODE(BTS.ISDO,1,BTS.SITE_MODEL,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4054', '', '�Ƿ���ز��߽�', 'SECTOR.BORDERSECTOR', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4056', '', '����ʡ������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4057', '', '������������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4059', '', 'α��ƵƵ��', 'SECTOR.FAKEPILOT', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4060', '', '�Ƿ�װ�����Ŵ���', 'SECTOR.ISTOWER', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4062', '', '��������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4063', '', '��������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4064', '', '��������1', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4065', '', '��������2', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4066', '', '��������3', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4067', '', '��������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4068', '', '��������', 'BTS.ARCHITECTURE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4069', '', '��ַ', 'BTS.ADDRESS', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4007', '', '�������', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4008', '', '���̲��վ��ʶ', 'case BSC.vendor
when ''ZY0808'' then BTS.BTS_ID
when ''ZY0804'' then BTS.BTS_ID
when ''ZY0810'' then BTS.BTS_ID end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4070', '', '��ע', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4071', '', 'Ԥ��1', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4072', '', 'Ԥ��2', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4073', '', 'Ԥ��3', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4074', '', 'Ԥ��4', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4075', '', 'Ԥ��5', '', 'ZY0000', '', '4', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4035', '', '���������', 'SECTOR.ANT_ELECTRON_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4037', '', '�����Ƿ���Ե��', 'SECTOR.ISELECADJUST', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4040', '', '���ߴ�ֱ3db������', 'SECTOR.VERTICAL', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4042', '', '��������', 'case BSC.vendor when ''ZY0808'' THEN ''��Ϊ'' when ''ZY0810'' THEN ''����'' when ''ZY0804'' THEN ''����'' end ', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4047', '', '1Xվ������', 'DECODE(BTS.ISDO,0,BTS.SITE_MODEL,1,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4050', '', 'DO��������', 'DECODE(SECTOR.ISDO,1,SECTOR.CARRIER_NUM,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4051', '', 'DO�ŵ�����������', 'DECODE(BTS.ISDO,1,BTS.TCH_COUNT,0,NULL)', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4058', '', '�Ƿ�ʹ��α��Ƶ', 'DECODE(SECTOR.FAKEPILOT,NULL,''��'',''��'')', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082105', 'MD6.20', 'D6.20 ������·��æ��', '[MD10.8] / ([MD10.8] + [MD10.9]) * 100', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081181', 'MC10.4', 'C10.4ҵ���ŵ����صĻ�����(�����л�)', 'SUM(nvl(TRAFFIC_CS,0))', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082100', 'MD6.15', 'D6.15 ����ҵ���ŵ������ƽ��������', 'ROUND(SUM(nvl(DO_RTCH_RLP_TX,0))*8/1000/3600,3)', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082023', 'MD2.1', 'D2.1 �������ӳɹ���', 'CASE WHEN SUM(nvl(DO_CONN_ATT,0))=0 THEN 0 WHEN SUM(nvl(DO_SUC_CONN_NUM,0))>=SUM(nvl(DO_CONN_ATT,0)) THEN 99.99 ELSE ROUND(SUM(nvl(DO_SUC_CONN_NUM,0)) / SUM(nvl(DO_CONN_ATT,0)) * 100, 2) END', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082041', 'MD2.19', 'D2.19 ���ߵ��ߴ������տڶ�ʧ��', 'SUM(nvl(DROPCALLNUM_RFLOSE_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081028', 'MC3.5', 'ҵ���ŵ�������-CS(%)', 'CASE WHEN SUM(nvl(TCH_ASSIGN_SUC,0)) = 0 THEN 0 WHEN SUM(nvl(TCH_DROP_NUM,0))<=0 THEN 0.01 ELSE ROUND(SUM(nvl(TCH_DROP_NUM,0))/SUM(TCH_ASSIGN_SUC),4) * 100 END', 'ZY0808', '', '1', '��Ϊ1X��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082038', 'MD2.16', 'D2.16 ���������ͷŴ���(��PDSN Ҫ���ͷŴ���)', 'SUM(nvl(RELEASETIMES_INCLPDSN_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082042', 'MD2.20', 'D2.20 ���ߵ��ߴ�����Ӳ�л�ʧ�ܵ��µĵ��ߣ�', 'SUM(nvl(DROPCALLNUM_HARDHOFAIL_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082043', 'MD2.21', 'D2.21 ���ߵ��ߴ���������ԭ��', 'SUM(nvl(DROPCALLNUM_OTHER_DO,0))', 'ZY0808', '', '2', 'DO��Ϊ��ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4061', '', '�Ƿ�װ��վ�Ŵ���', 'SECTOR.ISAMPLIFIER', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4002', '', '������ʶ', 'case BSC.vendor
when ''ZY0808'' then  CITY.ENNAME||''_''||MSC.MSCNAME||''.''||BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID
when ''ZY0804'' then  BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID
when ''ZY0810'' then  CITY.ENNAME||''_''||MSC.MSCNAME||''.''||BSC.CHINA_NAME||''.''||BTS.BTS_ID||''.''||SECTOR.SECTOR_ID  end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4011', '', '������ʶ_1X', 'case BSC.vendor
when ''ZY0808'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''')
when ''ZY0804'' then  to_char(SECTOR.CI)
when ''ZY0810'' then  replace(''0x''||to_char(BTS.BTS_ID*16+SECTOR.SECTOR_ID,''XXXXXXXX''),'' '','''') end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5002', '', '�ȵ��ʶ', 'HOT.HOTMARK', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5003', '', 'ʡ������', '''{1}''', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041101', 'MC5.27', '�����л��ɹ���-PS(%)', 'CASE WHEN SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)=0 THEN 0 ELSE ROUND((SUM(DATA_HO_SUCC_NUM)-SUM(HHO_SUC_NUM_PS)-SUM(SHO_SUC_NUM_PS))/(SUM(DATE_HO_ATT_NUM)-SUM(HHO_ATT_NUM_PS)-SUM(SHO_SUC_NUM_PS)) * 100,4) END', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042075', 'MD4.6', 'D4.6 AT �����Dormant̬��Active̬����ɹ�����', 'SUM(AT_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042076', 'MD4.7', 'D4.7 AT�����Dormant ̬��Active ̬����ʧ�ܴ���', 'SUM(AT_DOR2ACT_ATT_DO)-SUM(AT_DOR2ACT_SUC_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042135', 'MD10.1', '�������ӽ�����ʱ��', 'SUM(DO_SETUP_TIME)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042136', 'MD10.2', '��������ռ����ʱ��', 'SUM(DO_CONNECT_TIME)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042137', 'MD10.3', 'Session������ʱ��', 'SUM(SESS_SETUP_TOTAL_DUR_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042140', 'MD10.6', '�����ش��ֽ���', 'SUM(RTCH_RLP_RETX_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042142', 'MD10.8', 'RAB��æ����', 'SUM(RAB_BUSY_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042143', 'MD10.9', 'RAB�д���', 'SUM(RAB_IDLE_NUM_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042148', 'MD10.14', 'ǰ��ҵ���ŵ�����㷢�͵�bit��', 'SUM(FTCH_PHY_TX_BIT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042149', 'MD10.15', 'ǰ������㷢��ʵ��ռ��ʱ϶ʱ��', 'SUM(FTCH_PHY_SLOT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8042150', 'MD10.16', '����ҵ���ŵ��������յ�bit��', 'SUM(RTCH_PHY_TX_BIT_DO)', 'ZY0804', '', '2', 'DO���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041018', 'MC2.9', 'ҵ���ŵ�������(����)-PS(Erl)', 'SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041019', 'MC2.10', 'ҵ���ŵ�������(������)-PS(Erl)', 'SUM(TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8041020', 'MC2.11', 'Walsh�뻰����-PS(Erl)', 'SUM(TRAFFIC_PS)+SUM(SHO_TRAFFIC_PS)+SUM(SSHO_TRAFFIC_PS)', 'ZY0804', '', '1', '1X���˹�ʽ', '1', '2');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5004', '', '��������', 'CITY.CITY_NAME', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5005', '', '�ȵ�����', 'HOT.HOTNAME', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5006', '', '�ȵ��ַ', 'HOT.HOTADDR', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5007', '', '�ȵ㾭��', 'HOT.LONGITUDE', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5008', '', '�ȵ�γ��', 'HOT.LATITUDE', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5009', '', '�ȵ�ʹ�õ�AP����', 'HOT.HOTUSEAPNUM', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5010', '', '�ȵ�ʹ�õ�AC����', 'HOT.HOTUSEACNUM', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5011', '', '����������EVDO������Ϣ1', 'to_char(HOT.CELLIDONE)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5012', '', '����������EVDO������Ϣ2', 'to_char(HOT.CELLIDTWO)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5013', '', '����������EVDO������Ϣ3', 'to_char(HOT.CELLIDTHREE)', 'ZY0000', '', '5', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5014', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5015', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5016', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5017', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('5018', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '5', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6002', '', 'ä���ʶ', 'BLIND.BLINDID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6003', '', 'ʡ������', '''{1}''', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6004', '', '��������', 'CITY.CITY_NAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6005', '', 'ä����ϸ�ص�', 'BLIND.BLINDADDRESS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6006', '', 'ä�����', 'BLIND.SERIAL_ID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6007', '', '��������', 'BLIND.CREATETIME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6008', '', 'ä�����', 'BLIND.BLINDAREAID', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6009', '', 'ä������', 'BLIND.BLINDNAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6010', '', 'ä����������', 'BLIND.BLINDPROPERTYCITY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6011', '', 'ä����������', 'BLIND.BLINDPROPERTYCITYTOWN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6012', '', 'ä��ص����', 'BLIND.BLINDADDNAME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6013', '', '��־�Խ���', 'BLIND.MARKBUILD', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6014', '', 'ä�㼶��', 'BLIND.BLINDLEVEL', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6015', '', 'ä�㾭��', 'BLIND.LONGITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6015', '', 'ä��γ��', 'BLIND.LATITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6016', '', 'ä����������', 'BLIND.AREATYPE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6017', '', 'ä��������ֲ�', 'BLIND.BLINDINOROUT', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4034', '', '���߸�����', 'SECTOR.ANT_ANGLE', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6018', '', '�Ƿ�1xä��', 'BLIND.IS1XBLIND', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6019', '', '�Ƿ�DOä��', 'BLIND.ISDOCELL', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6020', '', '�γ�ԭ��', 'BLIND.FORMREASON', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6021', '', 'Ӱ��뾶', 'BLIND.RADIUS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6022', '', '�������', 'BLIND.SETPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6023', '', '�Ƿ��й滮', 'BLIND.ISHASPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6024', '', '�滮վ��', 'BLIND.PLANSITE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '�û�ԭ����Ͷ�߼���', 'COM.USERRELUCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '����������Ͷ�߼���', 'COM.ROAMRESCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '�ֻ�������Ͷ�߼���', 'COM.TELEPHONECOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', 'UIM��������Ͷ�߼���', 'COM.UIMRESCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '3G������Ͷ�߼���', 'COM.THNETCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6025', '', '�滮վ����', 'BLIND.PLANSITELONGITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '����ԭ����Ͷ�߼���', 'COM.NORESCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', '��������������Ͷ�߼���', 'COM.NETMANAGCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', '���', 'HOT.SERIAL_ID', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', 'Ͻ������', 'HOT.CITY_NAME', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', 'Ͻ��ʡ��', '''{1}''', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', 'Ͻ����/��', 'HOT.AREA_NAME', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', 'Ͻ������', 'HOT.TOWN_NAME', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '��Ϣ�㳡������������', 'HOT.BUILDNAME', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '��Ϣ����ϸ��ַ', 'HOT.ADDRESS', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', '��Ϣ��GPS����', 'HOT.LONGITUDE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1010', '', '��Ϣ��GPSγ��', 'HOT.LATITUDE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', '��Ϣ��������1������', 'HOT.PROPERTYONETYPE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '��Ϣ��������2������', 'HOT.PROPERTYTWOTYPE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '��Ϣ��������3������', 'HOT.PROPERTYTHREETYPE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113012', '', '����˳��', 'pro.nbrseq', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113013', '', '�л�����', 'pro.switchtype', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113014', '', '��������ʶ', 'pro.nei_sid ||''.''||pro.nei_ne_pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113015', '', '������������', 'pro.nei_county_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113016', '', '����������MSC��ʶ', 'pro.nei_msc_nam', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113017', '', '����������MGW��ʶ', 'pro.nei_mgw', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113018', '', '����������BSC��ʶ', 'pro.nei_bsc_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113019', '', '����������BTS��ʶ', 'pro.nei_bts_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113020', '', '���������', 'pro.nei_cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113021', '', '����������', 'pro.nei_cell_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113022', '', '��pn', 'pro.nei_ne_pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113023', '', '����������ʡ', 'pro.nei_province_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113024', '', '��������������', 'pro.nei_city_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113025', '', '�������߽�����', 'pro.bordertype', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113026', '', '��������������', 'case pro.nei_vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113027', '', '�Ƿ�Ϊ�ⲿ����', '1', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

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
values ('810113120', '', 'Դʡ�ʱ߽����ȱ�ʶ', 'pro.omc_name||''.''||pro.bts_id || ''.''||pro.cell_id||''.''||pro.carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113121', '', 'ʱ���', '''{0}''', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113122', '', 'ʡ��', '''{1}''', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113123', '', '����', 'pro.city_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113124', '', 'Դ��������MSC��ʶ', 'pro.msc_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113125', '', 'Դ��������MGW��ʶ', 'pro.mgw', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113126', '', 'Դ��������BSC��ʶ', 'pro.msc_name  ||''.''||pro.bsc_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113127', '', 'Դ��������BTS��ʶ', 'pro.msc_name||''.''||pro.bsc_id||''.''||pro.bts_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '1x���ǵȼ�', 'HOT.ONEXGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', 'DO���ǵȼ�', 'HOT.DOGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', '�ƶ�GSM���ǵȼ�', 'HOT.MOVEGSMGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '�ƶ�TD���ǵȼ�', 'HOT.MOVETDGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '��ͨGSM���ǵȼ�', 'HOT.LINKGSMGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '��ͨWCDMA���ǵȼ�', 'HOT.LINKWCDMAGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', 'C����ǿ�ź�PN1', 'HOT.CGOODPNONE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', 'C����ǿ�ź�PN2', 'HOT.CGOODPNTWO', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', '���ڷֲ���ʽ', 'HOT.INDOORDISTRIBUT', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', 'C���ź�δ���ǵ�λ��', 'HOT.CSIGNAL', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', '����ҵ����Ҫ��', 'HOT.VOICEGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', '����ҵ����Ҫ��', 'HOT.DATAGRADE', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1027', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1028', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1029', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1030', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '1', '������Ϣ-�����ȵ�', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', '���', 'ROAD.SERIAL_ID', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', 'Ͻ������', 'ROAD.CITY_NAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', 'Ͻ��ʡ��', '''{1}''', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', 'Ͻ����/��', 'ROAD.AREA_NAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', 'Ͻ������', 'ROAD.TOWN_NAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', '��·����', 'ROAD.ROADTYPE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', '��·����', 'ROAD.ROADNAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', '��·�������', 'ROAD.STARNAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', '��·���GPS����', 'ROAD.STARLONGITUDE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', '��·���GPSγ��', 'ROAD.STARLATITUDE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '��·�յ�����', 'ROAD.ENDNAME', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '��·�յ�GPS����', 'ROAD.ENDLONGITUDE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '��·�յ�GPSγ��', 'ROAD.ENDLATITUDE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '��·���Ȼ�����', 'ROAD.ROADLONG', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '1x���ǵȼ�', 'ROAD.ONEXGRADE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', 'DO���ǵȼ�', 'ROAD.DOGRADE', 'ZY0000', '', '2', '������Ϣ-���е�·', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '2', '������Ϣ-���е�·', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '2', '������Ϣ-���е�·', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '2', '������Ϣ-���е�·', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '2', '������Ϣ-���е�·', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '2', '������Ϣ-���е�·', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3001', '', 'ʱ���', '''{0}''', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3002', '', '���', 'TOWN.SERIAL_ID', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3003', '', 'Ͻ������', 'TOWN.CITY_NAME', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3004', '', 'Ͻ��ʡ��', '''{1}''', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3005', '', 'Ͻ����/��', 'TOWN.AREA_NAME', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3006', '', 'Ͻ������', 'TOWN.TOWN_NAME', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3007', '', '������', 'TOWN.VILLAGENAME', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3008', '', '������GPS����', 'TOWN.VILLAGLONGITUDE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3009', '', '������GPSγ��', 'TOWN.VILLAGLATITUDE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3010', '', '���е�·1', 'TOWN.OUTROADONE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3011', '', '���е�·2', 'TOWN.OUTROADTWO', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3012', '', '���е�·3', 'TOWN.OUTROADTHREE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3013', '', '1x���ǵȼ�', 'TOWN.ONEXGRADE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3014', '', 'DO���ǵȼ�', 'TOWN.DOGRADE', 'ZY0000', '', '3', '������Ϣ-������', '1', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3015', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '3', '������Ϣ-������', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3016', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '3', '������Ϣ-������', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3017', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '3', '������Ϣ-������', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3018', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '3', '������Ϣ-������', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3019', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '3', '������Ϣ-������', '', '10');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1202', '', 'DO��ָ��', '7,10,16,17,18,23,24,25,30,33,44,45,48,49,50,51,56,61,64,70,73,77,92,93,95,97,102,103,104,105,106,109,112,115,118,121', 'ZY0000', '', '2', 'DO��ָ��', '1', '12');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1201', '', '1X��ָ��', '3,6,9,17,23,25,28,31,36,40,42,46,50,52,55,58,62,66,68,71,74,77,80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,131,135,139,145,149,163,164,165,166,172,173,174,175', 'ZY0000', '', '1', '1X��ָ��', '1', '12');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113128', '', 'Դ��������������ʶ', 'pro.msc_name||''.''||pro.bsc_id||''.''||pro.bts_id||''.''||pro.cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113129', '', 'Դ����������������', 'pro.cell_name', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113130', '', 'Դ���������������', 'pro.cell_id', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113131', '', 'Դ�ز����', 'pro.carr_seq', 'ZY0810', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113001', '', 'Դʡ�ʱ߽�������ʶ', 'pro.omc_name || ''.'' ||pro.bts_id || ''.'' ||pro.cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6026', '', '�滮վγ��', 'BLIND.PLANSITELATITUDE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6027', '', '�滮��ϸ��ַ', 'BLIND.PLANADDRESS', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6028', '', '�滮վ������ֲ�', 'BLIND.PLANINDOROUT', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6029', '', '�滮վ�豸����', 'BLIND.EQUIPMENTTYPE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6030', '', '1X����', 'BLIND.ONEXDEPLOY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6032', '', '��վ���ɼ���', 'BLIND.BUILDREASON', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6034', '', '�ƻ���վʱ��', 'BLIND.PLANBUILDTIME', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6037', '', '�������', 'BLIND.RESOLVE', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6039', '', '���ս������', 'BLIND.LASTSETPLAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6040', '', 'Ԥ���ֶ�1', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6041', '', 'Ԥ���ֶ�2', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6042', '', 'Ԥ���ֶ�3', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6043', '', 'Ԥ���ֶ�4', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6044', '', 'Ԥ���ֶ�5', '', 'ZY0000', '', '6', '', '', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6031', '', 'DO����', 'BLIND.DODEPLOY', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6033', '', '���뼸�ڹ滮', 'BLIND.PUTONLIST', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6035', '', '���', 'BLIND.FILLINMAN', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6038', '', '���ʱ��', 'TO_CHAR(BLIND.SETTIME,''YYYY-MM-DD HH24:MI:SS'')', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('6036', '', '�ʱ��', 'TO_CHAR(BLIND.FILLTIME,''YYYY-MM-DD HH24:MI:SS'')', 'ZY0000', '', '6', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', 'ʱ���', 'to_char(COM.accepttime,''yyyy-mm-dd hh24:mi:ss'')', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', 'ʡ������', '''{0}''', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', '��������', 'CITY.CITY_NAME', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', '��������Ͷ�߼���', 'COM.YGCOVERCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '��������Ͷ�߼���', 'COM.CRCOVERCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', '��Ƶ��Ⱦ��Ͷ�߼���', 'COM.PILOTPOLLCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', '������Ͷ�߼���', 'COM.OBSTACCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', '�豸������Ͷ�߼���', 'COM.EQUIPMENTCOUNT', 'ZY0000', '', '1', '�ͻ�Ͷ��ͳ�������ϱ�', '1', '11');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113002', '', 'ʱ���', '''{0}''', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113003', '', 'Դʡ�ʱ߽���������', 'pro.cell_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113004', '', 'ʡ��', '''{1}''', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113005', '', '����', 'pro.city_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113006', '', 'Դ��������MSC��ʶ', 'pro.msc_name', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113007', '', 'Դ��������MGW��ʶ', 'pro.mgw', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113008', '', 'Դ��������BSC��ʶ', 'pro.msc_name ||''.''||pro.bsc_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113009', '', 'Դ��������BTS��ʶ', 'pro.msc_name || ''.'' || pro.bsc_id ||''.'' ||pro.bts_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113010', '', 'Դ�������', 'pro.cell_id', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('810113011', '', 'Դpn', 'pro.pn', 'ZY0810', '', '', 'LUCCELLCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114290', 'MP1.7.2.2.2', '������Ƶ', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114291', 'MP1.7.2.2.3', '�Ƿ�������ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWININC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114292', 'MP1.7.2.2.4', '���ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114293', 'MP1.7.2.2.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114294', 'MP1.7.2.2.6', '���ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114295', 'MP1.7.2.2.7', '�������ȼ�', 'pro.PARA_SRCHP', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114296', 'MP1.7.2.3.1', '������Ƶ', 'pro.DOPARA_CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114297', 'MP1.7.2.3.2', '������Ƶ', 'pro.DOPARA_NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114298', 'MP1.7.2.3.3', '�Ƿ�������ڼ���֧�������ڴ�С', 'pro.DOPARA_NSRCHWININC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114299', 'MP1.7.2.3.4', '���ڼ���֧�������ڴ�С', 'pro.DORA_NSRCHWINSIZE', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114300', 'MP1.7.2.3.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.DOPARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114301', 'MP1.7.2.3.6', '���ڼ���֧��������ƫ��', 'pro.DOPARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', 'Դ��������BTS��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', 'Դ�������', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', 'Դpn', 'SECTOR.PN', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '����˳��', 'para_sort.sortnum', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '�л�����', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '��������ʶ', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '������������', 'replace(NEIADM.COUNTY_NAME, ''��'', '''')', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '����������MSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '����������MGW��ʶ', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '����������BSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '����������BTS��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', '���������', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '����������', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', '��pn', 'NEISECTOR.PN', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '����������ʡ', 'NEITZCELL.PROVINCE', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '��������������', 'NEITZCELL.CITY_NAME', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '�������߽�����', 'case NEITZCELL.BORDER_TYPE when ''�Ǳ߽�'' then ''0'' when ''ʡ�ʱ߽�'' then ''1'' when ''ʡ�ڱ߽�'' then ''2'' when ''ͬΪʡ��ʡ�ڱ߽�'' then ''3'' end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', '��������������', 'case neitzcell.vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '�Ƿ�Ϊ�ⲿ����', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8074', '', 'Դ��������BSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME      end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8075', '', 'Դ��������BTS��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8076', '', 'Դ��������������ʶ', 'case BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || BSC.CHINA_NAME || ''.'' ||BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || BSC.CHINA_NAME || ''.'' ||BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8077', '', 'Դ����������������', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then         replace(SECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8078', '', 'Դ�������', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8079', '', 'Դ�ز����', 'carr.carr_seq', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8080', '', 'Դ�ز�Ƶ��', 'carr.carrier_id', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8081', '', 'Դpn', 'SECTOR.PN', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8082', '', '����˳��', 'para_sort.sortnum', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8083', '', '�л�����', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8084', '', '��������ʶ', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' ||NEISECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8085', '', '������������', 'replace(NEIADM.COUNTY_NAME, ''��'', '''')', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8086', '', '����������MSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8087', '', '����������MGW��ʶ', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8088', '', '����������BSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then          NEIMSC.BSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8089', '', '����������BTS��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8090', '', '���������', 'case BSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8091', '', '����������', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8092', '', '���ز���ʶ', 'NEICARR.CARR_SEQ', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8093', '', '���ز�Ƶ��', 'NEICARR.CARRIER_ID', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8094', '', '��pn', 'NEISECTOR.PN', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8095', '', '����������ʡ', 'NEITZCELL.PROVINCE', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8096', '', '��������������', 'NEITZCELL.CITY_NAME', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8097', '', '�������߽�����', 'case NEITZCELL.BORDER_TYPE when ''�Ǳ߽�'' then ''0'' when ''ʡ�ʱ߽�'' then ''1'' when ''ʡ�ڱ߽�'' then ''2'' when ''ͬΪʡ��ʡ�ڱ߽�'' then ''3'' end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8098', '', '��������������', 'case neitzcell.vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8099', '', '�Ƿ�Ϊ�ⲿ����', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', 'Դʡ�ʱ߽�������ʶ', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', 'ʱ���', '''{0}''', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1001', '', 'Դʡ�ʱ߽�������ʶ', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1002', '', 'ʱ���', '''{0}''', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1003', '', 'Դʡ�ʱ߽���������', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1004', '', 'ʡ��', '''{1}''', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1005', '', '����', 'CITY.CITY_NAME', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1006', '', 'Դ��������MSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1007', '', 'Դ��������MGW��ʶ', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1008', '', 'Դ��������BSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1009', '', 'Դ��������BTS��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8067', '', 'Դʡ�ʱ߽�������ʶ', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8068', '', 'ʱ���', '''{0}''', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8069', '', 'Դʡ�ʱ߽���������', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then         replace(SECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8070', '', 'ʡ��', '''{1}''', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8071', '', '����', 'CITY.CITY_NAME', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2022', '', '��pn', 'NEISECTOR.PN', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2023', '', '����������ʡ', 'NEITZCELL.PROVINCE', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2024', '', '��������������', 'NEITZCELL.CITY_NAME', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2025', '', '�������߽�����', 'case NEITZCELL.BORDER_TYPE when ''�Ǳ߽�'' then ''0'' when ''ʡ�ʱ߽�'' then ''1'' when ''ʡ�ڱ߽�'' then ''2'' when ''ͬΪʡ��ʡ�ڱ߽�'' then ''3'' end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2026', '', '��������������', 'case neitzcell.vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2027', '', '�Ƿ�Ϊ�ⲿ����', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114056', '', 'ʱ���', '''{0}''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114057', '', 'ʡ��', '''{1}''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114058', '', '����', 'ne_carr.city_name', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8072', '', 'Դ��������MSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0810', '', '8', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('8073', '', 'Դ��������MGW��ʶ', '', 'ZY0810', '', '8', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114241', 'MP1.7.1.3.1', '������Ƶ', 'pro.CCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114242', 'MP1.7.1.3.2', '������Ƶ', 'pro.NBRCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114243', 'MP1.7.1.3.3', '��Ƶ���ȼ�', 'pro.DFRSN', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114244', 'MP1.7.1.4.1', '������Ƶ', 'pro.PARA_CCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114245', 'MP1.7.1.4.2', '������Ƶ', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114246', 'MP1.7.1.4.3', '������', 'pro.PARA_SRCHSET', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114247', 'MP1.7.1.4.4', '���ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114248', 'MP1.7.1.4.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114249', 'MP1.7.1.4.6', '���ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114250', 'MP1.7.1.4.7', '�������ȼ�', 'pro.PARA_SRCHP', 'ZY0808', '', '1', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114286', 'MP1.7.2.1.1', '������Ƶ', 'pro.CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114287', 'MP1.7.2.1.2', '������Ƶ', 'pro.NBRCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114288', 'MP1.7.2.1.3', 'ͬƵ���ȼ�', 'pro.SFRSN', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114289', 'MP1.7.2.2.1', '������Ƶ', 'pro.PARA_CCDMACH', 'ZY0808', '', '2', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114113', 'MP2.7.1.1.26', 'alias_b', 'nbr_carr.alias_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114114', 'MP2.7.1.1.27', 'ncell_bs_id', 'nbr_carr.ncell_bs_id', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214001', '', 'Դʡ�ʱ߽����ȱ�ʶ', 'ne_carr.bscname || ''.'' ||ne_carr.bts || ''.'' ||ne_carr.cell || ''.'' || ne_carr.carr_seq', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214002', '', 'ʱ���', '''{0}''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214003', '', 'ʡ��', '''{1}''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214004', '', '����', 'ne_carr.city_name', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214005', '', 'Դ��������MSC��ʶ', 'ne_carr.mscname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214006', '', 'Դ��������MGW��ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214007', '', 'Դ��������BSC��ʶ', 'ne_carr.bscname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214008', '', 'Դ��������BTS��ʶ', 'ne_carr.bscname || ''.'' || ne_carr.bts', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214009', '', 'Դ��������������ʶ', 'ne_carr.bscname || ''.'' || ne_carr.bts || ''.'' ||ne_carr.cell', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214010', '', 'Դ����������������', 'replace(ne_carr.cell_name, '','', ''��'')', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214011', '', 'Դ���������������', 'ne_carr.cell', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214012', '', 'Դ�ز����', 'ne_carr.carr_seq', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214013', '', 'Դ�ز�Ƶ��', 'ne_carr.carr', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214014', '', 'Դpn', 'ne_carr.pn', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214015', '', '����˳��', 'nbr_carr_o.sequence_b', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214016', '', '�л�����', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214017', '', '�����ȱ�ʶ', 'bss_ncell.marketid || ''_'' || bss_ncell.ci || ''_'' || bss_ncell.pilot_pn || ''_'' || bss_ncarr_o.channelnumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214018', '', '������������', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214019', '', '����������MSC��ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214020', '', '����������MGW��ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214021', '', '����������BSC��ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214022', '', '����������BTS��ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214023', '', '����������������ʶ', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214024', '', '����������', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214025', '', '���������', 'bss_ncell_o.nbcellid', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214026', '', '���ز���ʶ', 'bss_ncarr_o.nbcarrierid', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114059', '', 'Դ��������MSC��ʶ', 'ne_carr.mscname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114112', 'MP2.7.1.1.25', 'locked_b', 'nbr_carr.locked_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214027', '', '���ز�Ƶ��', 'bss_ncarr_o.channelnumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214028', '', '��pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214029', '', '����������ʡ', 'bss_ncell.provincename', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214030', '', '��������������', 'bss_ncell.cityname', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214031', '', '�������߽�����', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214032', '', '��������������', '', 'ZY0804', '', '2', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214033', '', '�Ƿ�Ϊ�ⲿ����', '''1''', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214034', 'MP2.7.2.1.1', 'PILOTPN', 'nbr_carr_o.PILOTPN', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214035', 'MP2.7.2.1.2', 'SYSTEMTYPE', 'nbr_carr_o.SYSTEMTYPE', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214036', 'MP2.7.2.1.3', 'BANDCLASS', 'nbr_carr_o.BANDCLASS', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804214037', 'MP2.7.2.1.4', 'ChannelNumber', 'nbr_carr_o.ChannelNumber', 'ZY0804', '', '2', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114164', '', 'Դʡ�ʱ߽����ȱ�ʶ', 'pro.omc_name || ''.'' || pro.bsc_name || ''.'' ||pro.bts_id || ''.'' ||pro.cell_id || ''.'' || pro.carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114165', '', 'ʱ���', '''{0}''', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114166', '', 'ʡ��', '''{1}''', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114167', '', '����', 'pro.city_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114168', '', 'Դ��������MSC��ʶ', 'pro.MSC_NAME', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114169', '', 'Դ��������MGW��ʶ', 'pro.mgw', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114170', '', 'Դ��������BSC��ʶ', 'pro.omc_name || ''.''|| pro.bsc_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114171', '', 'Դ��������BTS��ʶ', 'pro.omc_name || ''.''|| pro.bsc_name || ''.'' || pro.bts_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114172', '', 'Դ��������������ʶ', 'pro.omc_name || ''.''|| pro.bsc_name || ''.'' || pro.bts_id || ''.'' ||pro.cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114173', '', 'Դ����������������', 'replace(pro.cell_name, '','', ''��'')', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114174', '', 'Դ���������������', 'pro.cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114175', '', 'Դ�ز����', 'pro.carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114176', '', 'Դ�ز�Ƶ��', 'pro.carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114177', '', 'Դpn', 'pro.pn', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114178', '', '����˳��', 'pro.nbrseq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114179', '', '�л�����', 'pro.switchtype', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114180', '', '�����ȱ�ʶ', 'pro.nei_sid || ''_'' || pro.nei_bts_id || ''_'' || pro.nei_ne_pn || ''_'' || pro.nei_carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114181', '', '������������', 'pro.nei_county_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114182', '', '����������MSC��ʶ', 'pro.nei_msc_nam', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114183', '', '����������MGW��ʶ', 'pro.nei_mgw', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114184', '', '����������BSC��ʶ', 'pro.nei_bsc_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114185', '', '����������BTS��ʶ', 'pro.nei_bts_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114186', '', '����������������ʶ', 'pro.nei_cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114187', '', '����������', 'pro.nei_cell_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114188', '', '���������', 'pro.nei_cell_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114189', '', '���ز���ʶ', 'pro.nei_carr_seq', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114190', '', '���ز�Ƶ��', 'pro.nei_carr_id', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114191', '', '��pn', 'pro.nei_ne_pn', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114192', '', '����������ʡ', 'pro.nei_province_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114193', '', '��������������', 'pro.nei_city_name', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114194', '', '�������߽�����', 'pro.bordertype', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114195', '', '��������������', 'case pro.nei_vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114196', '', '�Ƿ�Ϊ�ⲿ����', 'pro.isouter', 'ZY0808', '', '', 'HWCM', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114197', 'MP1.7.1.1.1', '������Ƶ', 'pro.CCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114198', 'MP1.7.1.1.2', '������Ƶ', 'pro.NBRCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114199', 'MP1.7.1.1.3', 'ͬƵ���ȼ�', 'pro.SFRSN', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114200', 'MP1.7.1.2.1', '������Ƶ', 'pro.PARA_CCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114201', 'MP1.7.1.2.2', '������Ƶ', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114202', 'MP1.7.1.2.3', '�Ƿ�������ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWININC', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114203', 'MP1.7.1.2.4', '���ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114204', 'MP1.7.1.2.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114205', 'MP1.7.1.2.6', '���ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '1', 'SF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808114206', 'MP1.7.1.2.7', '�������ȼ�', 'pro.PARA_SRCHP', 'ZY0808', '', '1', 'SF', '1', '14');

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
values ('804113120', '', 'Դʡ�ʱ߽�������ʶ', 'ne_carr.bscname || ''.'' ||ne_carr.bts_id || ''.'' ||ne_carr.sector_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113121', '', 'ʱ���', '''{0}''', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113122', '', 'Դʡ�ʱ߽���������', 'ne_carr.china_name', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113123', '', 'ʡ��', '''{1}''', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113124', '', '����', 'ne_carr.cityname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113125', '', 'Դ��������MSC��ʶ', 'ne_carr.mscname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113126', '', 'Դ��������MGW��ʶ', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113127', '', 'Դ��������BSC��ʶ', 'ne_carr.bscname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113128', '', 'Դ��������BTS��ʶ', 'ne_carr.bscname || ''.'' || ne_carr.bts_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113129', '', 'Դ�������', 'ne_carr.sector_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113130', '', 'Դpn', 'ne_carr.pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113131', '', '����˳��', 'nbr_cell.sequence_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113132', '', '�л�����', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113133', '', '��������ʶ', 'bss_ncell.marketid || ''_'' || bss_ncell.ci || ''_'' ||bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113134', '', '������������', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113135', '', '����������MSC��ʶ', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113136', '', '����������MGW��ʶ', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113137', '', '����������BSC��ʶ', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113138', '', '����������BTS��ʶ', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113139', '', '���������', 'bss_ncell.gncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113140', '', '����������', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113141', '', '��pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113142', '', '����������ʡ', 'bss_ncell.provincename', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113143', '', '��������������', 'bss_ncell.cityname', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113144', '', '�������߽�����', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113145', '', '��������������', '', 'ZY0804', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113146', '', '�Ƿ�Ϊ�ⲿ����', '1', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113147', 'MP2.11.1.1.1', '��ƵPN����ƫ��', 'nbr_cell.pilot_pn', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113148', 'MP2.11.1.1.2', '����С������', 'nbr_cell.ncelltype', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113149', 'MP2.11.1.1.3', '����С�������', 'nbr_cell.ncellofficeid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113150', 'MP2.11.1.1.4', '����С��BTS��', 'nbr_cell.ncellsystemid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113151', 'MP2.11.1.1.5', '����С��Cell��', 'nbr_cell.ncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113152', 'MP2.11.1.1.6', '����ȫ�ֱ�ʾ', 'nbr_cell.gncellid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113153', 'MP2.11.1.1.7', 'С��ʶ�����ʽ', 'nbr_cell.ci_discriminator', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113154', 'MP2.11.1.1.8', '����λ���������', 'nbr_cell.lac', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113155', 'MP2.11.1.1.9', 'С��ʶ��', 'nbr_cell.ci', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113156', 'MP2.11.1.1.10', '�г���', 'nbr_cell.marketid', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113157', 'MP2.11.1.1.11', '������', 'nbr_cell.switchnumber', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113158', 'MP2.11.1.1.12', 'Э��汾��', 'nbr_cell.p_rev', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113159', 'MP2.11.1.1.13', 'С��ģʽ', 'nbr_cell.ncellmode', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113160', 'MP2.11.1.1.14', 'PTT���ȷ�����ID��', 'nbr_cell.dla_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113161', 'MP2.11.1.1.15', 'ncell_bs_id', 'nbr_cell.ncell_bs_id', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113162', 'MP2.11.1.1.16', 'alias����', 'nbr_cell.alias_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804113163', 'MP2.11.1.1.17', 'sequence_b', 'nbr_cell.sequence_b', 'ZY0804', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2001', '', 'Դʡ�ʱ߽�������ʶ', 'case BSC.vendor when ''ZY0808'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0804'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID when ''ZY0810'' then BSC.CHINA_NAME || ''.'' || BTS.BTS_ID || ''.'' || SECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2002', '', 'ʱ���', '''{0}''', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', 'Դʡ�ʱ߽���������', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', 'ʡ��', '''{1}''', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '����', 'CITY.CITY_NAME', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', 'Դ��������MSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', 'Դ��������MGW��ʶ', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', 'Դ��������BSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2009', '', 'Դ��������BTS��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME || ''.'' || BTS.BTS_ID when ''ZY0804'' then MSC.BSCNAME || ''.'' || BTS.BTS_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2010', '', 'Դ�������', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2011', '', 'Դpn', 'SECTOR.PN', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2012', '', '����˳��', 'para_sort.sortnum', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2013', '', '�л�����', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2014', '', '��������ʶ', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2015', '', '������������', 'replace(NEIADM.COUNTY_NAME, ''��'', '''')', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2016', '', '����������MSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2017', '', '����������MGW��ʶ', '', 'ZY0804', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2018', '', '����������BSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2019', '', '����������BTS��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2020', '', '���������', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2021', '', '����������', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0804', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', 'SID', 'sid.sid', 'ZY0000', '', '1', 'MSC����', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3024', '', 'SID', 'CITY.SID', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('4055', '', '�߽���������', 'case  sector.border_type when ''�Ǳ߽�'' then 0
when ''ʡ�ʱ߽�'' then 1
when ''ʡ�ڱ߽�'' then 2
when ''ͬΪʡ��ʡ�ڱ߽�'' then 3
end', 'ZY0000', '', '4', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('3053', '', '�߽��վ����', 'case  BTS.border_type when ''�Ǳ߽�'' then 0
when ''ʡ�ʱ߽�'' then 1
when ''ʡ�ڱ߽�'' then 2
when ''ͬΪʡ��ʡ�ڱ߽�'' then 3
end', 'ZY0000', '', '3', '', '1', '1');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114060', '', 'Դ��������MGW��ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114061', '', 'Դ��������BSC��ʶ', 'ne_carr.bscname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114062', '', 'Դ��������BTS��ʶ', 'ne_carr.bscname || ''.'' || ne_carr.bts', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114063', '', 'Դ��������������ʶ', 'ne_carr.bscname || ''.'' || ne_carr.bts || ''.'' ||ne_carr.cell', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114064', '', 'Դ����������������', 'replace(ne_carr.cell_name, '','', ''��'')', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114065', '', 'Դ���������������', 'ne_carr.cell', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114066', '', 'Դ�ز����', 'ne_carr.carr_seq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114067', '', 'Դ�ز�Ƶ��', 'ne_carr.carr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114068', '', 'Դpn', 'ne_carr.pn', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114069', '', '����˳��', 'nbr_carr.sequence_b', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114070', '', '�л�����', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114071', '', '�����ȱ�ʶ', 'bss_ncell.marketid || ''_'' || bss_ncell.ci|| ''_'' || bss_ncell.pilot_pn || ''_'' || bss_ncarr.cdma_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114072', '', '������������', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114073', '', '����������MSC��ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114074', '', '����������MGW��ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114075', '', '����������BSC��ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114076', '', '����������BTS��ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114077', '', '����������������ʶ', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114078', '', '����������', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114079', '', '���������', 'bss_ncell.gncellid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114080', '', '���ز���ʶ', 'bss_ncarr.gncarrierid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114081', '', '���ز�Ƶ��', 'bss_ncarr.cdma_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114082', '', '��pn', 'bss_ncell.pilot_pn', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114083', '', '����������ʡ', 'bss_ncell.provincename', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114084', '', '��������������', 'bss_ncell.cityname', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114085', '', '�������߽�����', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114086', '', '��������������', '', 'ZY0804', '', '1', '', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114087', '', '�Ƿ�Ϊ�ⲿ����', '''1''', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114088', 'MP2.7.1.1.1', 'bssid', 'nbr_carr.bssid', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214344', 'MP1.7.2.4.1', '������Ƶ', 'pro.CCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214345', 'MP1.7.2.4.2', '������Ƶ', 'pro.NBRCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214346', 'MP1.7.2.4.3', '��Ƶ���ȼ�', 'pro.DFRSN', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214347', 'MP1.7.2.5.1', '������Ƶ', 'pro.PARA_CCDMACH', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214348', 'MP1.7.2.5.2', '������Ƶ', 'pro.PARA_NBRCDMACH', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214349', 'MP1.7.2.5.3', '������', 'pro.PARA_SRCHSET', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214350', 'MP1.7.2.5.4', '���ڼ���֧�������ڴ�С', 'pro.PARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214351', 'MP1.7.2.5.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214352', 'MP1.7.2.5.6', '���ڼ���֧��������ƫ��', 'pro.PARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214353', 'MP1.7.2.5.7', '�������ȼ�', 'pro.PARA_SRCHP', 'ZY0808', '', '2', 'DF', '', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214354', 'MP1.7.2.6.1', '������Ƶ', 'pro.DOPARA_CCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214355', 'MP1.7.2.6.2', '������Ƶ', 'pro.DOPARA_NBRCDMACH', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214356', 'MP1.7.2.6.3', '�Ƿ�������ڼ���֧�������ڴ�С', 'pro.DOPARA_NSRCHWININC', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214357', 'MP1.7.2.6.4', '���ڼ���֧�������ڴ�С', 'pro.DOPARA_NSRCHWINSIZE', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214358', 'MP1.7.2.6.5', '�Ƿ�������ڼ���֧��������ƫ��', 'pro.DOPARA_NSRCHWINOFFSETINC', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('808214359', 'MP1.7.2.6.6', '���ڼ���֧��������ƫ��', 'pro.DOPARA_NSRCHWINOFFSET', 'ZY0808', '', '2', 'DF', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114055', '', 'Դʡ�ʱ߽����ȱ�ʶ', 'ne_carr.bscname || ''.'' ||ne_carr.bts || ''.'' ||ne_carr.cell || ''.'' || ne_carr.carr_seq', 'ZY0804', '', '1', '', '1', '14');

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
values ('1010', '', 'Դ�������', 'case BSC.vendor when ''ZY0808'' then SECTOR.SECTOR_ID when ''ZY0804'' then SECTOR.SECTOR_ID when ''ZY0810'' then SECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1011', '', 'Դpn', 'SECTOR.PN', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1012', '', '����˳��', 'para_sort.sortnum', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1013', '', '�л�����', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1014', '', '��������ʶ', 'case NEIBSC.vendor when ''ZY0808'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0804'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID when ''ZY0810'' then NEIBSC.CHINA_NAME || ''.'' || NEIBTS.BTS_ID || ''.'' || NEISECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1015', '', '������������', 'replace(NEIADM.COUNTY_NAME, ''��'', '''')', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1016', '', '����������MSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME when ''ZY0810'' then NEIMSC.MSCNAME when ''ZY0804'' then NEIMSC.MSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1017', '', '����������MGW��ʶ', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1018', '', '����������BSC��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME when ''ZY0804'' then NEIMSC.BSCNAME end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1019', '', '����������BTS��ʶ', 'CASE NEIBSC.vendor when ''ZY0808'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0810'' then NEIMSC.MSCNAME || ''.'' || NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID when ''ZY0804'' then NEIMSC.BSCNAME || ''.'' || NEIBTS.BTS_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1020', '', '���������', 'case NEIBSC.vendor when ''ZY0808'' then NEISECTOR.SECTOR_ID when ''ZY0804'' then NEISECTOR.SECTOR_ID when ''ZY0810'' then NEISECTOR.SECTOR_ID end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1021', '', '����������', 'case NEIBSC.vendor when ''ZY0808'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(NEISECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1022', '', '��pn', 'NEISECTOR.PN', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1023', '', '����������ʡ', 'NEITZCELL.PROVINCE', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1024', '', '��������������', 'NEITZCELL.CITY_NAME', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1025', '', '�������߽�����', 'case NEITZCELL.BORDER_TYPE when ''�Ǳ߽�'' then ''0'' when ''ʡ�ʱ߽�'' then ''1'' when ''ʡ�ڱ߽�'' then ''2'' when ''ͬΪʡ��ʡ�ڱ߽�'' then ''3'' end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1026', '', '��������������', 'case neitzcell.vendor when ''ZY0808'' then ''��Ϊ'' when ''ZY0804'' then ''����'' when ''ZY0810'' then ''��Ѷ'' end', 'ZY0808', '', '1', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('1027', '', '�Ƿ�Ϊ�ⲿ����', '', 'ZY0808', '', '1', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2003', '', 'Դʡ�ʱ߽���������', 'case BSC.vendor when ''ZY0808'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0804'' then replace(SECTOR.CHINA_NAME, '','', ''��'') when ''ZY0810'' then replace(SECTOR.CHINA_NAME, '','', ''��'') end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2004', '', 'ʡ��', '''{1}''', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2005', '', '����', 'CITY.CITY_NAME', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2006', '', 'Դ��������MSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME when ''ZY0810'' then MSC.MSCNAME when ''ZY0804'' then MSC.MSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2007', '', 'Դ��������MGW��ʶ', '', 'ZY0808', '', '2', '', '', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('2008', '', 'Դ��������BSC��ʶ', 'CASE BSC.vendor when ''ZY0808'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0810'' then MSC.MSCNAME || ''.'' || MSC.BSCNAME when ''ZY0804'' then MSC.BSCNAME end', 'ZY0808', '', '2', '', '1', '13');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114096', 'MP2.7.1.1.9', '������Ƶ����', 'nbr_carr.nghbr_config', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114097', 'MP2.7.1.1.10', '������Ƶ�������ȼ�', 'nbr_carr.search_priority', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114098', 'MP2.7.1.1.11', '��Ƶ��������С', 'nbr_carr.srch_win_nghbr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114099', 'MP2.7.1.1.12', 'Ƶ�ʰ���ָʾ', 'nbr_carr.freq_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114100', 'MP2.7.1.1.13', '����Ƶ�����', 'nbr_carr.nghbr_band', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114101', 'MP2.7.1.1.14', '����Ƶ��', 'nbr_carr.nghbr_freq', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114102', 'MP2.7.1.1.15', '�ɷ��������л�', 'nbr_carr.access_entry_ho', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114103', 'MP2.7.1.1.16', '�ɷ�����л�', 'nbr_carr.access_ho_allowed', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114104', 'MP2.7.1.1.17', '����ʱ����Ϣ����ָʾ��', 'nbr_carr.timing_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114105', 'MP2.7.1.1.18', '��������ʱ��ƫ��', 'nbr_carr.nghbr_tx_offset', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114106', 'MP2.7.1.1.19', '����������ÿ�����ڵ�ʱ��', 'nbr_carr.nghbr_tx_duration', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114107', 'MP2.7.1.1.20', '��������ʱ��', 'nbr_carr.nghbr_tx_period', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114108', 'MP2.7.1.1.21', '������Ƶ������Ϣ����ָʾ', 'nbr_carr.add_pilot_rec_incl', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114109', 'MP2.7.1.1.22', '������Ƶ��Ϣ��¼����', 'nbr_carr.nghbr_pilot_rec_type', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114110', 'MP2.7.1.1.23', '������Ƶ��������С��ƫ��', 'nbr_carr.srch_offset_nghbr', 'ZY0804', '', '1', '', '1', '14');

insert into cfg_provice_perf (ID, LOGICEXPRESS, CHIAN_NAME, EN_NAME, VENDOR, CITY_ID, CLASSCODE, CLASSNAME, ISUSER, DATATYPE)
values ('804114111', 'MP2.7.1.1.24', 'sequence_b', 'nbr_carr.sequence_b', 'ZY0804', '', '1', '', '1', '14');

