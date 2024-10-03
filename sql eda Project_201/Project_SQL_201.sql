########## CREATING THE DATABASE #######
-- create database project_201;
use project_201;

######## RENAME THE TABLE NAME #################
ALTER TABLE `Data set` RENAME TO data_set;

ALTER TABLE data_set RENAME COLUMN `INJ1_QTY
(Coke Injection Qty)` TO INJ1_QTY;

ALTER TABLE data_set RENAME COLUMN `INJ2_QTY
(Coke Injection Qty)` TO INJ2_QTY;

select * from Data_set; 	
select count(*) from Data_set;

-- checking the datatype
select column_name, data_type
from information_schema.columns
where table_name = 'data_set'
and table_schema = 'project_201';

##### UNIVARIANT ANALYSIS #########
###### first movement decision #########

SELECT
  AVG(`COKE_REQ`) AS avg_coke_req,
  AVG(`INJ1_QTY`) AS avg_INJ1_QTY,
  AVG(`INJ2_QTY`) AS avg_INJ1_QTY,
  AVG(`BSM`) AS avg_bsm,
  AVG(`TP`) AS avg_tp,
  AVG(`MSTB`) AS avg_mstb,
  AVG(`SKULL`) AS avg_skull,
  AVG(`SHRAD`) AS avg_shrad,
  AVG(`REMET`) AS avg_remet,
  AVG(`BP`) AS avg_bp,
  AVG(`HBI`) AS avg_hbi,
  AVG(`OTHERS`) AS avg_others,
  AVG(`SCRAP_QTY (MT)`) AS avg_scrap_qty,
  AVG(`PIGIRON`) AS avg_pigiron,
  AVG(`DRI1_QTY (MT) (Lumps)`) AS avg_dri1_qty,
  AVG(`TOT_DRI_QTY`) AS avg_tot_dri_qty,
  AVG(`HOT_METAL (HOT Metal from MBF)`) AS avg_hot_metal,
  AVG(`Total Charge`) AS avg_total_charge,
  AVG(`Hot_Heel (Left Over Liquid metal in EAF)`) AS avg_hot_heel,
  AVG(`DOLO`) AS avg_dolo,
  AVG(`DOLO1_EMPTY`) AS avg_dolo1_empty,
  AVG(`TOT_LIME_QTY`) AS avg_tot_lime_qty,
  AVG(`TAP_TEMP (Tappnig Temperature)`) AS avg_tap_temp,
  AVG(`O2REQ`) AS avg_o2req,
  AVG(`O2ACT`) AS avg_o2act,
  AVG(`ENERGY (Energy Consumption)`) AS avg_energy,
  AVG(`KWH_PER_TON (Energy Consumption Per Ton)`) AS avg_kwh_per_ton,
  AVG(`KWH_PER_MIN`) AS avg_kwh_per_min,
  AVG(`MELT_TIME (Melting Time)`) AS avg_melt_time,
  AVG(`TA_TIME (Turn Around Time)`) AS avg_ta_time,
  AVG(`TT_TIME (Total Cycle Time Including Breakdown)`) AS avg_tt_time,
  AVG(`POW_ON_TIME`) AS avg_pow_on_time,
  AVG(`TAPPING_TIME`) AS avg_tapping_time,
  AVG(`ARCING_TIME`) AS avg_arcing_time,
  AVG(`DOWN_TIME`) AS avg_down_time,
  AVG(`E1_CUR (Electrode 1 Current)`) AS avg_e1_cur,
  AVG(`E2_CUR (Electrode 2 Current)`) AS avg_e2_cur,
  AVG(`E3_CUR (Electrode 3 Current)`) AS avg_e3_cur,
  AVG(`SPOUT (Bottom Refractory Temperature)`) AS avg_spout,
  AVG(`DOLOMIT`) AS avg_dolomit,
  AVG(`CPC`) AS avg_cpc,
  AVG(`TEMPERATURE`) AS avg_temperature,
  AVG(`POWER`) AS avg_power,
  AVG(`LAB_REP_TIME`) AS avg_lab_rep_time,
  AVG(`C`) AS avg_c,
  AVG(`SI`) AS avg_si,
  AVG(`MN`) AS avg_mn,
  AVG(`P`) AS avg_p,
  AVG(`S`) AS avg_s,
  AVG(`CU`) AS avg_cu,
  AVG(`CR`) AS avg_cr,
  AVG(`NI`) AS avg_ni,
  AVG(`N`) AS avg_n,
  AVG(`TIME_UTLN_PRCNT`) AS avg_time_utln_prcnt,
  AVG(`TOP_COKE`) AS avg_top_coke,
  AVG(`OPEN_C`) AS avg_open_c,
  AVG(`TAP_C`) AS avg_tap_c,
  AVG(`IT_KG`) AS avg_it_kg,
  AVG(`BUCKET_NO`) AS avg_bucket_no,
  AVG(`STATIC_WT`) AS avg_static_wt,
  AVG(`LIME`) AS avg_lime,
  AVG(`LIME2`) AS avg_lime2,
  AVG(`O2SIDE1`) AS avg_o2side1,
  AVG(`O2SIDE2`) AS avg_o2side2,
  AVG(`O2SIDE3`) AS avg_o2side3,
  AVG(`SPINNING`) AS avg_spinning,
  AVG(`RAMMING1`) AS avg_ramming1,
  AVG(`RAMMING2`) AS avg_ramming2,
  AVG(`PREV_TAP_TIME`) AS avg_prev_tap_time,
  AVG(`TAP_DURATION`) AS avg_tap_duration,
  AVG(`Pour_Back_Metal`) AS avg_pour_back_metal,
  AVG(`LM_WT`) AS avg_lm_wt,
  AVG(`Production (MT)`) AS avg_production_mt
FROM data_set;



###############     median  ##################
use project_201;
-- Median for COKE_REQ
SELECT COKE_REQ AS median_COKE_REQ
FROM (
    SELECT COKE_REQ, 
           ROW_NUMBER() OVER (ORDER BY COKE_REQ) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for BSM
SELECT BSM AS median_BSM
FROM (
    SELECT BSM, 
           ROW_NUMBER() OVER (ORDER BY BSM) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for INJ1_QTY (Coke Injection Qty)
SELECT `INJ1_QTY` AS median_INJ1_QTY
FROM (
    SELECT `INJ1_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `INJ1_QTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for INJ1_QTY (Coke Injection Qty)
SELECT `INJ2_QTY` AS median_INJ2_QTY
FROM (
    SELECT `INJ2_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `INJ2_QTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for MSTB
SELECT MSTB AS median_MSTB
FROM (
    SELECT MSTB, 
           ROW_NUMBER() OVER (ORDER BY MSTB) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SKULL
SELECT SKULL AS median_SKULL
FROM (
    SELECT SKULL, 
           ROW_NUMBER() OVER (ORDER BY SKULL) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SHRAD
SELECT SHRAD AS median_SHRAD
FROM (
    SELECT SHRAD, 
           ROW_NUMBER() OVER (ORDER BY SHRAD) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for REMET
SELECT REMET AS median_REMET
FROM (
    SELECT REMET, 
           ROW_NUMBER() OVER (ORDER BY REMET) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for BP
SELECT BP AS median_BP
FROM (
    SELECT BP, 
           ROW_NUMBER() OVER (ORDER BY BP) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for HBI
SELECT HBI AS median_HBI
FROM (
    SELECT HBI, 
           ROW_NUMBER() OVER (ORDER BY HBI) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for OTHERS
SELECT OTHERS AS median_OTHERS
FROM (
    SELECT OTHERS, 
           ROW_NUMBER() OVER (ORDER BY OTHERS) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SCRAP_QTY (MT)
SELECT `SCRAP_QTY (MT)` AS median_SCRAP_QTY
FROM (
    SELECT `SCRAP_QTY (MT)`, 
           ROW_NUMBER() OVER (ORDER BY `SCRAP_QTY (MT)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for PIGIRON
SELECT PIGIRON AS median_PIGIRON
FROM (
    SELECT PIGIRON, 
           ROW_NUMBER() OVER (ORDER BY PIGIRON) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DRI1_QTY (MT) (Lumps)
SELECT `DRI1_QTY (MT) (Lumps)` AS median_DRI1_QTY
FROM (
    SELECT `DRI1_QTY (MT) (Lumps)`, 
           ROW_NUMBER() OVER (ORDER BY `DRI1_QTY (MT) (Lumps)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TOT_DRI_QTY
SELECT TOT_DRI_QTY AS median_TOT_DRI_QTY
FROM (
    SELECT TOT_DRI_QTY, 
           ROW_NUMBER() OVER (ORDER BY TOT_DRI_QTY) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for HOT_METAL (HOT Metal from MBF)
SELECT `HOT_METAL (HOT Metal from MBF)` AS median_HOT_METAL
FROM (
    SELECT `HOT_METAL (HOT Metal from MBF)`, 
           ROW_NUMBER() OVER (ORDER BY `HOT_METAL (HOT Metal from MBF)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for Total Charge
SELECT `Total Charge` AS median_Total_Charge
FROM (
    SELECT `Total Charge`, 
           ROW_NUMBER() OVER (ORDER BY `Total Charge`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for Hot_Heel (Left Over Liquid metal in EAF)
SELECT `Hot_Heel (Left Over Liquid metal in EAF)` AS median_Hot_Heel
FROM (
    SELECT `Hot_Heel (Left Over Liquid metal in EAF)`, 
           ROW_NUMBER() OVER (ORDER BY `Hot_Heel (Left Over Liquid metal in EAF)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOLO
SELECT DOLO AS median_DOLO
FROM (
    SELECT DOLO, 
           ROW_NUMBER() OVER (ORDER BY DOLO) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOLO1_EMPTY
SELECT DOLO1_EMPTY AS median_DOLO1_EMPTY
FROM (
    SELECT DOLO1_EMPTY, 
           ROW_NUMBER() OVER (ORDER BY DOLO1_EMPTY) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TOT_LIME_QTY
SELECT TOT_LIME_QTY AS median_TOT_LIME_QTY
FROM (
    SELECT TOT_LIME_QTY, 
           ROW_NUMBER() OVER (ORDER BY TOT_LIME_QTY) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TAP_TEMP (Tappnig Temperature)
SELECT `TAP_TEMP (Tappnig Temperature)` AS median_TAP_TEMP
FROM (
    SELECT `TAP_TEMP (Tappnig Temperature)`, 
           ROW_NUMBER() OVER (ORDER BY `TAP_TEMP (Tappnig Temperature)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for O2REQ
SELECT `O2REQ` AS median_O2REQ
FROM (
    SELECT `O2REQ`, 
           ROW_NUMBER() OVER (ORDER BY `O2REQ`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for O2ACT
SELECT `O2ACT` AS median_O2ACT
FROM (
    SELECT `O2ACT`, 
           ROW_NUMBER() OVER (ORDER BY `O2ACT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for ENERGY (Energy Consumption)
SELECT `ENERGY (Energy Consumption)` AS median_ENERGY
FROM (
    SELECT `ENERGY (Energy Consumption)`, 
           ROW_NUMBER() OVER (ORDER BY `ENERGY (Energy Consumption)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for KWH_PER_TON (Energy Consumption Per Ton)
SELECT `KWH_PER_TON (Energy Consumption Per Ton)` AS median_KWH_PER_TON
FROM (
    SELECT `KWH_PER_TON (Energy Consumption Per Ton)`, 
           ROW_NUMBER() OVER (ORDER BY `KWH_PER_TON (Energy Consumption Per Ton)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for KWH_PER_MIN
SELECT `KWH_PER_MIN` AS median_KWH_PER_MIN
FROM (
    SELECT `KWH_PER_MIN`, 
           ROW_NUMBER() OVER (ORDER BY `KWH_PER_MIN`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for MELT_TIME (Melting Time)
SELECT `MELT_TIME (Melting Time)` AS median_MELT_TIME
FROM (
    SELECT `MELT_TIME (Melting Time)`, 
           ROW_NUMBER() OVER (ORDER BY `MELT_TIME (Melting Time)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TA_TIME (Turn Around Time)
SELECT `TA_TIME (Turn Around Time)` AS median_TA_TIME
FROM (
    SELECT `TA_TIME (Turn Around Time)`, 
           ROW_NUMBER() OVER (ORDER BY `TA_TIME (Turn Around Time)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TT_TIME (Total Cycle Time Including Breakdown)
SELECT `TT_TIME (Total Cycle Time Including Breakdown)` AS median_TT_TIME
FROM (
    SELECT `TT_TIME (Total Cycle Time Including Breakdown)`, 
           ROW_NUMBER() OVER (ORDER BY `TT_TIME (Total Cycle Time Including Breakdown)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for POW_ON_TIME
SELECT `POW_ON_TIME` AS median_POW_ON_TIME
FROM (
    SELECT `POW_ON_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `POW_ON_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;



-- Median for ARCING_TIME
SELECT `ARCING_TIME` AS median_ARCING_TIME
FROM (
    SELECT `ARCING_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `ARCING_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOWN_TIME
SELECT `DOWN_TIME` AS median_DOWN_TIME
FROM (
    SELECT `DOWN_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `DOWN_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E1_CUR (Electrode 1 Current)
SELECT `E1_CUR (Electrode 1 Current)` AS median_E1_CUR
FROM (
    SELECT `E1_CUR (Electrode 1 Current)`, 
           ROW_NUMBER() OVER (ORDER BY `E1_CUR (Electrode 1 Current)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E2_CUR (Electrode 2 Current)
SELECT `E2_CUR (Electrode 2 Current)` AS median_E2_CUR
FROM (
    SELECT `E2_CUR (Electrode 2 Current)`, 
           ROW_NUMBER() OVER (ORDER BY `E2_CUR (Electrode 2 Current)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E3_CUR (Electrode 3 Current)
SELECT `E3_CUR (Electrode 3 Current)` AS median_E3_CUR
FROM (
    SELECT `E3_CUR (Electrode 3 Current)`, 
           ROW_NUMBER() OVER (ORDER BY `E3_CUR (Electrode 3 Current)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SPOUT (Bottom Refractory Temperature)
SELECT `SPOUT (Bottom Refractory Temperature)` AS median_SPOUT
FROM (
    SELECT `SPOUT (Bottom Refractory Temperature)`, 
           ROW_NUMBER() OVER (ORDER BY `SPOUT (Bottom Refractory Temperature)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOLOMIT
SELECT `DOLOMIT` AS median_DOLOMIT
FROM (
    SELECT `DOLOMIT`, 
           ROW_NUMBER() OVER (ORDER BY `DOLOMIT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for CPC
SELECT `CPC` AS median_CPC
FROM (
    SELECT `CPC`, 
           ROW_NUMBER() OVER (ORDER BY `CPC`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TEMPERATURE
SELECT `TEMPERATURE` AS median_TEMPERATURE
FROM (
    SELECT `TEMPERATURE`, 
           ROW_NUMBER() OVER (ORDER BY `TEMPERATURE`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for POWER
SELECT `POWER` AS median_POWER
FROM (
    SELECT `POWER`, 
           ROW_NUMBER() OVER (ORDER BY `POWER`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for LAB_REP_TIME
SELECT `LAB_REP_TIME` AS median_LAB_REP_TIME
FROM (
    SELECT `LAB_REP_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `LAB_REP_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for C
SELECT `C` AS median_C
FROM (
    SELECT `C`, 
           ROW_NUMBER() OVER (ORDER BY `C`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SI
SELECT `SI` AS median_SI
FROM (
    SELECT `SI`, 
           ROW_NUMBER() OVER (ORDER BY `SI`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for MN
SELECT `MN` AS median_MN
FROM (
    SELECT `MN`, 
           ROW_NUMBER() OVER (ORDER BY `MN`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for P
SELECT `P` AS median_P
FROM (
    SELECT `P`, 
           ROW_NUMBER() OVER (ORDER BY `P`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for S
SELECT `S` AS median_S
FROM (
    SELECT `S`, 
           ROW_NUMBER() OVER (ORDER BY `S`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for CU
SELECT `CU` AS median_CU
FROM (
    SELECT `CU`, 
           ROW_NUMBER() OVER (ORDER BY `CU`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for CR
SELECT `CR` AS median_CR
FROM (
    SELECT `CR`, 
           ROW_NUMBER() OVER (ORDER BY `CR`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for NI
SELECT `NI` AS median_NI
FROM (
    SELECT `NI`, 
           ROW_NUMBER() OVER (ORDER BY `NI`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for N
SELECT `N` AS median_N
FROM (
    SELECT `N`, 
           ROW_NUMBER() OVER (ORDER BY `N`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TIME_UTLN_PRCNT
SELECT `TIME_UTLN_PRCNT` AS median_TIME_UTLN_PRCNT
FROM (
    SELECT `TIME_UTLN_PRCNT`, 
           ROW_NUMBER() OVER (ORDER BY `TIME_UTLN_PRCNT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TOP_COKE
SELECT `TOP_COKE` AS median_TOP_COKE
FROM (
    SELECT `TOP_COKE`, 
           ROW_NUMBER() OVER (ORDER BY `TOP_COKE`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for OPEN_C
SELECT `OPEN_C` AS median_OPEN_C
FROM (
    SELECT `OPEN_C`, 
           ROW_NUMBER() OVER (ORDER BY `OPEN_C`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TAP_C
SELECT `TAP_C` AS median_TAP_C
FROM (
    SELECT `TAP_C`, 
           ROW_NUMBER() OVER (ORDER BY `TAP_C`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for IT_KG
SELECT `IT_KG` AS median_IT_KG
FROM (
    SELECT `IT_KG`, 
           ROW_NUMBER() OVER (ORDER BY `IT_KG`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for BUCKET_NO
SELECT `BUCKET_NO` AS median_BUCKET_NO
FROM (
    SELECT `BUCKET_NO`, 
           ROW_NUMBER() OVER (ORDER BY `BUCKET_NO`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for STATIC_WT
SELECT `STATIC_WT` AS median_STATIC_WT
FROM (
    SELECT `STATIC_WT`, 
           ROW_NUMBER() OVER (ORDER BY `STATIC_WT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for LIME
SELECT `LIME` AS median_LIME
FROM (
    SELECT `LIME`, 
           ROW_NUMBER() OVER (ORDER BY `LIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for LIME2
SELECT `LIME2` AS median_LIME2
FROM (
    SELECT `LIME2`, 
           ROW_NUMBER() OVER (ORDER BY `LIME2`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for O2SIDE1
SELECT `O2SIDE1` AS median_O2SIDE1
FROM (
    SELECT `O2SIDE1`, 
           ROW_NUMBER() OVER (ORDER BY `O2SIDE1`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for O2SIDE2
SELECT `O2SIDE2` AS median_O2SIDE2
FROM (
    SELECT `O2SIDE2`, 
           ROW_NUMBER() OVER (ORDER BY `O2SIDE2`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for O2SIDE3
SELECT `O2SIDE3` AS median_O2SIDE3
FROM (
    SELECT `O2SIDE3`, 
           ROW_NUMBER() OVER (ORDER BY `O2SIDE3`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SPINNING
SELECT `SPINNING` AS median_SPINNING
FROM (
    SELECT `SPINNING`, 
           ROW_NUMBER() OVER (ORDER BY `SPINNING`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for RAMMING1
SELECT `RAMMING1` AS median_RAMMING1
FROM (
    SELECT `RAMMING1`, 
           ROW_NUMBER() OVER (ORDER BY `RAMMING1`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for RAMMING2
SELECT `RAMMING2` AS median_RAMMING2
FROM (
    SELECT `RAMMING2`, 
           ROW_NUMBER() OVER (ORDER BY `RAMMING2`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for PREV_TAP_TIME
SELECT `PREV_TAP_TIME` AS median_PREV_TAP_TIME
FROM (
    SELECT `PREV_TAP_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `PREV_TAP_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for TAP_DURATION
SELECT `TAP_DURATION` AS median_TAP_DURATION
FROM (
    SELECT `TAP_DURATION`, 
           ROW_NUMBER() OVER (ORDER BY `TAP_DURATION`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for Pour_Back_Metal
SELECT `Pour_Back_Metal` AS median_Pour_Back_Metal
FROM (
    SELECT `Pour_Back_Metal`, 
           ROW_NUMBER() OVER (ORDER BY `Pour_Back_Metal`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for LM_WT
SELECT `LM_WT` AS median_LM_WT
FROM (
    SELECT `LM_WT`, 
           ROW_NUMBER() OVER (ORDER BY `LM_WT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);

-- Median for Production (MT)
SELECT `Production (MT)` AS median_Production_MT
FROM (
    SELECT `Production (MT)`, 
           ROW_NUMBER() OVER (ORDER BY `Production (MT)`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num IN ((total_count + 1) / 2, (total_count + 2) / 2);



############## MODE #############
SELECT
  `COKE_REQ` AS Mode_COKE_REQ,
  `INJ1_QTY` AS Mode_inj1,
  `INJ2_QTY` AS Mode_inj2,
  `BSM` AS Mode_BSM,
  `TP` AS Mode_TP,
  `MSTB` AS Mode_MSTB,
  `SKULL` AS Mode_SKULL,
  `SHRAD` AS Mode_SHRAD,
  `REMET` AS Mode_REMET,
  `BP` AS Mode_BP,
  `HBI` AS Mode_HBI,
  `OTHERS` AS Mode_OTHERS,
  `SCRAP_QTY (MT)` AS Mode_SCRAP_QTY_MT,
  `PIGIRON` AS Mode_PIGIRON,
  `DRI1_QTY (MT) (Lumps)` AS Mode_DRI1_QTY_MT_Lumps,
  `TOT_DRI_QTY` AS Mode_TOT_DRI_QTY,
  `HOT_METAL (HOT Metal from MBF)` AS Mode_HOT_METAL,
  `Total Charge` AS Mode_Total_Charge,
  `Hot_Heel (Left Over Liquid metal in EAF)` AS Mode_Hot_Heel,
  `DOLO` AS Mode_DOLO,
  `DOLO1_EMPTY` AS Mode_DOLO1_EMPTY,
  `TOT_LIME_QTY` AS Mode_TOT_LIME_QTY,
  `TAP_TEMP (Tappnig Temperature)` AS Mode_TAP_TEMP,
  `O2REQ` AS Mode_O2REQ,
  `O2ACT` AS Mode_O2ACT,
  `ENERGY (Energy Consumption)` AS Mode_ENERGY,
  `KWH_PER_TON (Energy Consumption Per Ton)` AS Mode_KWH_PER_TON,
  `KWH_PER_MIN` AS Mode_KWH_PER_MIN,
  `MELT_TIME (Melting Time)` AS Mode_MELT_TIME,
  `TA_TIME (Turn Around Time)` AS Mode_TA_TIME,
  `TT_TIME (Total Cycle Time Including Breakdown)` AS Mode_TT_TIME,
  `POW_ON_TIME` AS Mode_POW_ON_TIME,
  `TAPPING_TIME` AS Mode_TAPPING_TIME,
  `ARCING_TIME` AS Mode_ARCING_TIME,
  `DOWN_TIME` AS Mode_DOWN_TIME,
  `E1_CUR (Electrode 1 Current)` AS Mode_E1_CUR,
  `E2_CUR (Electrode 2 Current)` AS Mode_E2_CUR,
  `E3_CUR (Electrode 3 Current)` AS Mode_E3_CUR,
  `SPOUT (Bottom Refractory Temperature)` AS Mode_SPOUT,
  `DOLOMIT` AS Mode_DOLOMIT,
  `CPC` AS Mode_CPC,
  `TEMPERATURE` AS Mode_TEMPERATURE,
  `POWER` AS Mode_POWER,
  `LAB_REP_TIME` AS Mode_LAB_REP_TIME,
  `C` AS Mode_C,
  `SI` AS Mode_SI,
  `MN` AS Mode_MN,
  `P` AS Mode_P,
  `S` AS Mode_S,
  `CU` AS Mode_CU,
  `CR` AS Mode_CR,
  `NI` AS Mode_NI,
  `N` AS Mode_N,
  `TIME_UTLN_PRCNT` AS Mode_TIME_UTLN_PRCNT,
  `TOP_COKE` AS Mode_TOP_COKE,
  `OPEN_C` AS Mode_OPEN_C,
  `TAP_C` AS Mode_TAP_C,
  `IT_KG` AS Mode_IT_KG,
  `BUCKET_NO` AS Mode_BUCKET_NO,
  `STATIC_WT` AS Mode_STATIC_WT,
  `LIME` AS Mode_LIME,
  `LIME2` AS Mode_LIME2,
  `O2SIDE1` AS Mode_O2SIDE1,
  `O2SIDE2` AS Mode_O2SIDE2,
  `O2SIDE3` AS Mode_O2SIDE3,
  `SPINNING` AS Mode_SPINNING,
  `RAMMING1` AS Mode_RAMMING1,
  `RAMMING2` AS Mode_RAMMING2,
  `PREV_TAP_TIME` AS Mode_PREV,
  `PREV_TAP_TIME` AS Mode_PREV_TAP_TIME,
  `TAP_DURATION` AS Mode_TAP_DURATION,
  `Pour_Back_Metal` AS Mode_Pour_Back_Metal,
  `LM_WT` AS Mode_LM_WT,
  `Production (MT)` AS Mode_Production_MT
FROM data_set
GROUP BY `COKE_REQ`,`INJ1_QTY`,`INJ2_QTY`, `BSM`, `TP`, `MSTB`, `SKULL`, `SHRAD`, `REMET`, `BP`, 
         `HBI`, `OTHERS`, `SCRAP_QTY (MT)`, `PIGIRON`, `DRI1_QTY (MT) (Lumps)`, 
         `TOT_DRI_QTY`, `HOT_METAL (HOT Metal from MBF)`, `Total Charge`, 
         `Hot_Heel (Left Over Liquid metal in EAF)`, `DOLO`, `DOLO1_EMPTY`, 
         `TOT_LIME_QTY`, `TAP_TEMP (Tappnig Temperature)`, `O2REQ`, `O2ACT`, 
         `ENERGY (Energy Consumption)`, `KWH_PER_TON (Energy Consumption Per Ton)`, 
         `KWH_PER_MIN`, `MELT_TIME (Melting Time)`, `TA_TIME (Turn Around Time)`, 
         `TT_TIME (Total Cycle Time Including Breakdown)`, `POW_ON_TIME`, 
         `TAPPING_TIME`, `ARCING_TIME`, `DOWN_TIME`, `E1_CUR (Electrode 1 Current)`, 
         `E2_CUR (Electrode 2 Current)`, `E3_CUR (Electrode 3 Current)`, 
         `SPOUT (Bottom Refractory Temperature)`, `DOLOMIT`, `CPC`, `TEMPERATURE`, 
         `POWER`, `LAB_REP_TIME`, `C`, `SI`, `MN`, `P`, `S`, `CU`, `CR`, `NI`, `N`, 
         `TIME_UTLN_PRCNT`, `TOP_COKE`, `OPEN_C`, `TAP_C`, `IT_KG`, `BUCKET_NO`, 
         `STATIC_WT`, `LIME`, `LIME2`, `O2SIDE1`, `O2SIDE2`, `O2SIDE3`, `SPINNING`, 
         `RAMMING1`, `RAMMING2`, `PREV_TAP_TIME`, `TAP_DURATION`, `Pour_Back_Metal`, 
         `LM_WT`, `Production (MT)`
ORDER BY COUNT(*) DESC
LIMIT 1;



 #### 2nd movement decision #####
 ####### Varience , Standard deviation & Range ######
SELECT
  VARIANCE(`COKE_REQ`) AS COKE_REQ_variance,
  VARIANCE(`INJ1_QTY`) AS INJ1_QTY_variance,
  VARIANCE(`INJ2_QTY`) AS INJ2_QTY_variance,
  VARIANCE(`BSM`) AS BSM_variance,
  VARIANCE(`TP`) AS TP_variance,
  VARIANCE(`MSTB`) AS MSTB_variance,
  VARIANCE(`SKULL`) AS SKULL_variance,
  VARIANCE(`SHRAD`) AS SHRAD_variance,
  VARIANCE(`REMET`) AS REMET_variance,
  VARIANCE(`BP`) AS BP_variance,
  VARIANCE(`HBI`) AS HBI_variance,
  VARIANCE(`OTHERS`) AS OTHERS_variance,
  VARIANCE(`SCRAP_QTY (MT)`) AS SCRAP_QTY_MT_variance,
  VARIANCE(`PIGIRON`) AS PIGIRON_variance,
  VARIANCE(`DRI1_QTY (MT) (Lumps)`) AS DRI1_QTY_MT_Lumps_variance,
  VARIANCE(`TOT_DRI_QTY`) AS TOT_DRI_QTY_variance,
  VARIANCE(`HOT_METAL (HOT Metal from MBF)`) AS HOT_METAL_variance,
  VARIANCE(`Total Charge`) AS Total_Charge_variance,
  VARIANCE(`Hot_Heel (Left Over Liquid metal in EAF)`) AS Hot_Heel_variance,
  VARIANCE(`DOLO`) AS DOLO_variance,
  VARIANCE(`DOLO1_EMPTY`) AS DOLO1_EMPTY_variance,
  VARIANCE(`TOT_LIME_QTY`) AS TOT_LIME_QTY_variance,
  VARIANCE(`TAP_TEMP (Tappnig Temperature)`) AS TAP_TEMP_variance,
  VARIANCE(`O2REQ`) AS O2REQ_variance,
  VARIANCE(`O2ACT`) AS O2ACT_variance,
  VARIANCE(`ENERGY (Energy Consumption)`) AS ENERGY_variance,
  VARIANCE(`KWH_PER_TON (Energy Consumption Per Ton)`) AS KWH_PER_TON_variance,
  VARIANCE(`KWH_PER_MIN`) AS KWH_PER_MIN_variance,
  VARIANCE(`MELT_TIME (Melting Time)`) AS MELT_TIME_variance,
  VARIANCE(`TA_TIME (Turn Around Time)`) AS TA_TIME_variance,
  VARIANCE(`TT_TIME (Total Cycle Time Including Breakdown)`) AS TT_TIME_variance,
  VARIANCE(`POW_ON_TIME`) AS POW_ON_TIME_variance,
  VARIANCE(`TAPPING_TIME`) AS TAPPING_TIME_variance,
  VARIANCE(`ARCING_TIME`) AS ARCING_TIME_variance,
  VARIANCE(`DOWN_TIME`) AS DOWN_TIME_variance,
  VARIANCE(`E1_CUR (Electrode 1 Current)`) AS E1_CUR_variance,
  VARIANCE(`E2_CUR (Electrode 2 Current)`) AS E2_CUR_variance,
  VARIANCE(`E3_CUR (Electrode 3 Current)`) AS E3_CUR_variance,
  VARIANCE(`SPOUT (Bottom Refractory Temperature)`) AS SPOUT_variance,
  VARIANCE(`DOLOMIT`) AS DOLOMIT_variance,
  VARIANCE(`CPC`) AS CPC_variance,
  VARIANCE(`TEMPERATURE`) AS TEMPERATURE_variance,
  VARIANCE(`POWER`) AS POWER_variance,
  VARIANCE(`LAB_REP_TIME`) AS LAB_REP_TIME_variance,
  VARIANCE(`C`) AS C_variance,
  VARIANCE(`SI`) AS SI_variance,
  VARIANCE(`MN`) AS MN_variance,
  VARIANCE(`P`) AS P_variance,
  VARIANCE(`S`) AS S_variance,
  VARIANCE(`CU`) AS CU_variance,
  VARIANCE(`CR`) AS CR_variance,
  VARIANCE(`NI`) AS NI_variance,
  VARIANCE(`N`) AS N_variance,
  VARIANCE(`TIME_UTLN_PRCNT`) AS TIME_UTLN_PRCNT_variance,
  VARIANCE(`TOP_COKE`) AS TOP_COKE_variance,
  VARIANCE(`OPEN_C`) AS OPEN_C_variance,
  VARIANCE(`TAP_C`) AS TAP_C_variance,
  VARIANCE(`IT_KG`) AS IT_KG_variance,
  VARIANCE(`BUCKET_NO`) AS BUCKET_NO_variance,
  VARIANCE(`STATIC_WT`) AS Static_Weight_variance,
  VARIANCE(`LIME`) AS Lime_variance,
  VARIANCE(`LIME2`) AS Lime2_variance,
  VARIANCE(`O2SIDE1`) AS O2Side1_variance,
  VARIANCE(`O2SIDE2`) AS O2Side2_variance,
  VARIANCE(`O2SIDE3`) AS O2Side3_variance,
  VARIANCE(`SPINNING`) AS Spinning_variance,
  VARIANCE(`RAMMING1`) AS Ramming1_variance,
  VARIANCE(`RAMMING2`) AS Ramming2_variance,
  VARIANCE(`PREV_TAP_TIME`) AS Prev_Tap_Time_variance,
  VARIANCE(`TAP_DURATION`) AS Tap_Duration_variance,
  VARIANCE(`Pour_Back_Metal`) AS Pour_Back_Metal_variance,
  VARIANCE(`LM_WT`) AS LM_Weight_variance,
  VARIANCE(`Production (MT)`) AS Production_MT_variance
FROM data_set;



SELECT
  STD(`COKE_REQ`) AS stddev_COKE_REQ,
  STD(`INJ1_QTY`) AS stddev_INJ1_QTY,
  STD(`INJ2_QTY`) AS stddev_INJ1_QTY,
  STD(`BSM`) AS stddev_BSM,
  STD(`TP`) AS stddev_TP,
  STD(`MSTB`) AS stddev_MSTB,
  STD(`SKULL`) AS stddev_SKULL,
  STD(`SHRAD`) AS stddev_SHRAD,
  STD(`REMET`) AS stddev_REMET,
  STD(`BP`) AS stddev_BP,
  STD(`HBI`) AS stddev_HBI,
  STD(`OTHERS`) AS stddev_OTHERS,
  STD(`SCRAP_QTY (MT)`) AS stddev_SCRAP_QTY_MT,
  STD(`PIGIRON`) AS stddev_PIGIRON,
  STD(`DRI1_QTY (MT) (Lumps)`) AS stddev_DRI1_QTY_MT_Lumps,
  STD(`TOT_DRI_QTY`) AS stddev_TOT_DRI_QTY,
  STD(`HOT_METAL (HOT Metal from MBF)`) AS stddev_HOT_METAL,
  STD(`Total Charge`) AS stddev_Total_Charge,
  STD(`Hot_Heel (Left Over Liquid metal in EAF)`) AS stddev_Hot_Heel,
  STD(`DOLO`) AS stddev_DOLO,
  STD(`DOLO1_EMPTY`) AS stddev_DOLO1_EMPTY,
  STD(`TOT_LIME_QTY`) AS stddev_TOT_LIME_QTY,
  STD(`TAP_TEMP (Tappnig Temperature)`) AS stddev_TAP_TEMP,
  STD(`O2REQ`) AS stddev_O2REQ,
  STD(`O2ACT`) AS stddev_O2ACT,
  STD(`ENERGY (Energy Consumption)`) AS stddev_ENERGY,
  STD(`KWH_PER_TON (Energy Consumption Per Ton)`) AS stddev_KWH_PER_TON,
  STD(`KWH_PER_MIN`) AS stddev_KWH_PER_MIN,
  STD(`MELT_TIME (Melting Time)`) AS stddev_MELT_TIME,
  STD(`TA_TIME (Turn Around Time)`) AS stddev_TA_TIME,
  STD(`TT_TIME (Total Cycle Time Including Breakdown)`) AS stddev_TT_TIME,
  STD(`POW_ON_TIME`) AS stddev_POW_ON_TIME,
  STD(`TAPPING_TIME`) AS stddev_TAPPING_TIME,
  STD(`ARCING_TIME`) AS stddev_ARCING_TIME,
  STD(`DOWN_TIME`) AS stddev_DOWN_TIME,
  STD(`E1_CUR (Electrode 1 Current)`) AS stddev_E1_CUR,
  STD(`E2_CUR (Electrode 2 Current)`) AS stddev_E2_CUR,
  STD(`E3_CUR (Electrode 3 Current)`) AS stddev_E3_CUR,
  STD(`SPOUT (Bottom Refractory Temperature)`) AS stddev_SPOUT,
  STD(`DOLOMIT`) AS stddev_DOLOMIT,
  STD(`CPC`) AS stddev_CPC,
  STD(`TEMPERATURE`) AS stddev_TEMPERATURE,
  STD(`POWER`) AS stddev_POWER,
  STD(`LAB_REP_TIME`) AS stddev_LAB_REP_TIME,
  STD(`C`) AS stddev_C,
  STD(`SI`) AS stddev_SI,
  STD(`MN`) AS stddev_MN,
  STD(`P`) AS stddev_P,
  STD(`S`) AS stddev_S,
  STD(`CU`) AS stddev_CU,
  STD(`CR`) AS stddev_CR,
  STD(`NI`) AS stddev_NI,
  STD(`N`) AS stddev_N,
  STD(`TIME_UTLN_PRCNT`) AS stddev_TIME_UTLN_PRCNT,
  STD(`TOP_COKE`) AS stddev_TOP_COKE,
  STD(`OPEN_C`) AS stddev_OPEN_C,
  STD(`TAP_C`) AS stddev_TAP_C,
  STD(`IT_KG`) AS stddev_IT_KG,
  STD(`BUCKET_NO`) AS stddev_BUCKET_NO,
  STD(`STATIC_WT`) AS stddev_Static_Weight,
  STD(`LIME`) AS stddev_Lime,
  STD(`LIME2`) AS stddev_Lime2,
  STD(`O2SIDE1`) AS stddev_O2Side1,
  STD(`O2SIDE2`) AS stddev_O2Side2,
  STD(`O2SIDE3`) AS stddev_O2Side3,
  STD(`SPINNING`) AS stddev_Spinning,
  STD(`RAMMING1`) AS stddev_Ramming1,
  STD(`RAMMING2`) AS stddev_Ramming2,
  STD(`PREV_TAP_TIME`) AS stddev_Prev_Tap_Time,
  STD(`TAP_DURATION`) AS stddev_Tap_Duration,
  STD(`Pour_Back_Metal`) AS stddev_Pour_Back_Metal,
  STD(`LM_WT`) AS stddev_LM_Weight,
  STD(`Production (MT)`) AS stddev_Production_MT
FROM data_set;


SELECT
  (MAX(`COKE_REQ`) - MIN(`COKE_REQ`)) AS Range_COKE_REQ,
  (MAX(`BSM`) - MIN(`BSM`)) AS Range_BSM,
  (MAX(`TP`) - MIN(`TP`)) AS Range_TP,
  (MAX(`MSTB`) - MIN(`MSTB`)) AS Range_MSTB,
  (MAX(`SKULL`) - MIN(`SKULL`)) AS Range_SKULL,
  (MAX(`SHRAD`) - MIN(`SHRAD`)) AS Range_SHRAD,
  (MAX(`REMET`) - MIN(`REMET`)) AS Range_REMET,
  (MAX(`BP`) - MIN(`BP`)) AS Range_BP,
  (MAX(`HBI`) - MIN(`HBI`)) AS Range_HBI,
  (MAX(`OTHERS`) - MIN(`OTHERS`)) AS Range_OTHERS,
  (MAX(`SCRAP_QTY (MT)`) - MIN(`SCRAP_QTY (MT)`)) AS Range_SCRAP_QTY_MT,
  (MAX(`PIGIRON`) - MIN(`PIGIRON`)) AS Range_PIGIRON,
  (MAX(`DRI1_QTY (MT) (Lumps)`) - MIN(`DRI1_QTY (MT) (Lumps)`)) AS Range_DRI1_QTY_MT_Lumps,
  (MAX(`TOT_DRI_QTY`) - MIN(`TOT_DRI_QTY`)) AS Range_TOT_DRI_QTY,
  (MAX(`HOT_METAL (HOT Metal from MBF)`) - MIN(`HOT_METAL (HOT Metal from MBF)`)) AS Range_HOT_METAL,
  (MAX(`Total Charge`) - MIN(`Total Charge`)) AS Range_Total_Charge,
  (MAX(`Hot_Heel (Left Over Liquid metal in EAF)`) - MIN(`Hot_Heel (Left Over Liquid metal in EAF)`)) AS Range_Hot_Heel,
  (MAX(`DOLO`) - MIN(`DOLO`)) AS Range_DOLO,
  (MAX(`DOLO1_EMPTY`) - MIN(`DOLO1_EMPTY`)) AS Range_DOLO1_EMPTY,
  (MAX(`TOT_LIME_QTY`) - MIN(`TOT_LIME_QTY`)) AS Range_TOT_LIME_QTY,
  (MAX(`TAP_TEMP (Tappnig Temperature)`) - MIN(`TAP_TEMP (Tappnig Temperature)`)) AS Range_TAP_TEMP,
  (MAX(`O2REQ`) - MIN(`O2REQ`)) AS Range_O2REQ,
  (MAX(`O2ACT`) - MIN(`O2ACT`)) AS Range_O2ACT,
  (MAX(`ENERGY (Energy Consumption)`) - MIN(`ENERGY (Energy Consumption)`)) AS Range_ENERGY,
  (MAX(`KWH_PER_TON (Energy Consumption Per Ton)`) - MIN(`KWH_PER_TON (Energy Consumption Per Ton)`)) AS Range_KWH_PER_TON,
  (MAX(`KWH_PER_MIN`) - MIN(`KWH_PER_MIN`)) AS Range_KWH_PER_MIN,
  (MAX(`MELT_TIME (Melting Time)`) - MIN(`MELT_TIME (Melting Time)`)) AS Range_MELT_TIME,
  (MAX(`TA_TIME (Turn Around Time)`) - MIN(`TA_TIME (Turn Around Time)`)) AS Range_TA_TIME,
  (MAX(`TT_TIME (Total Cycle Time Including Breakdown)`) - MIN(`TT_TIME (Total Cycle Time Including Breakdown)`)) AS Range_TT_TIME,
  (MAX(`POW_ON_TIME`) - MIN(`POW_ON_TIME`)) AS Range_POW_ON_TIME,
  (MAX(`TAPPING_TIME`) - MIN(`TAPPING_TIME`)) AS Range_TAPPING_TIME,
  (MAX(`ARCING_TIME`) - MIN(`ARCING_TIME`)) AS Range_ARCING_TIME,
  (MAX(`DOWN_TIME`) - MIN(`DOWN_TIME`)) AS Range_DOWN_TIME,
  (MAX(`E1_CUR (Electrode 1 Current)`) - MIN(`E1_CUR (Electrode 1 Current)`)) AS Range_E1_CUR,
  (MAX(`E2_CUR (Electrode 2 Current)`) - MIN(`E2_CUR (Electrode 2 Current)`)) AS Range_E2_CUR,
  (MAX(`E3_CUR (Electrode 3 Current)`) - MIN(`E3_CUR (Electrode 3 Current)`)) AS Range_E3_CUR,
  (MAX(`SPOUT (Bottom Refractory Temperature)`) - MIN(`SPOUT (Bottom Refractory Temperature)`)) AS Range_SPOUT,
  (MAX(`DOLOMIT`) - MIN(`DOLOMIT`)) AS Range_DOLOMIT,
  (MAX(`CPC`) - MIN(`CPC`)) AS Range_CPC,
  (MAX(`TEMPERATURE`) - MIN(`TEMPERATURE`)) AS Range_TEMPERATURE,
  (MAX(`POWER`) - MIN(`POWER`)) AS Range_POWER,
  (MAX(`LAB_REP_TIME`) - MIN(`LAB_REP_TIME`)) AS Range_LAB_REP_TIME,
  (MAX(`C`) - MIN(`C`)) AS Range_C,
  (MAX(`SI`) - MIN(`SI`)) AS Range_SI,
  (MAX(`MN`) - MIN(`MN`)) AS Range_MN,
  (MAX(`P`) - MIN(`P`)) AS Range_P,
  (MAX(`S`) - MIN(`S`)) AS Range_S,
  (MAX(`CU`) - MIN(`CU`)) AS Range_CU,
  (MAX(`CR`) - MIN(`CR`)) AS Range_CR,
  (MAX(`NI`) - MIN(`NI`)) AS Range_NI,
  (MAX(`N`) - MIN(`N`)) AS Range_N,
  (MAX(`TIME_UTLN_PRCNT`) - MIN(`TIME_UTLN_PRCNT`)) AS Range_TIME_UTLN_PRCNT,
  (MAX(`TOP_COKE`) - MIN(`TOP_COKE`)) AS Range_TOP_COKE,
  (MAX(`OPEN_C`) - MIN(`OPEN_C`)) AS Range_OPEN_C,
  (MAX(`TAP_C`) - MIN(`TAP_C`)) AS Range_TAP_C,
  (MAX(`IT_KG`) - MIN(`IT_KG`)) AS Range_IT_KG,
  (MAX(`BUCKET_NO`) - MIN(`BUCKET_NO`)) AS Range_BUCKET_NO,
  (MAX(`STATIC_WT`) - MIN(`STATIC_WT`)) AS Range_STATIC_WT,
  (MAX(`LIME`) - MIN(`LIME`)) AS Range_LIME,
  (MAX(`LIME2`) - MIN(`LIME2`)) AS Range_LIME2,
  (MAX(`O2SIDE1`) - MIN(`O2SIDE1`)) AS Range_O2SIDE1,
  (MAX(`O2SIDE2`) - MIN(`O2SIDE2`)) AS Range_O2SIDE2,
  (MAX(`O2SIDE3`) - MIN(`O2SIDE3`)) AS Range_O2SIDE3,
  (MAX(`SPINNING`) - MIN(`SPINNING`)) AS Range_SPINNING,
  (MAX(`RAMMING1`) - MIN(`RAMMING1`)) AS Range_RAMMING1,
  (MAX(`RAMMING2`) - MIN(`RAMMING2`)) AS Range_RAMMING2,
  (MAX(`PREV_TAP_TIME`) - MIN(`PREV_TAP_TIME`)) AS Range_PREV_TAP_TIME,
  (MAX(`TAP_DURATION`) - MIN(`TAP_DURATION`)) AS Range_TAP_DURATION,
  (MAX(`Pour_Back_Metal`) - MIN(`Pour_Back_Metal`)) AS Range_Pour_Back_Metal,
  (MAX(`LM_WT`) - MIN(`LM_WT`)) AS Range_LM_WT,
  (MAX(`Production (MT)`) - MIN(`Production (MT)`)) AS Range_Production_MT
FROM data_set;


 # Third  Moment Business Decisions 
#skwesness 
SELECT
    SUM(POWER((`COKE_REQ`) - (SELECT AVG(`COKE_REQ`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`COKE_REQ`) FROM data_set), 3)) AS skewness_COKE_REQ,
    
    SUM(POWER((`BSM`) - (SELECT AVG(`BSM`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`BSM`) FROM data_set), 3)) AS skewness_BSM,
    
    SUM(POWER((`TP`) - (SELECT AVG(`TP`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TP`) FROM data_set), 3)) AS skewness_TP,
    
    SUM(POWER((`MSTB`) - (SELECT AVG(`MSTB`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`MSTB`) FROM data_set), 3)) AS skewness_MSTB,
    
    SUM(POWER((`SKULL`) - (SELECT AVG(`SKULL`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SKULL`) FROM data_set), 3)) AS skewness_SKULL,
    
    SUM(POWER((`SHRAD`) - (SELECT AVG(`SHRAD`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SHRAD`) FROM data_set), 3)) AS skewness_SHRAD,
    
    SUM(POWER((`REMET`) - (SELECT AVG(`REMET`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`REMET`) FROM data_set), 3)) AS skewness_REMET,
    
    SUM(POWER((`BP`) - (SELECT AVG(`BP`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`BP`) FROM data_set), 3)) AS skewness_BP,
    
    SUM(POWER((`HBI`) - (SELECT AVG(`HBI`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`HBI`) FROM data_set), 3)) AS skewness_HBI,
    
    SUM(POWER((`OTHERS`) - (SELECT AVG(`OTHERS`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`OTHERS`) FROM data_set), 3)) AS skewness_OTHERS,
    
    SUM(POWER((`SCRAP_QTY (MT)`) - (SELECT AVG(`SCRAP_QTY (MT)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SCRAP_QTY (MT)`) FROM data_set), 3)) AS skewness_SCRAP_QTY,
    
    SUM(POWER((`PIGIRON`) - (SELECT AVG(`PIGIRON`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`PIGIRON`) FROM data_set), 3)) AS skewness_PIGIRON,
    
    SUM(POWER((`DRI1_QTY (MT) (Lumps)`) - (SELECT AVG(`DRI1_QTY (MT) (Lumps)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DRI1_QTY (MT) (Lumps)`) FROM data_set), 3)) AS skewness_DRI1_QTY,
    
    SUM(POWER((`TOT_DRI_QTY`) - (SELECT AVG(`TOT_DRI_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_DRI_QTY`) FROM data_set), 3)) AS skewness_TOT_DRI_QTY,
    
    SUM(POWER((`HOT_METAL (HOT Metal from MBF)`) - (SELECT AVG(`HOT_METAL (HOT Metal from MBF)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`HOT_METAL (HOT Metal from MBF)`) FROM data_set), 3)) AS skewness_HOT_METAL,
    
    SUM(POWER((`Total Charge`) - (SELECT AVG(`Total Charge`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Total Charge`) FROM data_set), 3)) AS skewness_Total_Charge,
    
    SUM(POWER((`Hot_Heel (Left Over Liquid metal in EAF)`) - (SELECT AVG(`Hot_Heel (Left Over Liquid metal in EAF)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Hot_Heel (Left Over Liquid metal in EAF)`) FROM data_set), 3)) AS skewness_Hot_Heel,
    
    SUM(POWER((`DOLO`) - (SELECT AVG(`DOLO`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO`) FROM data_set), 3)) AS skewness_DOLO,
    
    SUM(POWER((`DOLO1_EMPTY`) - (SELECT AVG(`DOLO1_EMPTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO1_EMPTY`) FROM data_set), 3)) AS skewness_DOLO1_EMPTY,
    
    SUM(POWER((`TOT_LIME_QTY`) - (SELECT AVG(`TOT_LIME_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_LIME_QTY`) FROM data_set), 3)) AS skewness_TOT_LIME_QTY,
    
    SUM(POWER((`TAP_TEMP (Tappnig Temperature)`) - (SELECT AVG(`TAP_TEMP (Tappnig Temperature)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_TEMP (Tappnig Temperature)`) FROM data_set), 3)) AS skewness_TAP_TEMP,
    
    SUM(POWER((`O2REQ`) - (SELECT AVG(`O2REQ`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2REQ`) FROM data_set), 3)) AS skewness_O2REQ,
    
    SUM(POWER((`O2ACT`) - (SELECT AVG(`O2ACT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2ACT`) FROM data_set), 3)) AS skewness_O2ACT,
    
    SUM(POWER((`ENERGY (Energy Consumption)`) - (SELECT AVG(`ENERGY (Energy Consumption)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`ENERGY (Energy Consumption)`) FROM data_set), 3)) AS skewness_ENERGY,
    
    SUM(POWER((`KWH_PER_TON (Energy Consumption Per Ton)`) - (SELECT AVG(`KWH_PER_TON (Energy Consumption Per Ton)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_TON (Energy Consumption Per Ton)`) FROM data_set), 3)) AS skewness_KWH_PER_TON,
    
    SUM(POWER((`KWH_PER_MIN`) - (SELECT AVG(`KWH_PER_MIN`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_MIN`) FROM data_set), 3)) AS skewness_KWH_PER_MIN,
    
    SUM(POWER((`MELT_TIME (Melting Time)`) - (SELECT AVG(`MELT_TIME (Melting Time)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`MELT_TIME (Melting Time)`) FROM data_set), 3)) AS skewness_MELT_TIME,
    
    SUM(POWER((`TA_TIME (Turn Around Time)`) - (SELECT AVG(`TA_TIME (Turn Around Time)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TA_TIME (Turn Around Time)`) FROM data_set), 3)) AS skewness_TA_TIME,
    
    SUM(POWER((`TT_TIME (Total Cycle Time Including Breakdown)`) - (SELECT AVG(`TT_TIME (Total Cycle Time Including Breakdown)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TT_TIME (Total Cycle Time Including Breakdown)`) FROM data_set), 3)) AS skewness_TT_TIME,
    
    SUM(POWER((`POW_ON_TIME`) - (SELECT AVG(`POW_ON_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`POW_ON_TIME`) FROM data_set), 3)) AS skewness_POW_ON_TIME,
    
    SUM(POWER((`TAPPING_TIME`) - (SELECT AVG(`TAPPING_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TAPPING_TIME`) FROM data_set), 3)) AS skewness_TAPPING_TIME,
    
    SUM(POWER((`ARCING_TIME`) - (SELECT AVG(`ARCING_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`ARCING_TIME`) FROM data_set), 3)) AS skewness_ARCING_TIME,
    
    SUM(POWER((`DOWN_TIME`) - (SELECT AVG(`DOWN_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOWN_TIME`) FROM data_set), 3)) AS skewness_DOWN_TIME,
    
    SUM(POWER((`E1_CUR (Electrode 1 Current)`) - (SELECT AVG(`E1_CUR (Electrode 1 Current)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E1_CUR (Electrode 1 Current)`) FROM data_set), 3)) AS skewness_E1_CUR,
    
    SUM(POWER((`E2_CUR (Electrode 2 Current)`) - (SELECT AVG(`E2_CUR (Electrode 2 Current)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E2_CUR (Electrode 2 Current)`) FROM data_set), 3)) AS skewness_E2_CUR,
    
    SUM(POWER((`E3_CUR (Electrode 3 Current)`) - (SELECT AVG(`E3_CUR (Electrode 3 Current)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E3_CUR (Electrode 3 Current)`) FROM data_set), 3)) AS skewness_E3_CUR,
    
    SUM(POWER((`SPOUT (Bottom Refractory Temperature)`) - (SELECT AVG(`SPOUT (Bottom Refractory Temperature)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SPOUT (Bottom Refractory Temperature)`) FROM data_set), 3)) AS skewness_SPOUT,
    
    SUM(POWER((`DOLOMIT`) - (SELECT AVG(`DOLOMIT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOLOMIT`) FROM data_set), 3)) AS skewness_DOLOMIT,
    
    SUM(POWER((`CPC`) - (SELECT AVG(`CPC`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`CPC`) FROM data_set), 3)) AS skewness_CPC,
    
    SUM(POWER((`TEMPERATURE`) - (SELECT AVG(`TEMPERATURE`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TEMPERATURE`) FROM data_set), 3)) AS skewness_TEMPERATURE,
    
    SUM(POWER((`POWER`) - (SELECT AVG(`POWER`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`POWER`) FROM data_set), 3)) AS skewness_POWER,
    
    SUM(POWER((`LAB_REP_TIME`) - (SELECT AVG(`LAB_REP_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LAB_REP_TIME`) FROM data_set), 3)) AS skewness_LAB_REP_TIME,
    
    SUM(POWER((`C`) - (SELECT AVG(`C`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`C`) FROM data_set), 3)) AS skewness_C,
    
    SUM(POWER((`SI`) - (SELECT AVG(`SI`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SI`) FROM data_set), 3)) AS skewness_SI,
    
    SUM(POWER((`MN`) - (SELECT AVG(`MN`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`MN`) FROM data_set), 3)) AS skewness_MN,
    
    SUM(POWER((`P`) - (SELECT AVG(`P`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`P`) FROM data_set), 3)) AS skewness_P,
    
    SUM(POWER((`S`) - (SELECT AVG(`S`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`S`) FROM data_set), 3)) AS skewness_S,
    
    SUM(POWER((`CU`) - (SELECT AVG(`CU`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`CU`) FROM data_set), 3)) AS skewness_CU,
    
    SUM(POWER((`CR`) - (SELECT AVG(`CR`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`CR`) FROM data_set), 3)) AS skewness_CR,
    
    SUM(POWER((`NI`) - (SELECT AVG(`NI`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`NI`) FROM data_set), 3)) AS skewness_NI,
    
    SUM(POWER((`N`) - (SELECT AVG(`N`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`N`) FROM data_set), 3)) AS skewness_N,
    
    SUM(POWER((`TIME_UTLN_PRCNT`) - (SELECT AVG(`TIME_UTLN_PRCNT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TIME_UTLN_PRCNT`) FROM data_set), 3)) AS skewness_TIME_UTLN_PRCNT,
    
    SUM(POWER((`TOP_COKE`) - (SELECT AVG(`TOP_COKE`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TOP_COKE`) FROM data_set), 3)) AS skewness_TOP_COKE,
    
    SUM(POWER((`OPEN_C`) - (SELECT AVG(`OPEN_C`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`OPEN_C`) FROM data_set), 3)) AS skewness_OPEN_C,
    
    SUM(POWER((`TAP_C`) - (SELECT AVG(`TAP_C`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_C`) FROM data_set), 3)) AS skewness_TAP_C,
    
    SUM(POWER((`IT_KG`) - (SELECT AVG(`IT_KG`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`IT_KG`) FROM data_set), 3)) AS skewness_IT_KG,
    
    SUM(POWER((`BUCKET_NO`) - (SELECT AVG(`BUCKET_NO`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`BUCKET_NO`) FROM data_set), 3)) AS skewness_BUCKET_NO,
    
    SUM(POWER((`STATIC_WT`) - (SELECT AVG(`STATIC_WT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`STATIC_WT`) FROM data_set), 3)) AS skewness_STATIC_WT,
    
    SUM(POWER((`LIME`) - (SELECT AVG(`LIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LIME`) FROM data_set), 3)) AS skewness_LIME,
    
    SUM(POWER((`LIME2`) - (SELECT AVG(`LIME2`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LIME2`) FROM data_set), 3)) AS skewness_LIME2,
    
    SUM(POWER((`O2SIDE1`) - (SELECT AVG(`O2SIDE1`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE1`) FROM data_set), 3)) AS skewness_O2SIDE1,
    
    SUM(POWER((`O2SIDE2`) - (SELECT AVG(`O2SIDE2`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE2`) FROM data_set), 3)) AS skewness_O2SIDE2,
    
    SUM(POWER((`O2SIDE3`) - (SELECT AVG(`O2SIDE3`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE3`) FROM data_set), 3)) AS skewness_O2SIDE3,
    
    SUM(POWER((`SPINNING`) - (SELECT AVG(`SPINNING`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SPINNING`) FROM data_set), 3)) AS skewness_SPINNING,
    
    SUM(POWER((`RAMMING1`) - (SELECT AVG(`RAMMING1`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`RAMMING1`) FROM data_set), 3)) AS skewness_RAMMING1,
    
    SUM(POWER((`RAMMING2`) - (SELECT AVG(`RAMMING2`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`RAMMING2`) FROM data_set), 3)) AS skewness_RAMMING2,
    
    SUM(POWER((`PREV_TAP_TIME`) - (SELECT AVG(`PREV_TAP_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`PREV_TAP_TIME`) FROM data_set), 3)) AS skewness_PREV_TAP_TIME,
    
    SUM(POWER((`TAP_DURATION`) - (SELECT AVG(`TAP_DURATION`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_DURATION`) FROM data_set), 3)) AS skewness_TAP_DURATION,
    
    SUM(POWER((`Pour_Back_Metal`) - (SELECT AVG(`Pour_Back_Metal`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Pour_Back_Metal`) FROM data_set), 3)) AS skewness_Pour_Back_Metal,
    
    SUM(POWER((`LM_WT`) - (SELECT AVG(`LM_WT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LM_WT`) FROM data_set), 3)) AS skewness_LM_WT,
    
    SUM(POWER((`Production (MT)`) - (SELECT AVG(`Production (MT)`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Production (MT)`) FROM data_set), 3)) AS skewness_Production_MT
FROM data_set;

#Fourth Moment Business Decisions

#kurtosis
SELECT
    (SUM(POWER((`COKE_REQ`) - (SELECT AVG(`COKE_REQ`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`COKE_REQ`) FROM data_set), 4)) - 3) AS kurtosis_COKE_REQ,
    
    (SUM(POWER((`BSM`) - (SELECT AVG(`BSM`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`BSM`) FROM data_set), 4)) - 3) AS kurtosis_BSM,
    
    (SUM(POWER((`TP`) - (SELECT AVG(`TP`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TP`) FROM data_set), 4)) - 3) AS kurtosis_TP,
    
    (SUM(POWER((`MSTB`) - (SELECT AVG(`MSTB`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`MSTB`) FROM data_set), 4)) - 3) AS kurtosis_MSTB,
    
    (SUM(POWER((`SKULL`) - (SELECT AVG(`SKULL`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SKULL`) FROM data_set), 4)) - 3) AS kurtosis_SKULL,
    
    (SUM(POWER((`SHRAD`) - (SELECT AVG(`SHRAD`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SHRAD`) FROM data_set), 4)) - 3) AS kurtosis_SHRAD,
    
    (SUM(POWER((`REMET`) - (SELECT AVG(`REMET`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`REMET`) FROM data_set), 4)) - 3) AS kurtosis_REMET,
    
    (SUM(POWER((`BP`) - (SELECT AVG(`BP`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`BP`) FROM data_set), 4)) - 3) AS kurtosis_BP,
    
    (SUM(POWER((`HBI`) - (SELECT AVG(`HBI`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`HBI`) FROM data_set), 4)) - 3) AS kurtosis_HBI,
    
    (SUM(POWER((`OTHERS`) - (SELECT AVG(`OTHERS`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`OTHERS`) FROM data_set), 4)) - 3) AS kurtosis_OTHERS,
    
    (SUM(POWER((`SCRAP_QTY (MT)`) - (SELECT AVG(`SCRAP_QTY (MT)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SCRAP_QTY (MT)`) FROM data_set), 4)) - 3) AS kurtosis_SCRAP_QTY,
    
    (SUM(POWER((`PIGIRON`) - (SELECT AVG(`PIGIRON`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`PIGIRON`) FROM data_set), 4)) - 3) AS kurtosis_PIGIRON,
    
    (SUM(POWER((`DRI1_QTY (MT) (Lumps)`) - (SELECT AVG(`DRI1_QTY (MT) (Lumps)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DRI1_QTY (MT) (Lumps)`) FROM data_set), 4)) - 3) AS kurtosis_DRI1_QTY,
    
    (SUM(POWER((`TOT_DRI_QTY`) - (SELECT AVG(`TOT_DRI_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_DRI_QTY`) FROM data_set), 4)) - 3) AS kurtosis_TOT_DRI_QTY,
    
    (SUM(POWER((`HOT_METAL (HOT Metal from MBF)`) - (SELECT AVG(`HOT_METAL (HOT Metal from MBF)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`HOT_METAL (HOT Metal from MBF)`) FROM data_set), 4)) - 3) AS kurtosis_HOT_METAL,
    
    (SUM(POWER((`Total Charge`) - (SELECT AVG(`Total Charge`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Total Charge`) FROM data_set), 4)) - 3) AS kurtosis_Total_Charge,
    
    (SUM(POWER((`Hot_Heel (Left Over Liquid metal in EAF)`) - (SELECT AVG(`Hot_Heel (Left Over Liquid metal in EAF)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Hot_Heel (Left Over Liquid metal in EAF)`) FROM data_set), 4)) - 3) AS kurtosis_Hot_Heel,
    
    (SUM(POWER((`DOLO`) - (SELECT AVG(`DOLO`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO`) FROM data_set), 4)) - 3) AS kurtosis_DOLO,
    
    (SUM(POWER((`DOLO1_EMPTY`) - (SELECT AVG(`DOLO1_EMPTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO1_EMPTY`) FROM data_set), 4)) - 3) AS kurtosis_DOLO1_EMPTY,
    
    (SUM(POWER((`TOT_LIME_QTY`) - (SELECT AVG(`TOT_LIME_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_LIME_QTY`) FROM data_set), 4)) - 3) AS kurtosis_TOT_LIME_QTY,
    
    (SUM(POWER((`TAP_TEMP (Tappnig Temperature)`) - (SELECT AVG(`TAP_TEMP (Tappnig Temperature)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_TEMP (Tappnig Temperature)`) FROM data_set), 4)) - 3) AS kurtosis_TAP_TEMP,
    
    (SUM(POWER((`O2REQ`) - (SELECT AVG(`O2REQ`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2REQ`) FROM data_set), 4)) - 3) AS kurtosis_O2REQ,
    
    (SUM(POWER((`O2ACT`) - (SELECT AVG(`O2ACT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2ACT`) FROM data_set), 4)) - 3) AS kurtosis_O2ACT,
    
    (SUM(POWER((`ENERGY (Energy Consumption)`) - (SELECT AVG(`ENERGY (Energy Consumption)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`ENERGY (Energy Consumption)`) FROM data_set), 4)) - 3) AS kurtosis_ENERGY,
    
    (SUM(POWER((`KWH_PER_TON (Energy Consumption Per Ton)`) - (SELECT AVG(`KWH_PER_TON (Energy Consumption Per Ton)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_TON (Energy Consumption Per Ton)`) FROM data_set), 4)) - 3) AS kurtosis_KWH_PER_TON,
    
    (SUM(POWER((`KWH_PER_MIN`) - (SELECT AVG(`KWH_PER_MIN`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_MIN`) FROM data_set), 4)) - 3) AS kurtosis_KWH_PER_MIN,
    
    (SUM(POWER((`MELT_TIME (Melting Time)`) - (SELECT AVG(`MELT_TIME (Melting Time)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`MELT_TIME (Melting Time)`) FROM data_set), 4)) - 3) AS kurtosis_MELT_TIME,
    
    (SUM(POWER((`TA_TIME (Turn Around Time)`) - (SELECT AVG(`TA_TIME (Turn Around Time)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TA_TIME (Turn Around Time)`) FROM data_set), 4)) - 3) AS kurtosis_TA_TIME,
    
    (SUM(POWER((`TT_TIME (Total Cycle Time Including Breakdown)`) - (SELECT AVG(`TT_TIME (Total Cycle Time Including Breakdown)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TT_TIME (Total Cycle Time Including Breakdown)`) FROM data_set), 4)) - 3) AS kurtosis_TT_TIME,
    
    (SUM(POWER((`POW_ON_TIME`) - (SELECT AVG(`POW_ON_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`POW_ON_TIME`) FROM data_set), 4)) - 3) AS kurtosis_POW_ON_TIME,
    
    (SUM(POWER((`TAPPING_TIME`) - (SELECT AVG(`TAPPING_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TAPPING_TIME`) FROM data_set), 4)) - 3) AS kurtosis_TAPPING_TIME,
    
    (SUM(POWER((`ARCING_TIME`) - (SELECT AVG(`ARCING_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`ARCING_TIME`) FROM data_set), 4)) - 3) AS kurtosis_ARCING_TIME,
    
    (SUM(POWER((`DOWN_TIME`) - (SELECT AVG(`DOWN_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOWN_TIME`) FROM data_set), 4)) - 3) AS kurtosis_DOWN_TIME,
    
    (SUM(POWER((`E1_CUR (Electrode 1 Current)`) - (SELECT AVG(`E1_CUR (Electrode 1 Current)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E1_CUR (Electrode 1 Current)`) FROM data_set), 4)) - 3) AS kurtosis_E1_CUR,
    
    (SUM(POWER((`E2_CUR (Electrode 2 Current)`) - (SELECT AVG(`E2_CUR (Electrode 2 Current)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E2_CUR (Electrode 2 Current)`) FROM data_set), 4)) - 3) AS kurtosis_E2_CUR,
    
    (SUM(POWER((`E3_CUR (Electrode 3 Current)`) - (SELECT AVG(`E3_CUR (Electrode 3 Current)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E3_CUR (Electrode 3 Current)`) FROM data_set), 4)) - 3) AS kurtosis_E3_CUR,
    
    (SUM(POWER((`SPOUT (Bottom Refractory Temperature)`) - (SELECT AVG(`SPOUT (Bottom Refractory Temperature)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SPOUT (Bottom Refractory Temperature)`) FROM data_set), 4)) - 3) AS kurtosis_SPOUT,
    
    (SUM(POWER((`DOLOMIT`) - (SELECT AVG(`DOLOMIT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOLOMIT`) FROM data_set), 4)) - 3) AS kurtosis_DOLOMIT,
    
    (SUM(POWER((`CPC`) - (SELECT AVG(`CPC`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`CPC`) FROM data_set), 4)) - 3) AS kurtosis_CPC,
    
    (SUM(POWER((`TEMPERATURE`) - (SELECT AVG(`TEMPERATURE`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TEMPERATURE`) FROM data_set), 4)) - 3) AS kurtosis_TEMPERATURE,
    
    (SUM(POWER((`POWER`) - (SELECT AVG(`POWER`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`POWER`) FROM data_set), 4)) - 3) AS kurtosis_POWER,
    
    (SUM(POWER((`LAB_REP_TIME`) - (SELECT AVG(`LAB_REP_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LAB_REP_TIME`) FROM data_set), 4)) - 3) AS kurtosis_LAB_REP_TIME,
    
    (SUM(POWER((`C`) - (SELECT AVG(`C`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`C`) FROM data_set), 4)) - 3) AS kurtosis_C,
    
    (SUM(POWER((`SI`) - (SELECT AVG(`SI`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SI`) FROM data_set), 4)) - 3) AS kurtosis_SI,
    
    (SUM(POWER((`MN`) - (SELECT AVG(`MN`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`MN`) FROM data_set), 4)) - 3) AS kurtosis_MN,
    
    (SUM(POWER((`P`) - (SELECT AVG(`P`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`P`) FROM data_set), 4)) - 3) AS kurtosis_P,
    
    (SUM(POWER((`S`) - (SELECT AVG(`S`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`S`) FROM data_set), 4)) - 3) AS kurtosis_S,
    
    (SUM(POWER((`CU`) - (SELECT AVG(`CU`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`CU`) FROM data_set), 4)) - 3) AS kurtosis_CU,
    
    (SUM(POWER((`CR`) - (SELECT AVG(`CR`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`CR`) FROM data_set), 4)) - 3) AS kurtosis_CR,
    
    (SUM(POWER((`NI`) - (SELECT AVG(`NI`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`NI`) FROM data_set), 4)) - 3) AS kurtosis_NI,
    
    (SUM(POWER((`N`) - (SELECT AVG(`N`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`N`) FROM data_set), 4)) - 3) AS kurtosis_N,
    
    (SUM(POWER((`TIME_UTLN_PRCNT`) - (SELECT AVG(`TIME_UTLN_PRCNT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TIME_UTLN_PRCNT`) FROM data_set), 4)) - 3) AS kurtosis_TIME_UTLN_PRCNT,
    
    (SUM(POWER((`TOP_COKE`) - (SELECT AVG(`TOP_COKE`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TOP_COKE`) FROM data_set), 4)) - 3) AS kurtosis_TOP_COKE,
    
    (SUM(POWER((`OPEN_C`) - (SELECT AVG(`OPEN_C`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`OPEN_C`) FROM data_set), 4)) - 3) AS kurtosis_OPEN_C,
    
    (SUM(POWER((`TAP_C`) - (SELECT AVG(`TAP_C`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_C`) FROM data_set), 4)) - 3) AS kurtosis_TAP_C,
    
    (SUM(POWER((`IT_KG`) - (SELECT AVG(`IT_KG`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`IT_KG`) FROM data_set), 4)) - 3) AS kurtosis_IT_KG,
    
    (SUM(POWER((`BUCKET_NO`) - (SELECT AVG(`BUCKET_NO`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`BUCKET_NO`) FROM data_set), 4)) - 3) AS kurtosis_BUCKET_NO,
    
    (SUM(POWER((`STATIC_WT`) - (SELECT AVG(`STATIC_WT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`STATIC_WT`) FROM data_set), 4)) - 3) AS kurtosis_STATIC_WT,
    
    (SUM(POWER((`LIME`) - (SELECT AVG(`LIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LIME`) FROM data_set), 4)) - 3) AS kurtosis_LIME,
    
    (SUM(POWER((`LIME2`) - (SELECT AVG(`LIME2`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LIME2`) FROM data_set), 4)) - 3) AS kurtosis_LIME2,
    
    (SUM(POWER((`O2SIDE1`) - (SELECT AVG(`O2SIDE1`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE1`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE1,
    
    (SUM(POWER((`O2SIDE2`) - (SELECT AVG(`O2SIDE2`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE2`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE2,
    
    (SUM(POWER((`O2SIDE3`) - (SELECT AVG(`O2SIDE3`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE3`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE3,
    
    (SUM(POWER((`SPINNING`) - (SELECT AVG(`SPINNING`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SPINNING`) FROM data_set), 4)) - 3) AS kurtosis_SPINNING,
    
    (SUM(POWER((`RAMMING1`) - (SELECT AVG(`RAMMING1`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`RAMMING1`) FROM data_set), 4)) - 3) AS kurtosis_RAMMING1,
    
    (SUM(POWER((`RAMMING2`) - (SELECT AVG(`RAMMING2`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`RAMMING2`) FROM data_set), 4)) - 3) AS kurtosis_RAMMING2,
    
    (SUM(POWER((`PREV_TAP_TIME`) - (SELECT AVG(`PREV_TAP_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`PREV_TAP_TIME`) FROM data_set), 4)) - 3) AS kurtosis_PREV_TAP_TIME,
    
    (SUM(POWER((`TAP_DURATION`) - (SELECT AVG(`TAP_DURATION`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_DURATION`) FROM data_set), 4)) - 3) AS kurtosis_TAP_DURATION,
    
    (SUM(POWER((`Pour_Back_Metal`) - (SELECT AVG(`Pour_Back_Metal`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Pour_Back_Metal`) FROM data_set), 4)) - 3) AS kurtosis_Pour_Back_Metal,
    
    (SUM(POWER((`LM_WT`) - (SELECT AVG(`LM_WT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LM_WT`) FROM data_set), 4)) - 3) AS kurtosis_LM_WT,
    
    (SUM(POWER((`Production (MT)`) - (SELECT AVG(`Production (MT)`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Production (MT)`) FROM data_set), 4)) - 3) AS kurtosis_Production_MT
FROM data_set;


#####################  data preprocesing #####################
#DESCRIBE provides a detailed description of the table structure, including column names, data types, and other attributes.
DESCRIBE data_set;

# ------------------  Handling Duplicates  ---------------------------
SELECT SRNO, COUNT(*) as duplicate_count
FROM data_sett
GROUP BY SRNO
HAVING COUNT(*) > 1;

SELECT INJ1_QTY, COUNT(*) as duplicate_count_INJ1_QTY
FROM data_sett
GROUP BY INJ1_QTY
HAVING COUNT(*) > 1;

SELECT INJ2_QTY, COUNT(*) as duplicate_count_INJ2_QTY
FROM data_sett
GROUP BY INJ2_QTY
HAVING COUNT(*) > 1;

SELECT DATETIME, COUNT(*) as duplicate_count_DATETIME
FROM data_sett
GROUP BY DATETIME
HAVING COUNT(*) > 1;

SELECT HEATNO, COUNT(*) as duplicate_count_HEATNO
FROM data_sett
GROUP BY HEATNO
HAVING COUNT(*) > 1;

SELECT GRADE, COUNT(*) as duplicate_count_GRADE
FROM data_sett
GROUP BY GRADE
HAVING COUNT(*) > 1;

SELECT SECTION_IC, COUNT(*) as duplicate_count_SECTION_IC
FROM data_sett
GROUP BY SECTION_IC
HAVING COUNT(*) > 1;

SELECT COKE_REQ, COUNT(*) as duplicate_count_COKE_REQ
FROM data_sett
GROUP BY COKE_REQ
HAVING COUNT(*) > 1;

SELECT BSM, COUNT(*) as duplicate_count_BSM
FROM data_sett
GROUP BY BSM
HAVING COUNT(*) > 1;

SELECT TP, COUNT(*) as duplicate_count_TP
FROM data_sett
GROUP BY TP
HAVING COUNT(*) > 1;

SELECT MSTB, COUNT(*) as duplicate_count_MSTB
FROM data_sett
GROUP BY MSTB
HAVING COUNT(*) > 1;

SELECT SKULL, COUNT(*) as duplicate_count_SKULL
FROM data_sett
GROUP BY SKULL
HAVING COUNT(*) > 1;

SELECT SHRAD, COUNT(*) as duplicate_count_SHRAD
FROM data_sett
GROUP BY SHRAD
HAVING COUNT(*) > 1;

SELECT REMET, COUNT(*) as duplicate_count_REMET
FROM data_sett
GROUP BY REMET
HAVING COUNT(*) > 1;

SELECT BP, COUNT(*) as duplicate_count_BP
FROM data_sett
GROUP BY BP
HAVING COUNT(*) > 1;

SELECT HBI, COUNT(*) as duplicate_count_HBI
FROM data_sett
GROUP BY HBI
HAVING COUNT(*) > 1;

SELECT OTHERS, COUNT(*) as duplicate_count_OTHERS
FROM data_sett
GROUP BY OTHERS
HAVING COUNT(*) > 1;

SELECT SCRAP_QTY, COUNT(*) as duplicate_count_SCRAP_QTY
FROM data_sett
GROUP BY SCRAP_QTY
HAVING COUNT(*) > 1;

SELECT PIGIRON, COUNT(*) as duplicate_count_PIGIRON
FROM data_sett
GROUP BY PIGIRON
HAVING COUNT(*) > 1;

SELECT DRI1_QTY, COUNT(*) as duplicate_count_DRI1_QTY
FROM data_sett
GROUP BY DRI1_QTY
HAVING COUNT(*) > 1;

SELECT DRI2_QTY, COUNT(*) as duplicate_count_DRI2_QTY
FROM data_sett
GROUP BY DRI2_QTY
HAVING COUNT(*) > 1;

SELECT TOT_DRI_QTY, COUNT(*) as duplicate_count_TOT_DRI_QTY
FROM data_sett
GROUP BY TOT_DRI_QTY
HAVING COUNT(*) > 1;

SELECT HOT_METAL, COUNT(*) as duplicate_count_HOT_METAL
FROM data_sett
GROUP BY HOT_METAL
HAVING COUNT(*) > 1;

SELECT Total_Charge, COUNT(*) as duplicate_count_Total_Charge
FROM data_sett
GROUP BY Total_Charge
HAVING COUNT(*) > 1;

SELECT Hot_Heel, COUNT(*) as duplicate_count_Hot_Heel
FROM data_sett
GROUP BY Hot_Heel
HAVING COUNT(*) > 1;

SELECT DOLO, COUNT(*) as duplicate_count_DOLO
FROM data_sett
GROUP BY DOLO
HAVING COUNT(*) > 1;

SELECT DOLO1_EMPTY, COUNT(*) as duplicate_count_DOLO1_EMPTY
FROM data_sett
GROUP BY DOLO1_EMPTY
HAVING COUNT(*) > 1;

SELECT TOT_LIME_QTY, COUNT(*) as duplicate_count_TOT_LIME_QTY
FROM data_sett
GROUP BY TOT_LIME_QTY
HAVING COUNT(*) > 1;

SELECT TAP_TEMP, COUNT(*) as duplicate_count_TAP_TEMP
FROM data_sett
GROUP BY TAP_TEMP
HAVING COUNT(*) > 1;

SELECT O2REQ, COUNT(*) as duplicate_count_O2REQ
FROM data_sett
GROUP BY O2REQ
HAVING COUNT(*) > 1;

SELECT O2ACT, COUNT(*) as duplicate_count_O2ACT
FROM data_sett
GROUP BY O2ACT
HAVING COUNT(*) > 1;

SELECT ENERGY, COUNT(*) as duplicate_count_ENERGY
FROM data_sett
GROUP BY ENERGY
HAVING COUNT(*) > 1;

SELECT KWH_PER_TON, COUNT(*) as duplicate_count_KWH_PER_TON
FROM data_sett
GROUP BY KWH_PER_TON
HAVING COUNT(*) > 1;

SELECT KWH_PER_MIN, COUNT(*) as duplicate_count_KWH_PER_MIN
FROM data_sett
GROUP BY KWH_PER_MIN
HAVING COUNT(*) > 1;

SELECT MELT_TIME, COUNT(*) as duplicate_count_MELT_TIME
FROM data_sett
GROUP BY MELT_TIME
HAVING COUNT(*) > 1;

SELECT TA_TIME, COUNT(*) as duplicate_count_TA_TIME
FROM data_sett
GROUP BY TA_TIME
HAVING COUNT(*) > 1;

SELECT TT_TIME, COUNT(*) as duplicate_count_TT_TIME
FROM data_sett
GROUP BY TT_TIME
HAVING COUNT(*) > 1;

SELECT POW_ON_TIME, COUNT(*) as duplicate_count_POW_ON_TIME
FROM data_sett
GROUP BY POW_ON_TIME
HAVING COUNT(*) > 1;

SELECT TAPPING_TIME, COUNT(*) as duplicate_count_TAPPING_TIME
FROM data_sett
GROUP BY TAPPING_TIME
HAVING COUNT(*) > 1;

SELECT ARCING_TIME, COUNT(*) as duplicate_count_ARCING_TIME
FROM data_sett
GROUP BY ARCING_TIME
HAVING COUNT(*) > 1;

SELECT DOWN_TIME, COUNT(*) as duplicate_count_DOWN_TIME
FROM data_sett
GROUP BY DOWN_TIME
HAVING COUNT(*) > 1;

SELECT E1_CUR, COUNT(*) as duplicate_count_E1_CUR
FROM data_sett
GROUP BY E1_CUR
HAVING COUNT(*) > 1;

SELECT E2_CUR, COUNT(*) as duplicate_count_E2_CUR
FROM data_sett
GROUP BY E2_CUR
HAVING COUNT(*) > 1;

SELECT E3_CUR, COUNT(*) as duplicate_count_E3_CUR
FROM data_sett
GROUP BY E3_CUR
HAVING COUNT(*) > 1;

SELECT SPOUT, COUNT(*) as duplicate_count_SPOUT
FROM data_sett
GROUP BY SPOUT
HAVING COUNT(*) > 1;

SELECT DOLOMIT, COUNT(*) as duplicate_count_DOLOMIT
FROM data_sett
GROUP BY DOLOMIT
HAVING COUNT(*) > 1;

SELECT CPC, COUNT(*) as duplicate_count_CPC
FROM data_sett
GROUP BY CPC
HAVING COUNT(*) > 1;

SELECT TEMPERATURE, COUNT(*) as duplicate_count_TEMPERATURE
FROM data_sett
GROUP BY TEMPERATURE
HAVING COUNT(*) > 1;

SELECT POWER, COUNT(*) as duplicate_count_POWER
FROM data_sett
GROUP BY POWER
HAVING COUNT(*) > 1;

SELECT LAB_REP_TIME, COUNT(*) as duplicate_count_LAB_REP_TIME
FROM data_sett
GROUP BY LAB_REP_TIME
HAVING COUNT(*) > 1;

SELECT C, COUNT(*) as duplicate_count_C
FROM data_sett
GROUP BY C
HAVING COUNT(*) > 1;

SELECT SI, COUNT(*) as duplicate_count_SI
FROM data_sett
GROUP BY SI
HAVING COUNT(*) > 1;

SELECT MN, COUNT(*) as duplicate_count_MN
FROM data_sett
GROUP BY MN
HAVING COUNT(*) > 1;

SELECT P, COUNT(*) as duplicate_count_P
FROM data_sett
GROUP BY P
HAVING COUNT(*) > 1;

SELECT S, COUNT(*) as duplicate_count_S
FROM data_sett
GROUP BY S
HAVING COUNT(*) > 1;

SELECT CU, COUNT(*) as duplicate_count_CU
FROM data_sett
GROUP BY CU
HAVING COUNT(*) > 1;

SELECT CR, COUNT(*) as duplicate_count_CR
FROM data_sett
GROUP BY CR
HAVING COUNT(*) > 1;

SELECT NI, COUNT(*) as duplicate_count_NI
FROM data_sett
GROUP BY NI
HAVING COUNT(*) > 1;

SELECT N, COUNT(*) as duplicate_count_N
FROM data_sett
GROUP BY N
HAVING COUNT(*) > 1;

SELECT TIME_UTLN_PRCNT, COUNT(*) as duplicate_count_TIME_UTLN_PRCNT
FROM data_sett
GROUP BY TIME_UTLN_PRCNT
HAVING COUNT(*) > 1;

SELECT TOP_COKE, COUNT(*) as duplicate_count_TOP_COKE
FROM data_sett
GROUP BY TOP_COKE
HAVING COUNT(*) > 1;

SELECT OPEN_C, COUNT(*) as duplicate_count_OPEN_C
FROM data_sett
GROUP BY OPEN_C
HAVING COUNT(*) > 1;

SELECT TAP_C, COUNT(*) as duplicate_count_TAP_C
FROM data_sett
GROUP BY TAP_C
HAVING COUNT(*) > 1;

SELECT IT_KG, COUNT(*) as duplicate_count_IT_KG
FROM data_sett
GROUP BY IT_KG
HAVING COUNT(*) > 1;

SELECT BUCKET_NO, COUNT(*) as duplicate_count_BUCKET_NO
FROM data_sett
GROUP BY BUCKET_NO
HAVING COUNT(*) > 1;

SELECT STATIC_WT, COUNT(*) as duplicate_count_STATIC_WT
FROM data_sett
GROUP BY STATIC_WT
HAVING COUNT(*) > 1;

SELECT LIME, COUNT(*) as duplicate_count_LIME
FROM data_sett
GROUP BY LIME
HAVING COUNT(*) > 1;

SELECT LIME2, COUNT(*) as duplicate_count_LIME2
FROM data_sett
GROUP BY LIME2
HAVING COUNT(*) > 1;

SELECT O2SIDE1, COUNT(*) as duplicate_count_O2SIDE1
FROM data_sett
GROUP BY O2SIDE1
HAVING COUNT(*) > 1;

SELECT O2SIDE2, COUNT(*) as duplicate_count_O2SIDE2
FROM data_sett
GROUP BY O2SIDE2
HAVING COUNT(*) > 1;

SELECT O2SIDE3, COUNT(*) as duplicate_count_O2SIDE3
FROM data_sett
GROUP BY O2SIDE3
HAVING COUNT(*) > 1;

SELECT SPINNING, COUNT(*) as duplicate_count_SPINNING
FROM data_sett
GROUP BY SPINNING
HAVING COUNT(*) > 1;

SELECT RAMMING1, COUNT(*) as duplicate_count_RAMMING1
FROM data_sett
GROUP BY RAMMING1
HAVING COUNT(*) > 1;

SELECT RAMMING2, COUNT(*) as duplicate_count_RAMMING2
FROM data_sett
GROUP BY RAMMING2
HAVING COUNT(*) > 1;

SELECT PREV_TAP_TIME, COUNT(*) as duplicate_count_PREV_TAP_TIME
FROM data_sett
GROUP BY PREV_TAP_TIME
HAVING COUNT(*) > 1;

SELECT TAP_DURATION, COUNT(*) as duplicate_count_TAP_DURATION
FROM data_sett
GROUP BY TAP_DURATION
HAVING COUNT(*) > 1;

SELECT Pour_Back_Metal, COUNT(*) as duplicate_count_Pour_Back_Metal
FROM data_sett
GROUP BY Pour_Back_Metal
HAVING COUNT(*) > 1;

SELECT LM_WT, COUNT(*) as duplicate_count_LM_WT
FROM data_sett
GROUP BY LM_WT
HAVING COUNT(*) > 1;

SELECT Production, COUNT(*) as duplicate_count_Production
FROM data_sett
GROUP BY Production
HAVING COUNT(*) > 1;


# ------------------- Outlier Treatment --------------------







#    ---------------------  missing values  ---------------------------
SELECT 
    SUM(CASE WHEN SRNO IS NULL THEN 1 ELSE 0 END) AS SRNO_missing,
    SUM(CASE WHEN `DATETIME` IS NULL THEN 1 ELSE 0 END) AS DATETIME_missing,
    SUM(CASE WHEN HEATNO IS NULL THEN 1 ELSE 0 END) AS HEATNO_missing,
    SUM(CASE WHEN GRADE IS NULL THEN 1 ELSE 0 END) AS GRADE_missing,
    SUM(CASE WHEN SECTION_IC IS NULL THEN 1 ELSE 0 END) AS SECTION_IC_missing,
    SUM(CASE WHEN COKE_REQ IS NULL THEN 1 ELSE 0 END) AS COKE_REQ_missing,
    SUM(CASE WHEN BSM IS NULL THEN 1 ELSE 0 END) AS BSM_missing,
    SUM(CASE WHEN TP IS NULL THEN 1 ELSE 0 END) AS TP_missing,
    SUM(CASE WHEN MSTB IS NULL THEN 1 ELSE 0 END) AS MSTB_missing,
    SUM(CASE WHEN SKULL IS NULL THEN 1 ELSE 0 END) AS SKULL_missing,
    SUM(CASE WHEN SHRAD IS NULL THEN 1 ELSE 0 END) AS SHRAD_missing,
    SUM(CASE WHEN REMET IS NULL THEN 1 ELSE 0 END) AS REMET_missing,
    SUM(CASE WHEN BP IS NULL THEN 1 ELSE 0 END) AS BP_missing,
    SUM(CASE WHEN HBI IS NULL THEN 1 ELSE 0 END) AS HBI_missing,
    SUM(CASE WHEN OTHERS IS NULL THEN 1 ELSE 0 END) AS OTHERS_missing,
    SUM(CASE WHEN `SCRAP_QTY (MT)` IS NULL THEN 1 ELSE 0 END) AS SCRAP_QTY_missing,
    SUM(CASE WHEN PIGIRON IS NULL THEN 1 ELSE 0 END) AS PIGIRON_missing,
    SUM(CASE WHEN `DRI1_QTY (MT) (Lumps)` IS NULL THEN 1 ELSE 0 END) AS DRI1_QTY_missing,
    SUM(CASE WHEN TOT_DRI_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_DRI_QTY_missing,
    SUM(CASE WHEN `HOT_METAL (HOT Metal from MBF)` IS NULL THEN 1 ELSE 0 END) AS HOT_METAL_missing,
    SUM(CASE WHEN `Total Charge` IS NULL THEN 1 ELSE 0 END) AS Total_Charge_missing,
    SUM(CASE WHEN `Hot_Heel (Left Over Liquid metal in EAF)` IS NULL THEN 1 ELSE 0 END) AS Hot_Heel_missing,
    SUM(CASE WHEN DOLO IS NULL THEN 1 ELSE 0 END) AS DOLO_missing,
    SUM(CASE WHEN DOLO1_EMPTY IS NULL THEN 1 ELSE 0 END) AS DOLO1_EMPTY_missing,
    SUM(CASE WHEN TOT_LIME_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_LIME_QTY_missing,
    SUM(CASE WHEN `TAP_TEMP (Tappnig Temperature)` IS NULL THEN 1 ELSE 0 END) AS TAP_TEMP_missing,
    SUM(CASE WHEN O2REQ IS NULL THEN 1 ELSE 0 END) AS O2REQ_missing,
    SUM(CASE WHEN O2ACT IS NULL THEN 1 ELSE 0 END) AS O2ACT_missing,
    SUM(CASE WHEN `ENERGY (Energy Consumption)` IS NULL THEN 1 ELSE 0 END) AS ENERGY_missing,
    SUM(CASE WHEN `KWH_PER_TON (Energy Consumption Per Ton)` IS NULL THEN 1 ELSE 0 END) AS KWH_PER_TON_missing,
    SUM(CASE WHEN KWH_PER_MIN IS NULL THEN 1 ELSE 0 END) AS KWH_PER_MIN_missing,
    SUM(CASE WHEN `MELT_TIME (Melting Time)` IS NULL THEN 1 ELSE 0 END) AS MELT_TIME_missing,
    SUM(CASE WHEN `TA_TIME (Turn Around Time)` IS NULL THEN 1 ELSE 0 END) AS TA_TIME_missing,
    SUM(CASE WHEN `TT_TIME (Total Cycle Time Including Breakdown)` IS NULL THEN 1 ELSE 0 END) AS TT_TIME_missing,
    SUM(CASE WHEN POW_ON_TIME IS NULL THEN 1 ELSE 0 END) AS POW_ON_TIME_missing,
    SUM(CASE WHEN TAPPING_TIME IS NULL THEN 1 ELSE 0 END) AS TAPPING_TIME_missing,
    SUM(CASE WHEN ARCING_TIME IS NULL THEN 1 ELSE 0 END) AS ARCING_TIME_missing,
    SUM(CASE WHEN DOWN_TIME IS NULL THEN 1 ELSE 0 END) AS DOWN_TIME_missing,
    SUM(CASE WHEN `E1_CUR (Electrode 1 Current)` IS NULL THEN 1 ELSE 0 END) AS E1_CUR_missing,
    SUM(CASE WHEN `E2_CUR (Electrode 2 Current)` IS NULL THEN 1 ELSE 0 END) AS E2_CUR_missing,
    SUM(CASE WHEN `E3_CUR (Electrode 3 Current)` IS NULL THEN 1 ELSE 0 END) AS E3_CUR_missing,
    SUM(CASE WHEN `SPOUT (Bottom Refractory Temperature)` IS NULL THEN 1 ELSE 0 END) AS SPOUT_missing,
    SUM(CASE WHEN DOLOMIT IS NULL THEN 1 ELSE 0 END) AS DOLOMIT_missing,
    SUM(CASE WHEN CPC IS NULL THEN 1 ELSE 0 END) AS CPC_missing,
    SUM(CASE WHEN TEMPERATURE IS NULL THEN 1 ELSE 0 END) AS TEMPERATURE_missing,
    SUM(CASE WHEN POWER IS NULL THEN 1 ELSE 0 END) AS POWER_missing,
    SUM(CASE WHEN LAB_REP_TIME IS NULL THEN 1 ELSE 0 END) AS LAB_REP_TIME_missing,
    SUM(CASE WHEN C IS NULL THEN 1 ELSE 0 END) AS C_missing,
    SUM(CASE WHEN SI IS NULL THEN 1 ELSE 0 END) AS SI_missing,
    SUM(CASE WHEN MN IS NULL THEN 1 ELSE 0 END) AS MN_missing,
    SUM(CASE WHEN P IS NULL THEN 1 ELSE 0 END) AS P_missing,
    SUM(CASE WHEN S IS NULL THEN 1 ELSE 0 END) AS S_missing,
    SUM(CASE WHEN CU IS NULL THEN 1 ELSE 0 END) AS CU_missing,
    SUM(CASE WHEN CR IS NULL THEN 1 ELSE 0 END) AS CR_missing,
    SUM(CASE WHEN NI IS NULL THEN 1 ELSE 0 END) AS NI_missing,
    SUM(CASE WHEN N IS NULL THEN 1 ELSE 0 END) AS N_missing,
    SUM(CASE WHEN TIME_UTLN_PRCNT IS NULL THEN 1 ELSE 0 END) AS TIME_UTLN_PRCNT_missing,
    SUM(CASE WHEN TOP_COKE IS NULL THEN 1 ELSE 0 END) AS TOP_COKE_missing,
    SUM(CASE WHEN OPEN_C IS NULL THEN 1 ELSE 0 END) AS OPEN_C_missing,
    SUM(CASE WHEN TAP_C IS NULL THEN 1 ELSE 0 END) AS TAP_C_missing,
    SUM(CASE WHEN IT_KG IS NULL THEN 1 ELSE 0 END) AS IT_KG_missing,
    SUM(CASE WHEN BUCKET_NO IS NULL THEN 1 ELSE 0 END) AS BUCKET_NO_missing,
    SUM(CASE WHEN STATIC_WT IS NULL THEN 1 ELSE 0 END) AS STATIC_WT_missing,
    SUM(CASE WHEN LIME IS NULL THEN 1 ELSE 0 END) AS LIME_missing,
    SUM(CASE WHEN LIME2 IS NULL THEN 1 ELSE 0 END) AS LIME2_missing,
    SUM(CASE WHEN O2SIDE1 IS NULL THEN 1 ELSE 0 END) AS O2SIDE1_missing,
    SUM(CASE WHEN O2SIDE2 IS NULL THEN 1 ELSE 0 END) AS O2SIDE2_missing,
    SUM(CASE WHEN O2SIDE3 IS NULL THEN 1 ELSE 0 END) AS O2SIDE3_missing,
    SUM(CASE WHEN SPINNING IS NULL THEN 1 ELSE 0 END) AS SPINNING_missing,
    SUM(CASE WHEN RAMMING1 IS NULL THEN 1 ELSE 0 END) AS RAMMING1_missing,
    SUM(CASE WHEN RAMMING2 IS NULL THEN 1 ELSE 0 END) AS RAMMING2_missing,
    SUM(CASE WHEN PREV_TAP_TIME IS NULL THEN 1 ELSE 0 END) AS PREV_TAP_TIME_missing,
    SUM(CASE WHEN TAP_DURATION IS NULL THEN 1 ELSE 0 END) AS TAP_DURATION_missing,
    SUM(CASE WHEN Pour_Back_Metal IS NULL THEN 1 ELSE 0 END) AS Pour_Back_Metal_missing,
    SUM(CASE WHEN LM_WT IS NULL THEN 1 ELSE 0 END) AS LM_WT_missing,
    SUM(CASE WHEN `Production (MT)` IS NULL THEN 1 ELSE 0 END) AS Production_missing
FROM data_sett;


#replace missing values with a different value other than NULL in the future.
UPDATE data_sett
SET LAB_REP_TIME = COALESCE(LAB_REP_TIME, NULL),
    PREV_TAP_TIME = COALESCE(PREV_TAP_TIME, NULL);

#replace missing values with 0 in the Production (MT) column of your data_sett table:
UPDATE data_sett
SET `Production (MT)` = COALESCE(`Production (MT)`, 0);

















# drop zero columns
/*
ALTER TABLE data_set
DROP COLUMN COKE_REQ,
DROP COLUMN TP,
DROP COLUMN MSTB,
DROP COLUMN SHRAD,
DROP COLUMN REMET,
DROP COLUMN O2REQ,
DROP COLUMN ARCING_TIME,
DROP COLUMN DOWN_TIME,
DROP COLUMN DOLOMIT,
DROP COLUMN CPC,
DROP COLUMN TEMPERATURE,
DROP COLUMN POWER,
DROP COLUMN TIME_UTLN_PRCNT,
DROP COLUMN TOP_COKE,
DROP COLUMN LIME2,
DROP COLUMN SPINNING,
DROP COLUMN RAMMING1,
DROP COLUMN RAMMING2;
*/







