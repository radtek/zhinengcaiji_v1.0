--华为载扇1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                CS.PROVINCENAME,
                MDTN.CITY_NAME,
                MDTN.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                MDTN.BSC_NAME,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL,
                MDTN.CELL_NAME,
                MDTN.CARR_SEQ,
                

                PLTCHGAIN          CDMA1XCH_PLTCH_PLTCHGAIN,
                PCHGAIN            PCH_PCHGAIN,
                SYNCHGAIN          SYNCH_SYNCHGAIN,
                MAXCELLR           CBTSSECTORCARRIER_C_M, 
                ACHLOWTHR          CDMA1XCH_ALDCTRL_ACHLOWTHR,
                TOTALZN            CDMA1XCH_SPM_TOTALZN,
                ZNTMR              CDMA1XCH_SPM_ZNTMR,
                MSID               CDMA1XCH_SPM_MSID,
                MNID               CDMA1XCH_SPM_MNID,
                MAXTSPRDIDX        CDMA1XCH_SPM_MAXTSPRDIDX,
                HOMEREG            CDMA1XCH_SPM_HOMEREG,
                FORSIDREG          CDMA1XCH_SPM_FORSIDREG,
                FORNIDREG          CDMA1XCH_SPM_FORNIDREG,
                PWRUP              CDMA1XCH_SPM_PWRUP,
                PWRDWN             CDMA1XCH_SPM_PWRDWN,
                PRMREG             CDMA1XCH_SPM_PRMREG,
                REGPRD             CDMA1XCH_SPM_REGPRD,
                REGDIST            CDMA1XCH_SPM_REGDIST,
                BCIDX              CDMA1XCH_ESPM_BCIDX, 
                ADDNUM             PCH_ADDNUM,
                PLTPL              CDMA1XCH_PLTPL,
                CPH.ACHNUM         PCH_ACHNUM,
                MAXLEN             PCH_ACH_MAXLEN,
                PAMLEN             PCH_ACH_PAMLEN,
                NOMPWR             PCH_APM_NOMPWR,
                INITPWR            PCH_APM_INITPWR,
                PWRCSTEP           PCH_APM_PWRCSTEP,
                NUMSTEP            PCH_APM_NUMSTEP,
                PRBPNRAN           PCH_APM_PRBPNRAN,
                PRBBKOFF           PCH_APM_PRBBKOFF,
                BKOFF              PCH_APM_BKOFF,
                MAXREQSEQ          PCH_APM_MAXREQSEQ,
                MAXRSPSEQ          PCH_APM_MAXRSPSEQ,
                TXGAIN             CDMA1XCH_TXGAIN,
                SCTGAIN            CDMA1XCH_SCTGAIN,
                FWDVCFCHFER1       CDMA1XCH_FER_FWDVCFCHFER1,
                FWDDATFCHFER1      CDMA1XCH_FER_FWDDATFCHFER1,
                IS95SCHGAIN1       CDMA1XCH_FFASTPC_IS95SCHGAIN1,
                IS95SCHGAIN2       CDMA1XCH_FFASTPC_IS95SCHGAIN2,
                IS95SCHGAIN3       CDMA1XCH_FFASTPC_IS95SCHGAIN3,
                IS2KSCHGAIN1       CDMA1XCH_FFASTPC_IS2KSCHGAIN1,
                IS2KSCHGAIN2       CDMA1XCH_FFASTPC_IS2KSCHGAIN2,
                IS2KSCHGAIN3       CDMA1XCH_FFASTPC_IS2KSCHGAIN3,
                VINITFCH           CDMA1XCH_FFASTPC_VINITFCH,
                CCCH.VMAXFCH       CDMA1XCH_FFASTPC_VMAXFCH,
                CCCH.VMINFCH       CDMA1XCH_FFASTPC_VMINFCH,
                DINITFCH           CDMA1XCH_FFASTPC_DINITFCH,
                CCCH.DMAXFCH       CDMA1XCH_FFASTPC_DMAXFCH,
                CCCH.DMINFCH       CDMA1XCH_FFASTPC_DMINFCH,
                CCCH.MAXDCCH       CDMA1XCH_FFASTPC_MAXDCCH,
                CCCH.MINDCCH       CDMA1XCH_FFASTPC_MINDCCH,
                SCHMAX             CDMA1XCH_FFASTPC_SCHMAX,
                SCHMIN             CDMA1XCH_FFASTPC_SCHMIN,
                V6VUFPCM           CDMA1XCH_FFASTPC_V6VUFPCM,
                V6DUFPCM           CDMA1XCH_FFASTPC_V6DUFPCM,
                V7VUFPCM           CDMA1XCH_FFASTPC_V7VUFPCM,
                V7DUFPCM           CDMA1XCH_FFASTPC_V7DUFPCM,
                FPCTHRS            CDMA1XCH_FFASTPC_FPCTHRS,
                PWRRPTTHRS         CDMA1XCH_FSLOWPC_PWRRPTTHRS,
                PWRRPTFRMNUM       CDMA1XCH_FSLOWPC_PWRRPTFRMNUM,
                PWRRPTDL           CDMA1XCH_FSLOWPC_PWRRPTDL,
                REVSPDMDLOADCTRLSW CDMA1XCH_R_R, --对CDMA1XCH_RLDCTRL_REVSPDMDLOADCTRLSW的简写
                REVPWRCSTEP        CDMA1XCH_RCLPC_REVPWRCSTEP,
                VFCHRLGAINADJ      CDMA1XCH_RCLPC_VFCHRLGAINADJ,
                DFCHRLGAINADJ      CDMA1XCH_RCLPC_DFCHRLGAINADJ,
                RLGAINSCHPLT1X     CDMA1XCH_RCLPC_RLGAINSCHPLT1X,
                RLGAINSCHPLT2X     CDMA1XCH_RCLPC_RLGAINSCHPLT2X,
                RLGAINSCHPLT4X     CDMA1XCH_RCLPC_RLGAINSCHPLT4X,
                RLGAINSCHPLT8X     CDMA1XCH_RCLPC_RLGAINSCHPLT8X,
                RLGAINSCHPLT16X    CDMA1XCH_RCLPC_RLGAINSCHPLT16X,
                RLGAINSCHPLT32X    CDMA1XCH_RCLPC_RLGAINSCHPLT32X,
                REVPWRCTRLDELAY    CDMA1XCH_RCLPC_REVPWRCTRLDELAY,
                SRCHWINA           CDMA1XCH_HO_SRCHWINA,
                SRCHWINN           CDMA1XCH_HO_SRCHWINN,
                SRCHWINR           CDMA1XCH_HO_SRCHWINR,
                NBRMAXAGE          CDMA1XCH_HO_NBRMAXAGE,
                TADD               CDMA1XCH_HO_TADD,
                TDROP              CDMA1XCH_HO_TDROP,
                TTDROP             CDMA1XCH_HO_TTDROP,
                ADDINTERC          CDMA1XCH_HO_ADDINTERC,
                DROPINTERC         CDMA1XCH_HO_DROPINTERC,
                SOFTSLOPE          CDMA1XCH_HO_SOFTSLOPE,
                TCMP               CDMA1XCH_HO_TCMP,
                PNINC              CDMA1XCH_HO_PNINC,
                ACCTMO             PCH_APM_ACCTMO,
                R1XDRT             CDMA1XCH_SCH_R1XDRT,
                R2XDRT             CDMA1XCH_SCH_R2XDRT,
                R4XDRT             CDMA1XCH_SCH_R4XDRT,
                R8XDRT             CDMA1XCH_SCH_R8XDRT,
                R16XDRT            CDMA1XCH_SCH_R16XDRT,
                R32XDRT            CDMA1XCH_SCH_R32XDRT,
                FWDMINDRT          CDMA1XCH_SCH_FWDMINDRT,
                FWDMAXDRT          CDMA1XCH_SCH_FWDMAXDRT,
                OBNDCLS            CDMA1XCH_OBNDCLS,
                RCDATASCHSW        CDMA1XCH_CHINF_RCDATASCHSW,
                CCGH.BNDCLS        CDMA1XCH_GSRDM_BNDCLS,
                CCEH.BNDCLS        CDMA1XCH_EGSRDM_BNDCLS,
                CCSGH.BNDCLS       CDMA1XCH_SRCFG_BNDCLS,
                AUTODWNCDMACH      CDMA1XCH_AUTODWNCDMACH  ,
  FROM (SELECT DISTINCT OMCID, CN, SCTID, CRRID, PLTCHGAIN
          FROM CLT_CM_CDMA1XCH_PLTCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCPH,
       (SELECT DISTINCT PCHGAIN, OMCID, CN, SCTID, CRRID, ACHNUM, ADDNUM
          FROM CLT_CM_PCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CPH,
       (SELECT DISTINCT SYNCHGAIN, OMCID, SCTID, CRRID, CN
          FROM CLT_CM_SYNCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CYH,
       (SELECT DISTINCT MAXCELLR, OMCID, LOCALSECTORID, BTSID, CRRID
          FROM CLT_CM_HW_CBTSSECTORCARRIER_1X
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHCX,
       (SELECT DISTINCT ACHLOWTHR, OMCID, SCTID, CRRID, CN
          FROM CLT_CM_CDMA1XCH_ALDCTRL_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCAH,
       (SELECT DISTINCT TOTALZN,
                        ZNTMR,
                        MSID,
                        MNID,
                        MAXTSPRDIDX,
                        HOMEREG,
                        FORSIDREG,
                        FORNIDREG,
                        PWRUP,
                        PWRDWN,
                        PRMREG,
                        REGPRD,
                        REGDIST,
                       
                        OMCID,
                        SCTID,
                        CN,
                        CRRID
          FROM CLT_CM_CDMA1XCH_SPM_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCSH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CN,
                        CRRID,
                        PLTPL,
                        AUTODWNCDMACH,
                        OBNDCLS,
                        SCTGAIN,
                        TXGAIN
        
          FROM CLT_CM_CDMA1XCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCH,
       (SELECT DISTINCT MAXLEN, PAMLEN, OMCID, CN, SCTID, CRRID
          FROM CLT_CM_PCH_ACH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CPAH,
       (SELECT DISTINCT NOMPWR,
                        INITPWR,
                        PWRCSTEP,
                        NUMSTEP,
                        PRBPNRAN,
                        PRBBKOFF,
                        BKOFF,
                        MAXREQSEQ,
                        MAXRSPSEQ,
                        OMCID,
                        CN,
                        SCTID,
                        CRRID,
                        ACCTMO
          FROM CLT_CM_PCH_APM_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CPPH,
       (SELECT DISTINCT OMCID, SCTID, CN, CRRID, FWDVCFCHFER1, FWDDATFCHFER1
          FROM CLT_CM_CDMA1XCH_FER_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCFH,
       (SELECT DISTINCT OMCID,
                        CN,
                        SCTID,
                        CRRID,
                        IS95SCHGAIN1,
                        IS95SCHGAIN2,
                        IS95SCHGAIN3,
                        IS2KSCHGAIN1,
                        IS2KSCHGAIN2,
                        IS2KSCHGAIN3,
                        VINITFCH,
                        VMAXFCH,
                        VMINFCH,
                        DINITFCH,
                        DMAXFCH,
                        DMINFCH,
                        MAXDCCH,
                        MINDCCH,
                        SCHMAX,
                        SCHMIN,
                        V6VUFPCM,
                        V6DUFPCM,
                        V7VUFPCM,
                        V7DUFPCM,
                        FPCTHRS
          FROM CLT_CM_CDMA1XCH_FFASTPC_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCCH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CN,
                        CRRID,
                        PWRRPTTHRS,
                        PWRRPTFRMNUM,
                        PWRRPTDL
          FROM CLT_CM_CDMA1XCH_FSLOWPC_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCFCH,
       (SELECT DISTINCT OMCID, SCTID, CN, CRRID, REVSPDMDLOADCTRLSW
          FROM CLT_CM_CDMA1XCH_RLDCTRL_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCRH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CRRID,
                        CN,
                        REVPWRCSTEP,
                        VFCHRLGAINADJ,
                        DFCHRLGAINADJ,
                        RLGAINSCHPLT1X,
                        RLGAINSCHPLT2X,
                        RLGAINSCHPLT4X,
                        RLGAINSCHPLT8X,
                        RLGAINSCHPLT16X,
                        RLGAINSCHPLT32X,
                        REVPWRCTRLDELAY
          FROM CLT_CM_CDMA1XCH_RCLPC_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCRCH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CRRID,
                        CN,
                        SRCHWINA,
                        SRCHWINN,
                        SRCHWINR,
                        NBRMAXAGE,
                        TADD,
                        TDROP,
                        TTDROP,
                        ADDINTERC,
                        DROPINTERC,
                        SOFTSLOPE,
                        TCMP,
                        PNINC
          FROM CLT_CM_CDMA1XCH_HO_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCHH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CRRID,
                        CN,
                        R1XDRT,
                        R2XDRT,
                        R4XDRT,
                        R8XDRT,
                        R16XDRT,
                        R32XDRT,
                        FWDMINDRT,
                        FWDMAXDRT
          FROM CLT_CM_CDMA1XCH_SCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCSHH,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN, RCDATASCHSW
          FROM CLT_CM_CDMA1XCH_CHINF_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCCFH,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN, BNDCLS
          FROM CLT_CM_CDMA1XCH_GSRDM_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCGH,
       (SELECT DISTINCT OMCID, SCTID, CN, CRRID, BNDCLS
          FROM CLT_CM_CDMA1XCH_EGSRDM_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCEH,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN, BNDCLS
          FROM CLT_CM_CDMA1XCH_SRCFG_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCSGH,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN ,BCIDX
          FROM CLT_CM_CDMA1XCH_ESPM_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCSEH,
       CFG_MAP_DEV_TO_NE MDTN,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE MDTN.CITY_ID || MDTN.BSC = CCPH.OMCID(+)
   AND MDTN.BTS = CCPH.CN(+)
   AND MDTN.CELL = CCPH.SCTID(+)
   AND MDTN.CARR_SEQ = CCPH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CPH.OMCID(+)
   AND MDTN.BTS = CPH.CN(+)
   AND MDTN.CELL = CPH.SCTID(+)
   AND MDTN.CARR_SEQ = CPH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CYH.OMCID(+)
   AND MDTN.BTS = CYH.CN(+)
   AND MDTN.CELL = CYH.SCTID(+)
   AND MDTN.CARR_SEQ = CYH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHCX.OMCID(+)
   AND MDTN.LOCALBTS = CHCX.BTSID(+)
   AND MDTN.CELL = CHCX.LOCALSECTORID(+)
   AND MDTN.CARR_SEQ = CHCX.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCAH.OMCID(+)
   AND MDTN.BTS = CCAH.CN(+)
   AND MDTN.CELL = CCAH.SCTID(+)
   AND MDTN.CARR_SEQ = CCAH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCSH.OMCID(+)
   AND MDTN.BTS = CCSH.CN(+)
   AND MDTN.CELL = CCSH.SCTID(+)
      
   AND MDTN.CARR_SEQ = CCSH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCH.OMCID(+)
   AND MDTN.BTS = CCH.CN(+)
   AND MDTN.CELL = CCH.SCTID(+)
   AND MDTN.CARR_SEQ = CCH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CPAH.OMCID(+)
   AND MDTN.BTS = CPAH.CN(+)
   AND MDTN.CELL = CPAH.SCTID(+)
   AND MDTN.CARR_SEQ = CPAH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CPPH.OMCID(+)
   AND MDTN.BTS = CPPH.CN(+)
   AND MDTN.CELL = CPPH.SCTID(+)
   AND MDTN.CARR_SEQ = CPPH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCFH.OMCID(+)
   AND MDTN.BTS = CCFH.CN(+)
   AND MDTN.CELL = CCFH.SCTID(+)
   AND MDTN.CARR_SEQ = CCFH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCCH.OMCID(+)
   AND MDTN.BTS = CCCH.CN(+)
   AND MDTN.CELL = CCCH.SCTID(+)
   AND MDTN.CARR_SEQ = CCCH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCFCH.OMCID(+)
   AND MDTN.BTS = CCFCH.CN(+)
   AND MDTN.CELL = CCFCH.SCTID(+)
   AND MDTN.CARR_SEQ = CCFCH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCRH.OMCID(+)
   AND MDTN.BTS = CCRH.CN(+)
   AND MDTN.CELL = CCRH.SCTID(+)
   AND MDTN.CARR_SEQ = CCRH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCRCH.OMCID(+)
   AND MDTN.BTS = CCRCH.CN(+)
   AND MDTN.CELL = CCRCH.SCTID(+)
   AND MDTN.CARR_SEQ = CCRCH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCHH.OMCID(+)
   AND MDTN.BTS = CCHH.CN(+)
   AND MDTN.CELL = CCHH.SCTID(+)
   AND MDTN.CARR_SEQ = CCHH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCSHH.OMCID(+)
   AND MDTN.BTS = CCSHH.CN(+)
   AND MDTN.CELL = CCSHH.SCTID(+)
   AND MDTN.CARR_SEQ = CCSHH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCCFH.OMCID(+)
   AND MDTN.BTS = CCCFH.CN(+)
   AND MDTN.CELL = CCCFH.SCTID(+)
   AND MDTN.CARR_SEQ = CCCFH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCGH.OMCID(+)
   AND MDTN.BTS = CCGH.CN(+)
   AND MDTN.CELL = CCGH.SCTID(+)
   AND MDTN.CARR_SEQ = CCGH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCEH.OMCID(+)
   AND MDTN.BTS = CCEH.CN(+)
   AND MDTN.CELL = CCEH.SCTID(+)
   AND MDTN.CARR_SEQ = CCEH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCSGH.OMCID(+)
   AND MDTN.BTS = CCSGH.CN(+)
   AND MDTN.CELL = CCSGH.SCTID(+)
   AND MDTN.CARR_SEQ = CCSGH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCSEH.OMCID(+)
   AND MDTN.BTS = CCSEH.CN(+)
   AND MDTN.CELL = CCSEH.SCTID(+)
   AND MDTN.CARR_SEQ = CCSEH.CRRID(+)
   AND MDTN.VENDOR = 'ZY0808'
   AND MDTN.BUSTYPE = '1X'
   AND MDTN.CITY_ID = CS.CITYID(+)
   AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+)
--华为载扇DO省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27 
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                CS.PROVINCENAME,
                MDTN.CITY_NAME,
                MDTN.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                MDTN.BSC_NAME,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL,
                MDTN.CELL_NAME,
                MDTN.CARR_SEQ,
               
                CAPSULEOFFSET    CDMADOCH_DOCCHP_CAPSULEOFFSET,
                CCHRATE          CDMADOCH_DOCCHP_CCHRATE,
                PLTPL            CDMADOCH_PLTPL,
                ACYCLEDURATION   CDMADOCH_DOAPM_ACYCLEDURATION,
                PRBNUMSTEP       CDMADOCH_DOAPM_PRBNUMSTEP,
                PRBLEN           CDMADOCH_DOAPM_PRBLEN,
                CAPSULELENMAX    CDMADOCH_DOAPM_CAPSULELENMAX,
                SECTORACCMAXRATE CDMADOCH_D_S, --对CDMADOCH_DOAPM_SECTORACCMAXRATE 缩写  
                MAXCELLR         CBTSSECTORCARRIER_C_M, --对CBTSSECTORCARRIER_CBTSCDMADOSECTORPARA_MAXCELLR 缩写
                TXGAIN           CDMADOCH_TXGAIN,
                SCTGAIN          CDMADOCH_SCTGAIN,
                OLOOPADJUST      CDMADOCH_DOAPM_OLOOPADJUST,
                PRBINIADJUST     CDMADOCH_DOAPM_PRBINIADJUST,
                PWRSTEP          CDMADOCH_DOAPM_PWRSTEP,
                MINPCT           CDMADOCH_DORPCP_MINPCT,
                MAXPCT           CDMADOCH_DORPCP_MAXPCT,
                INITPCT          CDMADOCH_DORPCP_INITPCT,
                NORMALGFRAMED    CDMADOCH_DORPCP_NORMALGFRAMED,
                NODATAMAXINC     CDMADOCH_DORPCP_NODATAMAXINC,
                DOAREVPER        CDMADOCH_DOARPCP_DOAREVPER,
                SOFTSLOPE        CDMADOCH_DOCNP_SOFTSLOPE,
                ADDINTERCEPT     CDMADOCH_DOCNP_ADDINTERCEPT,
                DROPINTERCEPT    CDMADOCH_DOCNP_DROPINTERCEPT,
                NBRMAXAGE        CDMADOCH_DOCNP_NBRMAXAGE,
                DIFFCHNBRMAXAGE  CDMADOCH_DOCNP_DIFFCHNBRMAXAGE,
                SRCHWINA         CDMADOCH_DOCNP_SRCHWINA,
                SRCHWINN         CDMADOCH_DOCNP_SRCHWINN,
                SRCHWINR         CDMADOCH_DOCNP_SRCHWINR,
                OBNDCLS          CDMADOCH_OBNDCLS,
                AUTODWNCDMACH    CDMADOCH_AUTODWNCDMACH,
                RABOFFSET        CDMADOCH_DOSP_RABOFFSET
  FROM CFG_MAP_DEV_TO_NE MDTN,
       (SELECT DISTINCT OMCID, SCTID, CN, CRRID, CAPSULEOFFSET, CCHRATE
          FROM CLT_CM_HW_DOCCHP
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHD,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CN,
                        CRRID,
                        PLTPL,
                        TXGAIN,
                        SCTGAIN,
                        AUTODWNCDMACH,
                        OBNDCLS
          FROM CLT_CM_CDMADOCH_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCH,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CRRID,
                        CN,
                        ACYCLEDURATION,
                        PRBNUMSTEP,
                        PRBLEN,
                        CAPSULELENMAX,
                        SECTORACCMAXRATE,
                        OLOOPADJUST,
                        PRBINIADJUST,
                        PWRSTEP
          FROM CLT_CM_HW_DOAPM
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHDM,
       (SELECT DISTINCT OMCID, LOCALSECTORID, BTSID, CRRID, MAXCELLR
          FROM CLT_CM_HW_CBTSSECTORCARRIER_DO
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHCD,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CN,
                        CRRID,
                        MINPCT,
                        MAXPCT,
                        INITPCT,
                        NORMALGFRAMED,
                        NODATAMAXINC
          FROM CLT_CM_HW_DORPCP
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHDP,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN, DOAREVPER
          FROM CLT_CM_HW_DOARPCP
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHDPP,
       (SELECT DISTINCT OMCID,
                        SCTID,
                        CRRID,
                        CN,
                        SOFTSLOPE,
                        ADDINTERCEPT,
                        DROPINTERCEPT,
                        NBRMAXAGE,
                        DIFFCHNBRMAXAGE,
                        SRCHWINA,
                        SRCHWINN,
                        SRCHWINR
          FROM CLT_CM_HW_DOCNP
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CHWDP,
       (SELECT DISTINCT OMCID, SCTID, CRRID, CN, RABOFFSET
          FROM CLT_CM_CDMADOCH_DOSP_HW
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CCDH,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE MDTN.CITY_ID || MDTN.BSC = CHD.OMCID(+)
   AND MDTN.BTS = CHD.CN(+)
   AND MDTN.CELL = CHD.SCTID(+)
   AND MDTN.CARR_SEQ = CHD.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCH.OMCID(+)
   AND MDTN.BTS = CCH.CN(+)
   AND MDTN.CELL = CCH.SCTID(+)
   AND MDTN.CARR_SEQ = CCH.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHDM.OMCID(+)
   AND MDTN.BTS = CHDM.CN(+)
   AND MDTN.CELL = CHDM.SCTID(+)
   AND MDTN.CARR_SEQ = CHDM.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHCD.OMCID(+)
   AND MDTN.BTS = CHCD.BTSID(+)
   AND MDTN.CELL = CHCD.LOCALSECTORID(+)
   AND MDTN.CARR_SEQ = CHCD.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHDP.OMCID(+)
   AND MDTN.BTS = CHDP.CN(+)
   AND MDTN.CELL = CHDP.SCTID(+)
   AND MDTN.CARR_SEQ = CHDP.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHDPP.OMCID(+)
   AND MDTN.BTS = CHDPP.CN(+)
   AND MDTN.CELL = CHDP.SCTID(+)
   AND MDTN.CARR_SEQ = CHDPP.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CHWDP.OMCID(+)
   AND MDTN.BTS = CHWDP.CN(+)
   AND MDTN.CELL = CHWDP.SCTID(+)
   AND MDTN.CARR_SEQ = CHWDP.CRRID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CCDH.OMCID(+)
   AND MDTN.BTS = CCDH.CN(+)
   AND MDTN.CELL = CCDH.SCTID(+)
   AND MDTN.CARR_SEQ = CCDH.CRRID(+)
   AND MDTN.VENDOR = 'ZY0808'
   AND MDTN.BUSTYPE = 'DO'
   AND MDTN.CITY_ID = CS.CITYID(+)
   AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+)


--中兴载扇1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                CS.PROVINCENAME,
                MDTN.CITY_NAME,
                MDTN.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                MDTN.BSC_NAME,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL,
                MDTN.CELL_NAME,
                MDTN.CARR_SEQ,
                
                INIT_PWR              INIT_PWR,
                PWR_STEP              PWR_STEP,
                NUM_STEP              NUM_STEP,
                MAX_CAP_SZ            MAX_CAP_SZ,
                PAM_SZ                PAM_SZ,
                PROBE_PN_RAN          PROBE_PN_RAN,
                ACC_TMO               ACC_TMO,
                PROBE_BKOFF           PROBE_BKOFF,
                BKOFF                 BKOFF,
                MAX_REQ_SEQ           MAX_REQ_SEQ,
                MAX_RSP_SEQ           MAX_RSP_SEQ,
                NOM_PWR               NOM_PWR,
                FPC_MODE              FPC_MODE,
                FPC_MODE_SCH          FPC_MODE_SCH,
                FPC_PRI_CHAN          FPC_PRI_CHAN,
                FPC_FCH_FER_VOICE     FPC_FCH_FER_VOICE,
                FPC_FCH_FER_DATA      FPC_FCH_FER_DATA,
                FPCFCHMINSETPVOICE    FPCFCHMINSETPVOICE,
                FPCFCHMINSETPDATA     FPCFCHMINSETPDATA,
                FPCFCHMAXSETPVOICE    FPCFCHMAXSETPVOICE,
                FPCFCHMAXSETPDATA     FPCFCHMAXSETPDATA,
                FPC_DCCH_FER          FPC_DCCH_FER,
                FPC_DCCH_MAX_SETPT    FPC_DCCH_MAX_SETPT,
                FPC_SEC_CHAN          FPC_SEC_CHAN,
                FPCFCHINITSETPVOICE   FPCFCHINITSETPVOICE,
                FPCFCHINITSETPDATA    FPCFCHINITSETPDATA,
                RLGAIN_ADJ            RLGAIN_ADJ,
                REV_FCH_GATING_MODE   REV_FCH_GATING_MODE,
                FPC_SCH_INIT_SETPT    FPC_SCH_INIT_SETPT,
                FPC_SCH_MIN_SETPT     FPC_SCH_MIN_SETPT,
                FPC_SCH_MAX_SETPT     FPC_SCH_MAX_SETPT,
                FPC_SETPT_THRESH_SCH  FPC_SETPT_THRESH_SCH,
                FPC_SCH_FER32X        FPC_SCH_FER32X,
                FPC_SCH_FER16X        FPC_SCH_FER16X,
                FPC_SCH_FER8X         FPC_SCH_FER8X,
                FPC_SCH_FER4X         FPC_SCH_FER4X,
                FPC_SCH_FER2X         FPC_SCH_FER2X,
                FPC_SCH_INIT_SETPT_OP FPC_SCH_INIT_SETPT_OP,
                REVDTXDURATION        REVDTXDURATION,
                CPZ.FWDSCHRCPREF      FWDSCHRCPREF,
                FWDCODINGTYPE         FWDCODINGTYPE,
                FWDSCHMAXRATE         FWDSCHMAXRATE,
                REVSCHRCPREF          REVSCHRCPREF,
                REVCODINGTYPE         REVCODINGTYPE,
                REVSCHMAXRATE         REVSCHMAXRATE
  FROM CFG_MAP_DEV_TO_NE MDTN,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        CARRIERID,
                        INIT_PWR,
                        PWR_STEP,
                        NUM_STEP,
                        MAX_CAP_SZ,
                        PAM_SZ,
                        PROBE_PN_RAN,
                        ACC_TMO,
                        PROBE_BKOFF,
                        BKOFF,
                        MAX_REQ_SEQ,
                        MAX_RSP_SEQ
          FROM CLT_CM_R_3G_T_ACCESS_PARA_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) APZ,
       (SELECT DISTINCT OMCID, SYSTEM, CELLID, CARRIERID, NOM_PWR
          FROM CLT_CM_R_3G_T_CARRIER_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) TCZ,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        CARRIERID,
                        FPC_MODE,
                        FPC_MODE_SCH,
                        FPC_PRI_CHAN,
                        FPC_FCH_FER_VOICE,
                        FPC_FCH_FER_DATA,
                        FPCFCHMINSETPVOICE,
                        FPCFCHMINSETPDATA,
                        FPCFCHMAXSETPVOICE,
                        FPCFCHMAXSETPDATA,
                        FPC_DCCH_FER,
                        FPC_DCCH_MAX_SETPT,
                        FPC_SEC_CHAN,
                        FPCFCHINITSETPVOICE,
                        FPCFCHINITSETPDATA,
                        RLGAIN_ADJ,
                        REV_FCH_GATING_MODE,
                        FPC_SCH_INIT_SETPT,
                        FPC_SCH_MIN_SETPT,
                        FPC_SCH_MAX_SETPT,
                        FPC_SETPT_THRESH_SCH,
                        FPC_SCH_FER32X,
                        FPC_SCH_FER16X,
                        FPC_SCH_FER8X,
                        FPC_SCH_FER4X,
                        FPC_SCH_FER2X,
                        FPC_SCH_INIT_SETPT_OP
          FROM CLT_CM_ZTE_R_3G_T_PC_MSG
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) TPM,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        CARRIERID,
                        REVDTXDURATION,
                        FWDSCHRCPREF,
                        FWDCODINGTYPE,
                        FWDSCHMAXRATE,
                        REVSCHRCPREF,
                        REVCODINGTYPE,
                        REVSCHMAXRATE
          FROM CLT_CM_R_3G_T_CH_PARA_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CPZ,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE MDTN.CITY_ID || MDTN.BSC = APZ.OMCID(+)
   AND MDTN.BTS = APZ.SYSTEM(+)
   AND MDTN.CELL = APZ.CELLID(+)
   AND MDTN.CARR_SEQ = APZ.CARRIERID(+)
   AND MDTN.CITY_ID || MDTN.BSC = TCZ.OMCID(+)
   AND MDTN.BTS = TCZ.SYSTEM(+)
   AND MDTN.CELL = TCZ.CELLID(+)
   AND MDTN.CARR_SEQ = TCZ.CARRIERID(+)
   AND MDTN.CITY_ID || MDTN.BSC = TPM.OMCID(+)
   AND MDTN.BTS = TPM.SYSTEM(+)
   AND MDTN.CELL = TPM.CELLID(+)
   AND MDTN.CARR_SEQ = TPM.CARRIERID(+)
   AND MDTN.CITY_ID || MDTN.BSC = CPZ.OMCID(+)
   AND MDTN.BTS = CPZ.SYSTEM(+)
   AND MDTN.CELL = CPZ.CELLID(+)
   AND MDTN.CARR_SEQ = CPZ.CARRIERID(+)
   AND MDTN.VENDOR = 'ZY0804'
   AND MDTN.BUSTYPE = '1X'
   AND MDTN.CITY_ID = CS.CITYID(+)
   AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+) 
--中兴载扇DO省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27 
  SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                  MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                  MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                  CS.PROVINCENAME,
                  MDTN.CITY_NAME,
                  MDTN.MSC_NAME,
                  TC.MGW_NAME AS "载扇所属MGW标识",
                  MDTN.BSC_NAME,
                  MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                  MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                  MDTN.CELL,
                  MDTN.CELL_NAME,
                  MDTN.CARR_SEQ,
               
                  OLCONTROLMINDORM,
                  RABLENGTH,
                  SYNCCAPSULEOFFSET,
                  CONTROLCHANNELRATE,
                  PROBENUMSTEP,
                  ACHDURATIONFOR6800,
                  SECTORACCESSMAXRATE,
                  OPENLOOPADJUST,
                  POWERSTEP,
                  RABOFFSET,
                  RABTHRESHOLD68_ROT
          FROM CFG_MAP_DEV_TO_NE MDTN,
         (SELECT DISTINCT OMCID,
                          SYSTEM,
                          CELLID,
                          CARRIERID,
                          OLCONTROLMINDORM
            FROM CLT_CM_R_H_T_OVLD_PARA_ZTE
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) OPZ,
         (SELECT DISTINCT OMCID,
                          SYSTEM,
                          CELLID,
                          CARRIERID,
                          RABLENGTH,
                          RABOFFSET,
                          RABTHRESHOLD68_ROT
            FROM CLT_CM_R_H_T_CARRIER_STATE_ZTE
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CSZ,
         (SELECT DISTINCT OMCID,
                          SYSTEM,
                          CELLID,
                          CARRIERID,
                          SYNCCAPSULEOFFSET,
                          CONTROLCHANNELRATE
            FROM CLT_CM_R_H_T_CCH_PARA_ZTE
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CPZ,
         (SELECT DISTINCT OMCID,
                          SYSTEM,
                          CELLID,
                          CARRIERID,
                          PROBENUMSTEP,
                          ACHDURATIONFOR6800,
                          SECTORACCESSMAXRATE,
                          OPENLOOPADJUST,
                          POWERSTEP
            FROM CLT_CM_R_H_T_ACC_PARA_ZTE
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) APZ,
         CFG_CITY_SID CS,
         (SELECT NE_SYS_ID, MGW_NAME
            FROM (SELECT NE_SYS_ID,
                         MGW_NAME,
                         ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                    FROM NE_TAIZHANG_CELL T)
           WHERE RN = 1) TC
         WHERE MDTN.CITY_ID || MDTN.BSC = OPZ.OMCID(+)
           AND MDTN.BTS = OPZ.SYSTEM(+)
           AND MDTN.CELL = OPZ.CELLID(+)
           AND MDTN.CARR_SEQ = OPZ.CARRIERID(+)
           AND MDTN.CITY_ID || MDTN.BSC = CSZ.OMCID(+)
           AND MDTN.BTS = CSZ.SYSTEM(+)
           AND MDTN.CELL = CSZ.CELLID(+)
           AND MDTN.CARR_SEQ = CSZ.CARRIERID(+)
           AND MDTN.CITY_ID || MDTN.BSC = CPZ.OMCID(+)
           AND MDTN.BTS = CPZ.SYSTEM(+)
           AND MDTN.CELL = CPZ.CELLID(+)
           AND MDTN.CARR_SEQ = CPZ.CARRIERID(+)
           AND MDTN.CITY_ID || MDTN.BSC = APZ.OMCID(+)
           AND MDTN.BTS = APZ.SYSTEM(+)
           AND MDTN.CELL = APZ.CELLID(+)
           AND MDTN.CARR_SEQ = APZ.CARRIERID(+)
           AND MDTN.VENDOR = 'ZY0804'
           AND MDTN.BUSTYPE = 'DO'
           AND MDTN.CITY_ID = CS.CITYID(+)
           AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+)




--阿朗载扇1X
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                CS.PROVINCENAME,
                MDTN.CITY_NAME,
                MDTN.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                MDTN.BSC_NAME,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL,
                MDTN.CELL_NAME,
                MDTN.CARR_SEQ,
                LE.BCAST_INDEX
  FROM CLT_CM_LUC_ECP LE,
       CFG_MAP_DEV_TO_NE MDTN,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE LE.OMCID = MDTN.OMC
   AND MDTN.CITY_ID = CS.CITYID
   AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+)
   AND LE.STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')

--
--阿朗载扇DO
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL || '.' || MDTN.CARR_SEQ AS "载扇标识",
                CS.PROVINCENAME,
                MDTN.CITY_NAME,
                MDTN.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                MDTN.BSC_NAME,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS,
                MDTN.BSC_NAME || '.' || MDTN.BSC || '.' || MDTN.BTS || '.' ||
                MDTN.CELL,
                MDTN.CELL_NAME,
                MDTN.CARR_SEQ,
                PREAMBLELENGTHSLOTS,
                SECTORACCESSMAXRATE
  FROM CLT_CM_LUC_DO_SECTORCARRIER LDS,
       CFG_MAP_DEV_TO_NE MDTN,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE MDTN.OMC = LDS.OMCID
   AND MDTN.BTS = LDS.CELLSITEID
   AND MDTN.CELL = LDS.SECTORID
   AND MDTN.CARR_SEQ = LDS.CARRIERID
   AND MDTN.CITY_ID = CS.CITYID
   AND MDTN.NE_CELL_ID = TC.NE_SYS_ID(+)
   AND LDS.STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')


--华为扇区1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID || '.' ||
                CC.SECTOR_ID AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,
                PRAT
  FROM NE_CELL_C CC,
       CLT_CM_CELL_SCTSCHM_HW CSH,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE CC.CITY_ID || CC.BSC_ID = CSH.OMCID(+)
   AND CC.BTS_ID = CSH.CN(+)
   AND CC.SECTOR_ID = CSH.SCTID(+)
   AND TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS') = CSH.STAMPTIME(+)
   AND CC.VENDOR = 'ZY0808'
   AND CC.CITY_ID = CS.CITYID(+)
   AND CC.NE_SYS_ID = TC.NE_SYS_ID(+)
--中兴扇区1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID || '.' ||
                CC.SECTOR_ID AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,
                
                RADIUS, --  小区半径123
                TOTAL_ZONES, --  被保持的登记区域数
                ZONE_TIMER, --  区域定时器长度
                MULT_SIDS, --  多个SID存储指示
                MULT_NIDS, --  多个NID存储指示
                HOME_REG, --  归属登记指示
                FOR_SID_REG, --  SID漫游用户登记指示
                FOR_NID_REG, --  NID漫游用户登记指示
                POWER_UP_REG, --  开机登记指示
                POWER_DOWN_REG, --  关机登记指示
                PARAMETER_REG, --  参数变化登记指示
                REG_PRD, --  登记周期
                REG_DIST, --  登记距离
                MAX_SLOT_CYCLE_INDEX, --  最大时隙周期指数
                BCAST_INDEX, --  广播时隙周期指数
                PWR_REP_THRESH, --  功率控制报告门限
                PWR_REP_FRAMES, --  功率控制报告帧计数
                PWR_THRESH_ENABLE, --  门限报告模式指示
                PWR_PERIOD_ENABLE, --  定期报告模式指示
                PWR_REP_DELAY, --  功率报告延迟
                RLGAIN_TRAFFIC_PILOT, --  业务信道（含FCH和SCH）相对导频的增益调整
                RLGAIN_SCH_PILOT, --  补充信道相对导频的增益调整
                T_ADD_VOICE, --  语音业务导频加入门限
                T_ADD_DATA, --  数据业力导频加入门限
                T_DROP_VOICE, --  语音业务导频去掉门限
                T_DROP_DATA, --  数据业力导频去掉门限
                T_COMP_VOICE, --  语音业务有效导引集和候选导引集比较门限
                T_COMP_DATA, --  数据业务有效导引集和候选导引集比较门限
                T_TDROP_VOICE, --  语音业务去掉导引信号定时器值
                T_TDROP_DATA, --  数据业务去掉导引信号定时器值
                SOFT_SLOPE_VOICE, --  语音业务软切换斜率
                SOFT_SLOPE_DATA, --  数据业务软切换斜率
                ADD_INTERCEPT_VOICE, --  语音业务软切换加入截距
                ADD_INTERCEPT_DATA, --  数据业务软切换加入截距
                DROP_INTERCEPT_VOICE, --  语音业务软切换去掉截距
                DROP_INTERCEPT_DATA, --  数据业务软切换去掉截距
                PILOT_INC, --  导引信号PN序列偏置增量
                SRCH_WIN_A, --  有效导引信号集和候选导引信号集搜索窗口大小
                SRCH_WIN_N, --  相邻导引信号集搜索窗口大小
                SRCH_WIN_R, --  剩余导引信号集搜索窗口大小
                NGHBR_MAX_AGE, --  相邻导引信号集最大AGE 值
                PAGECH_PRAT --  寻呼信道数据速率

  FROM NE_CELL_C CC,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        RADIUS,
                        PILOT_INC,
                        SRCH_WIN_A,
                        SRCH_WIN_N,
                        SRCH_WIN_R,
                        NGHBR_MAX_AGE
          FROM CLT_CM_R_3G_T_CELL_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) TCZ,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        TOTAL_ZONES,
                        ZONE_TIMER,
                        MULT_SIDS,
                        MULT_NIDS,
                        HOME_REG,
                        FOR_SID_REG,
                        FOR_NID_REG,
                        POWER_UP_REG,
                        POWER_DOWN_REG,
                        PARAMETER_REG,
                        REG_PRD,
                        REG_DIST,
                        MAX_SLOT_CYCLE_INDEX,
                        BCAST_INDEX,
                        PAGECH_PRAT
          FROM CLT_CM_R_3G_T_SYS_PARA_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) SPZ,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        PWR_REP_THRESH,
                        PWR_REP_FRAMES,
                        PWR_THRESH_ENABLE,
                        PWR_PERIOD_ENABLE,
                        PWR_REP_DELAY
          FROM CLT_CM_ZTE_R_3G_T_PWR_REP
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) TPR,
       (SELECT DISTINCT OMCID,
                        --SYSTEM,
                        --CELLID,
                        RLGAIN_TRAFFIC_PILOT,
                        RLGAIN_SCH_PILOT
          FROM CLT_CM_ZTE_R_3G_S_GAIN
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) SG,
       (SELECT DISTINCT OMCID,
                        SYSTEM,
                        CELLID,
                        T_ADD_VOICE,
                        T_ADD_DATA,
                        T_DROP_VOICE,
                        T_DROP_DATA,
                        T_COMP_VOICE,
                        T_COMP_DATA,
                        T_TDROP_VOICE,
                        T_TDROP_DATA,
                        SOFT_SLOPE_VOICE,
                        SOFT_SLOPE_DATA,
                        ADD_INTERCEPT_VOICE,
                        ADD_INTERCEPT_DATA,
                        DROP_INTERCEPT_VOICE,
                        DROP_INTERCEPT_DATA
          FROM CLT_CM_R_3G_T_HANDOFF_ZTE
         WHERE STAMPTIME = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) THZ,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL)
         WHERE RN = 1) TC
 WHERE CC.CITY_ID || CC.BSC_ID = TCZ.OMCID(+)
   AND CC.BTS_ID = TCZ.SYSTEM(+)
   AND CC.SECTOR_ID = TCZ.CELLID(+)
   AND CC.CITY_ID || CC.BSC_ID = SPZ.OMCID(+)
   AND CC.BTS_ID = SPZ.SYSTEM(+)
   AND CC.SECTOR_ID = SPZ.CELLID(+)
   AND CC.CITY_ID || CC.BSC_ID = TPR.OMCID(+)
   AND CC.BTS_ID = TPR.SYSTEM(+)
   AND CC.SECTOR_ID = TPR.CELLID(+)
   AND CC.CITY_ID || CC.BSC_ID = THZ.OMCID(+)
   AND CC.BTS_ID = THZ.SYSTEM(+)
   AND CC.SECTOR_ID = THZ.CELLID(+)
   AND CC.CITY_ID || CC.BSC_ID = SG.OMCID(+)
   AND CC.VENDOR = 'ZY0804'
   AND CC.CITY_ID = CS.CITYID(+)
   AND CC.NE_SYS_ID = TC.NE_SYS_ID(+)
-----
--中兴扇区DO省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID || '.' ||
                CC.SECTOR_ID AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,
                -------------------               ,
                SEARCHWINDOWACTIVE,
                SEARCHWINDOWNB,
                SEARCHWINDOWREM,
                PILOTADD1,
                PILOTCOMPARE1,
                PILOTDROP1,
                PILOTDROPTIMER1,
                SOFTSLOPE1,
                ADDINTERCEPT1,
                DROPINTERCEPT1
  FROM NE_CELL_C CC,
       CLT_CM_R_H_S_HO_PARA_ZTE HPZ,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE CC.CITY_ID || CC.BSC_ID = HPZ.OMCID(+)
   AND CC.BTS_ID = HPZ.SYSTEM(+)
   AND CC.SECTOR_ID = HPZ.CELLID(+)
   AND CC.VENDOR = 'ZY0804'
   AND HPZ.STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND CC.CITY_ID = CS.CITYID(+)
   AND CC.NE_SYS_ID = TC.NE_SYS_ID(+)

-----------------------------------------
--阿郎扇区1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID || '.' ||
                CC.SECTOR_ID AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,
                
                PILOT_GAIN, --  PILOT_GAIN
                PAGING_GAIN, --  寻呼信道增益
                SYNC_GAIN, --  同步信道增益
                FNIDREG, --  外部 NID 用户允许标志位
                MLTSIDSTR, --  多 SID 存储指示
                MLTNIDSTR, --  多 NID 存储指示
                NOM_PWR, --  接入信道初始标称功率
                INIT_PWR, --  接入信道初始功率偏置
                PWR_STEP, --  接入信道功率调整步长
                NUM_STEP, --  接入试探数
                ACC_TMO, --  接入信道响应等待时间
                MAX_REQ_SEQ, --  接入信道请求最大试探序列数
                MAX_RSP_SEQ, --  接入信道响应最大试探序列数
                MAX_CAP_SZ, --  接入信道试探消息实体长度
                PAM_SZ, --  接入信道试探前缀长度
                PROBE_PN_RAN, --  接入信道试探随机延迟
                PROBE_BKOFF, --  接入信道试探滞后范围
                BKOFF, --  接入信道试探序列滞后范围
                PWRREPFRAMES, --  PWR_REP_FRAMES
                T_ADD, --  T_ADD
                T_DROP, --  T_DROP
                T_COMP, --  T_COMP
                T_TDROP, --  T_TDROP
                SRCHWINA, --  SRCH_WIN_A
                SRCHWINN, --  SRCH_WIN_N
                SRCHWINR, --  SRCH_WIN_R
                PILOT_INC_MUX --  PILOT_INC_MUX
  FROM NE_CELL_C CC,
       CLT_CM_LUC_CEQFACE CLC,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE CC.VENDOR = 'ZY0810'
   AND CC.CITY_ID || CC.BSC_ID = CLC.OMCID(+)
   AND CC.CITY_ID = CS.CITYID(+)
   AND CLC.STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND CC.NE_SYS_ID = TC.NE_SYS_ID(+)
--阿郎扇区DO省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27  
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID || '.' ||
                CC.SECTOR_ID AS "扇区标识",
                CS.PROVINCENAME,
                CC.CITY_NAME,
                CC.MSC_NAME,
                TC.MGW_NAME AS "载扇所属MGW标识",
                CC.BSC_NAME,
                CC.BSC_NAME || '.' || CC.BSC_ID || '.' || CC.BTS_ID,
                CC.SECTOR_ID,
                CC.CHINA_NAME,

                DORMANCYTIMER,
                CCSYNCAPSULEOFFSET,
                CONTROLCHANNELRATE,
                PROBENUMSETUP,
                PREAMBLELENGTH,
                PROBEBACKOFF,
                CAPSULELENGTHMAX,
                OPENLOOPADJUST,
                PILOTCOMPARE,
                PILOTDROP,
                PILOTDROPTIMER,
                SOFTSLOPE,
                ADDINTERCEPT,
                DROPINTERCEPT,
                SEARCHWINDOWACTIVE,
                RABOFFSET
  FROM NE_CELL_C CC,
       CLT_CM_LUC_DO_SECTOR LDS,
       CFG_CITY_SID CS,
       (SELECT NE_SYS_ID, MGW_NAME
          FROM (SELECT NE_SYS_ID,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY NE_SYS_ID ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE CC.CITY_ID || CC.BSC_ID = LDS.OMCID(+)
   AND CC.BTS_ID = LDS.CELLSITEID(+)
   AND CC.SECTOR_ID = SECTORID(+)
   AND CC.CITY_ID = CS.CITYID(+)
   AND LDS.STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND CC.NE_SYS_ID = TC.NE_SYS_ID(+)
-----------------
--中兴BTS 1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27 
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                BC.BSC_NAME || '.' || BC.BSC_ID || '.' || BC.BTS_ID,
                CS.PROVINCENAME,
                CS.CITYNAME,
                BC.MSC_NAME,
                TC.MGW_NAME MGM,
                BC.BSC_NAME || '.' || BC.BSC_ID,
                ALLOWMINFSCHDURCODE,
                ALLOWMAXFSCHDURCODE
  FROM NE_BTS_C BC,
       CLT_CM_ZTE_R_3G_T_FWDPOWER_1X TFX,
       CFG_CITY_SID CS,
       (SELECT RELATED_BTS NE_BTS_ID, MGW_NAME
          FROM (SELECT RELATED_BTS,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY RELATED_BTS ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC
 WHERE BC.CITY_ID || BC.BSC_ID = TFX.OMCID(+)
   AND TFX.SYSTEM(+) = BC.BTS_ID
   AND BC.VENDOR = 'ZY0804'
   AND STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND BC.CITY_ID = CS.CITYID(+)
   AND BC.VENDOR = 'ZY0804'
   AND BC.NE_SYS_ID = TC.NE_BTS_ID(+)
--阿郎BTS 1X省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                BC.BSC_NAME || '.' || BC.BSC_ID || '.' || BC.BTS_ID,
                CS.PROVINCENAME,
                CS.CITYNAME,
                BC.MSC_NAME,
                TC.MGW_NAME MGM,
                BC.BSC_NAME || '.' || BC.BSC_ID,
                ZONE_TMR,
                TOTZONES,
                HOMEREG,
                FSIDREG,
                PUPD_C
  FROM NE_BTS_C BC,
       CLT_CM_LUC_CELL2 CLC,
       CFG_CITY_SID CS,
       (SELECT RELATED_BTS NE_BTS_ID, MGW_NAME
          FROM (SELECT RELATED_BTS,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY RELATED_BTS ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC

 WHERE BC.CITY_ID || BC.BSC_ID = CLC.OMCID(+)
   AND BC.VENDOR = 'ZY0810'
   AND STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND BC.CITY_ID = CS.CITYID(+)
   AND BC.NE_SYS_ID = TC.NE_BTS_ID(+) 
----------------------------------------
--华为BSC 省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27 
  SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                  BC.CHINA_NAME || '.' || BC.BSC_ID,
                  CS.PROVINCENAME,
                  CS.CITYNAME,
                  BC.CHINA_NAME,
                  TC.MGW_NAME MGM,

                  ACMACRODIVSW         BSC_CHM_ACMACRODIVSW,
                  PNINC                BSC_PNINC,
                  HHOMAXTARGNUM        BSC_BSCHO_HHOMAXTARGNUM,
                  BBH.INTRABSCHHOSW    BSC_BSCHO_INTRABSCHHOSW,
                  BBH.INTERBSCHHOSW    BSC_BSCHO_INTERBSCHHOSW,
                  HON.INTERBSCHHOSW    NBRBSCFUNC_INTERBSCHHOSW,
                  SCHRELDTXDUR         BSC_CHM_SCHRELDTXDUR,
                  SPT16XREVSCHSW       BSC_CHM_SPT16XREVSCHSW,
                  FWDSCH32XSW          BSC_CHM_FWDSCH32XSW,
                  REVSCH32XSW          BSC_CHM_REVSCH32XSW,
                  TRGARFCN             BSC_BSCRSM_TRGARFCN,
                  STRTIME              BSC_BSCRSM_STRTIME,
                  STOPTIME             BSC_BSCRSM_STOPTIME,
                  FWDSCHSHOSW          BSC_CHM_FWDSCHSHOSW,
                  REVSCHSHOSW          BSC_CHM_REVSCHSHOSW,
                  FWDSASTHR            BSC_CHM_FWDSASTHR,
                  FWDSASMAXNUM         BSC_CHM_FWDSASMAXNUM,
                  REVSASTHR            BSC_CHM_REVSASTHR,
                  REVSASMAXNUM         BSC_CHM_REVSASMAXNUM,
                  FWDSCHVARRATESW      BSC_CHM_FWDSCHVARRATESW,
                  REVSCHVARRATESW      BSC_CHM_REVSCHVARRATESW,
                  REVSCHEXTSW          BSC_CHM_REVSCHEXTSW,
                  REVSCHEXTFOREDURSW   BSC_CHM_REVSCHEXTFOREDURSW,
                  FWDSCHEXTSW          BSC_CHM_FWDSCHEXTSW,
                  RTT                  BSC_RLPBLOB_RTT,
                  NAKROUNDSFWD         BSC_RLPBLOB_NAKROUNDSFWD,
                  NAKROUNDSREV         BSC_RLPBLOB_NAKROUNDSREV,
                  NAKPERROUNDFWD0      BSC_RLPBLOB_NAKPERROUNDFWD0,
                  NAKPERROUNDFWD1      BSC_RLPBLOB_NAKPERROUNDFWD1,
                  NAKPERROUNDFWD2      BSC_RLPBLOB_NAKPERROUNDFWD2,
                  NAKPERROUNDREV0      BSC_RLPBLOB_NAKPERROUNDREV0,
                  NAKPERROUNDREV1      BSC_RLPBLOB_NAKPERROUNDREV1,
                  NAKPERROUNDREV2      BSC_RLPBLOB_NAKPERROUNDREV2,
                  QOSFUNSW             QOS_QOSFUNSW,
                  GOLDFSCHRATE         QOS_GOLDFSCHRATE,
                  GOLDRSCHRATE         QOS_GOLDRSCHRATE,
                  SILVERFSCHRATE       QOS_SILVERFSCHRATE,
                  SILVERRSCHRATE       QOS_SILVERRSCHRATE,
                  BRONZEFSCHRATE       QOS_BRONZEFSCHRATE,
                  BRONZERSCHRATE       QOS_BRONZERSCHRATE,
                  DATASW               QOS_DATASW,
                  SMOOTHPERIOD         SDU1XRLP_SMOOTHPERIOD,
                  SCHLOCKTHRESHOLD     SDU1XRLP_SCHLOCKTHRESHOLD,
                  SCHRETRYTIME         SDU1XRLP_SCHRETRYTIME,
                  INACTIVETIMERLEN     SDU1XRLP_INACTIVETIMERLEN,
                  REXMITFRAMETHRESHOLD SDU1XRLP_REXMITFRAMETHRESHOLD,
                  SCHSTOPTHRESHOLD     SDU1XRLP_SCHSTOPTHRESHOLD,
                  SCHSTOPCHECKCOUNT    SDU1XRLP_SCHSTOPCHECKCOUNT
        
          FROM NE_BSC_C BC,
         (SELECT DISTINCT OMCID,
                          ACMACRODIVSW,
                          SCHRELDTXDUR,
                          SPT16XREVSCHSW,
                          FWDSCH32XSW,
                          REVSCH32XSW,
                          FWDSCHSHOSW,
                          REVSCHSHOSW,
                          FWDSASTHR,
                          FWDSASMAXNUM,
                          REVSASTHR,
                          REVSASMAXNUM,
                          FWDSCHVARRATESW,
                          REVSCHVARRATESW,
                          REVSCHEXTSW,
                          REVSCHEXTFOREDURSW,
                          FWDSCHEXTSW
            FROM CLT_CM_BSC_CHM_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) BCH,
         (SELECT DISTINCT OMCID, PNINC
            FROM CLT_CM_BSC_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CBH,
         (SELECT DISTINCT OMCID,
                          HHOMAXTARGNUM,
                          INTRABSCHHOSW,
                          INTERBSCHHOSW
            FROM CLT_CM_BSC_BSCHO_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) BBH,
         (SELECT DISTINCT OMCID, INTERBSCHHOSW
            FROM CLT_CM_HW_ODTMOC_NBRBSCFUNC
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) HON,
         (SELECT DISTINCT OMCID, TRGARFCN, STRTIME, STOPTIME
            FROM CLT_CM_BSC_BSCRSM_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CBBH,
         (SELECT OMCID,
                 RTT,
                 NAKROUNDSFWD,
                 NAKROUNDSREV,
                 NAKPERROUNDFWD0,
                 NAKPERROUNDFWD1,
                 NAKPERROUNDFWD2,
                 NAKPERROUNDREV0,
                 NAKPERROUNDREV1,
                 NAKPERROUNDREV2
            FROM CLT_CM_BSC_RLPBLOB_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) BRB,
         (SELECT OMCID,
                 QOSFUNSW,
                 GOLDFSCHRATE,
                 GOLDRSCHRATE,
                 SILVERFSCHRATE,
                 SILVERRSCHRATE,
                 BRONZEFSCHRATE,
                 BRONZERSCHRATE,
                 DATASW
            FROM CLT_CM_QOS_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CQH,
         (SELECT OMCID,
                 SMOOTHPERIOD,
                 SCHLOCKTHRESHOLD,
                 SCHRETRYTIME,
                 INACTIVETIMERLEN,
                 REXMITFRAMETHRESHOLD,
                 SCHSTOPTHRESHOLD,
                 SCHSTOPCHECKCOUNT
            FROM CLT_CM_SDU1XRLP_HW
           WHERE STAMPTIME =
                 TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')) CSH,
         CFG_CITY_SID CS,
         (SELECT RELATED_BSC NE_BSC_ID, MGW_NAME
            FROM (SELECT RELATED_BSC,
                         MGW_NAME,
                         ROW_NUMBER() OVER(PARTITION BY RELATED_BSC ORDER BY MGW_NAME) RN
                    FROM NE_TAIZHANG_CELL T)
           WHERE RN = 1) TC
        
         WHERE BC.CITY_ID || BC.BSC_ID = BCH.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = CBH.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = BBH.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = HON.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = CBBH.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = BRB.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = CQH.OMCID(+)
           AND BC.CITY_ID || BC.BSC_ID = CSH.OMCID(+)
           AND BC.VENDOR = 'ZY0808'
           AND BC.CITY_ID = CS.CITYID(+)
           AND BC.NE_SYS_ID = TC.NE_BSC_ID


--中兴BSC 1X 省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27  
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                BC.CHINA_NAME || '.' || BC.BSC_ID,
                CS.PROVINCENAME,
                CS.CITYNAME,
                BC.CHINA_NAME,
                TC.MGW_NAME MGM,

                PWR_CNTL_STEP1,
                PWR_CNTL_STEP2,
                PWR_CNTL_STEP3,
                FPC_SUBCHAN_GAIN1,
                FPC_SUBCHAN_GAIN2,
                FPC_SUBCHAN_GAIN3
  FROM NE_BSC_C BC,
       CLT_CM_ZTE_R_3G_S_FWDPOWER_1X SFX,
       CFG_CITY_SID CS,
       (SELECT RELATED_BSC NE_BSC_ID, MGW_NAME
          FROM (SELECT RELATED_BSC,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY RELATED_BSC ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC

 WHERE BC.CITY_ID || BC.BSC_ID = SFX.OMCID(+)
   AND BC.VENDOR = 'ZY0804'
   AND SFX.STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND BC.CITY_ID = CS.CITYID(+)
   AND BC.NE_SYS_ID = TC.NE_BSC_ID(+)
--中兴BSC DO 省接口
--CREATE BY GUYONGJUN
--CREATE DATE:2012-09-27  
SELECT DISTINCT TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS'),
                BC.CHINA_NAME || '.' || BC.BSC_ID,
                CS.PROVINCENAME,
                CS.CITYNAME,
                BC.CHINA_NAME,
                TC.MGW_NAME MGM,

                PROBESEQUENCEMAX,
                DRCLOCKPERIOD,
                DRCLOCKLENGTH,
                MUPACKETSENABLED,
                DSCLENGTH,
                SPENABLEDTHRESH,
                DRCSUPERVISIONTIMER,
                DSCCHANNELGAINBOOST,
                DRCCHANNELGAINBOOST,
                PROBEBACKOFF,
                PROBESEQBACKOFF,
                ACCDATAOFFSETNOM,
                ACCDATAOFFSET9K6,
                APERSISTENCEOR,
                ATACCESSRATEMAX,
                SOFTHODELAY
  FROM NE_BSC_C BC,
       CLT_CM_ZTE_R_H_S_CFG_PARA SFX,
       CFG_CITY_SID CS,
       (SELECT RELATED_BSC NE_BSC_ID, MGW_NAME
          FROM (SELECT RELATED_BSC,
                       MGW_NAME,
                       ROW_NUMBER() OVER(PARTITION BY RELATED_BSC ORDER BY MGW_NAME) RN
                  FROM NE_TAIZHANG_CELL T)
         WHERE RN = 1) TC

 WHERE BC.CITY_ID || BC.BSC_ID = SFX.OMCID(+)
   AND BC.VENDOR = 'ZY0804'
   AND SFX.STAMPTIME(+) = TO_DATE('&START_DATE', 'YYYY-MM-DD HH24:MI:SS')
   AND BC.CITY_ID = CS.CITYID(+)
   AND BC.NE_SYS_ID = TC.NE_BSC_ID(+)

