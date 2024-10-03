create database clean_opt_steel_manu;

use clean_opt_steel_manu;
select * from RAW;
desc RAW;
-- -------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
# 									TYPECASTING
##################################################################################################
/*
	Type Casting:
    DATETIME --> DATETIME POW_ON_TIME ---> DAATETIME TAPPING_TIME --> DATETIME
    LAB_REP_TIME --> DATETTIME PREV_TAP_TIME --> DATETIME
*/
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
update RAW set  datetime = str_to_date(datetime,'%d-%M-%y');
alter table RAW modify datetime date;

# %c: Month, numeric (0..12) 
# %e: Day of the month, numeric (0..31) 
# %Y: Year, numeric, four digits 
#%k: Hour (0..23) %i: Minutes, numeric (00..59)

update RAW set pow_on_time = STR_TO_DATE(pow_on_time, '%c/%e/%Y %k:%i'); 
alter table RAW modify pow_on_time datetime;

update RAW set tapping_time = str_to_date(tapping_time, '%c/%e/%Y %k:%i');
alter table RAW modify tapping_time datetime;

update RAW set lab_rep_time = str_to_date(lab_rep_time,'%c/%e/%Y %k:%i');
alter table RAW modify lab_rep_time datetime;

update RAW set prev_tap_time = str_to_date(prev_tap_time,'%c/%e/%Y %k:%i');
alter table RAW modify prev_tap_time datetime;
-- ------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------
#                	Duplicate Rows Identification       
###################################################################################################################
SELECT datetime, HEATNO, GRADE, SECTION_IC, lab_rep_time, INJ2_QTY, BSM, TP, MSTB, SKULL, SHRAD, REMET, BP, HBI, OTHERS, SCRAP_QTY, PIGIRON, DRI1_QTY, DRI2_QTY, TOT_DRI_QTY, HOT_METAL, 
Total_Charge, Hot_Heel, DOLO, DOLO1_EMPTY, TOT_LIME_QTY, TAP_TEMP,
 O2REQ, O2ACT, ENERGY, KWH_PER_TON, KWH_PER_MIN, MELT_TIME, 
 TA_TIME, TT_TIME, POW_ON_TIME, TAPPING_TIME, ARCING_TIME, DOWN_TIME, 
 E1_CUR, E2_CUR, E3_CUR, SPOUT,
 DOLOMIT, CPC, TEMPERATURE, POWER, LAB_REP_TIME, C, SI, MN, P, S, CU, CR, NI, N, TIME_UTLN_PRCNT, TOP_COKE, OPEN_C, TAP_C, IT_KG, BUCKET_NO, 
 STATIC_WT, LIME, LIME2, O2SIDE1, O2SIDE2, O2SIDE3, SPINNING, RAMMING1, RAMMING2, PREV_TAP_TIME, TAP_DURATION, Pour_Back_Metal, LM_WT, Production, COUNT(*) as duplicate_count 
FROM RAW 
GROUP BY datetime, HEATNO, GRADE, SECTION_IC, lab_rep_time, INJ2_QTY, BSM, TP, MSTB, SKULL, SHRAD, REMET, BP, HBI, OTHERS, SCRAP_QTY, PIGIRON, DRI1_QTY, DRI2_QTY, TOT_DRI_QTY, HOT_METAL, 
Total_Charge, Hot_Heel, DOLO, DOLO1_EMPTY, TOT_LIME_QTY, TAP_TEMP,
 O2REQ, O2ACT, ENERGY, KWH_PER_TON, KWH_PER_MIN, MELT_TIME, 
 TA_TIME, TT_TIME, POW_ON_TIME, TAPPING_TIME, ARCING_TIME, DOWN_TIME, 
 E1_CUR, E2_CUR, E3_CUR, SPOUT,
 DOLOMIT, CPC, TEMPERATURE, POWER, LAB_REP_TIME, C, SI, MN, P, S, CU, CR, NI, N, TIME_UTLN_PRCNT, TOP_COKE, OPEN_C, TAP_C, IT_KG, BUCKET_NO, 
 STATIC_WT, LIME, LIME2, O2SIDE1, O2SIDE2, O2SIDE3, SPINNING, RAMMING1, RAMMING2, PREV_TAP_TIME, TAP_DURATION, Pour_Back_Metal, LM_WT, Production
HAVING COUNT(*) > 1; # NO DUPLICATE ROWS FOUND
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
# 						DROPPING COLUMNS WITH 0 AS VALUES
#################################################################################################
ALTER TABLE TEMP_RAW
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



ALTER TABLE TEMP_RAW
RENAME COLUMN `SCRAP_QTY (MT)` TO SCRAP_QTY,
RENAME COLUMN `DRI1_QTY (MT) (Lumps)` TO DRI1_QTY,
RENAME COLUMN `DRI2_QTY
(MT) (Fines)` TO DRI2_QTY,
RENAME COLUMN `HOT_METAL (HOT Metal from MBF)` TO HOT_METAL,
RENAME COLUMN `Hot_Heel (Left Over Liquid metal in EAF)` TO Hot_Heel,
RENAME COLUMN `TAP_TEMP (Tappnig Temperature)` TO TAP_TEMP,
RENAME COLUMN `ENERGY (Energy Consumption)` TO ENERGY,
RENAME COLUMN `KWH_PER_TON (Energy Consumption Per Ton)` TO KWH_PER_TON,
RENAME COLUMN `MELT_TIME (Melting Time)` TO MELT_TIME,
RENAME COLUMN `TA_TIME (Turn Around Time)` TO TA_TIME,
RENAME COLUMN `TT_TIME (Total Cycle Time Including Breakdown)` TO TT_TIME,
RENAME COLUMN `E1_CUR (Electrode 1 Current)` TO E1_CUR,
RENAME COLUMN `E2_CUR (Electrode 2 Current)` TO E2_CUR,
RENAME COLUMN `E3_CUR (Electrode 3 Current)` TO E3_CUR,
RENAME COLUMN `SPOUT (Bottom Refractory Temperature)` TO SPOUT,
RENAME COLUMN `Production (MT)` TO Production,
RENAME COLUMN `total charge` TO Total_Charge;
ALTER TABLE temp_raw RENAME COLUMN `INJ1_QTY
(Coke Injection Qty)` TO INJ1_QTY;

ALTER TABLE temp_raw RENAME COLUMN `INJ2_QTY
(Coke Injection Qty)` TO INJ2_QTY;
##############################################################################################
CREATE TABLE TEMP_RAW AS SELECT * FROM RAW;
SELECT * FROM TEMP_RAW;
/*ALTER TABLE TEMP_RAW
DROP COLUMN COKE_REQ, DROP COLUMN TP, DROP COLUMN MSTB, DROP COLUMN SHRAD, DROP COLUMN REMET, DROP COLUMN PIGIRON,
DROP COLUMN O2REQ, DROP COLUMN KWH_PER_MIN, DROP COLUMN ARCING_TIME, DROP COLUMN DOWN_TIME, DROP COLUMN DOLOMIT, DROP COLUMN CPC,
DROP COLUMN TEMPERATURE, DROP COLUMN POWER, DROP COLUMN TIME_UTLN_PRCNT, DROP COLUMN TOP_COKE, DROP COLUMN LIME2, DROP COLUMN SPINNING,
DROP COLUMN RAMMING1, DROP COLUMN RAMMING2; */

-- ------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------
# 				IDENTIFYING MISSING VALUES 		
#######################################################################################################
SELECT 
	COUNT(*) AS total_rows,
    SUM(CASE WHEN SRNO IS NULL THEN 1 ELSE 0 END) AS SRNO_missing,
    SUM(CASE WHEN DATETIME IS NULL THEN 1 ELSE 0 END) AS DATETIME_missing,
    SUM(CASE WHEN HEATNO IS NULL THEN 1 ELSE 0 END) AS HEATNO_missing,
    SUM(CASE WHEN GRADE IS NULL THEN 1 ELSE 0 END) AS GRADE_missing,
    SUM(CASE WHEN SECTION_IC IS NULL THEN 1 ELSE 0 END) AS SECTION_IC_missing,
    SUM(CASE WHEN INJ1_QTY IS NULL THEN 1 ELSE 0 END) AS INJ1_QTY_missing,
    SUM(CASE WHEN INJ2_QTY IS NULL THEN 1 ELSE 0 END) AS INJ2_QTY_missing,
    SUM(CASE WHEN BSM IS NULL THEN 1 ELSE 0 END) AS BSM_missing,
    SUM(CASE WHEN SKULL IS NULL THEN 1 ELSE 0 END) AS SKULL_missing,
    SUM(CASE WHEN BP IS NULL THEN 1 ELSE 0 END) AS BP_missing,
    SUM(CASE WHEN HBI IS NULL THEN 1 ELSE 0 END) AS HBI_missing,
    SUM(CASE WHEN OTHERS IS NULL THEN 1 ELSE 0 END) AS OTHERS_missing,
    SUM(CASE WHEN SCRAP_QTY IS NULL THEN 1 ELSE 0 END) AS SCRAP_QTY_missing,
    SUM(CASE WHEN DRI1_QTY IS NULL THEN 1 ELSE 0 END) AS DRI1_QTY_missing,
    SUM(CASE WHEN DRI2_QTY IS NULL THEN 1 ELSE 0 END) AS DRI2_QTY_missing,
    SUM(CASE WHEN TOT_DRI_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_DRI_QTY_missing,
    SUM(CASE WHEN HOT_METAL IS NULL THEN 1 ELSE 0 END) AS HOT_METAL_missing,
    SUM(CASE WHEN Total_Charge IS NULL THEN 1 ELSE 0 END) AS Total_Charge_missing,
    SUM(CASE WHEN Hot_Heel IS NULL THEN 1 ELSE 0 END) AS Hot_Heel_missing,
    SUM(CASE WHEN DOLO IS NULL THEN 1 ELSE 0 END) AS DOLO_missing,
    SUM(CASE WHEN DOLO1_EMPTY IS NULL THEN 1 ELSE 0 END) AS DOLO1_EMPTY_missing,
    SUM(CASE WHEN TOT_LIME_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_LIME_QTY_missing,
    SUM(CASE WHEN TAP_TEMP IS NULL THEN 1 ELSE 0 END) AS TAP_TEMP_missing,
    SUM(CASE WHEN O2ACT IS NULL THEN 1 ELSE 0 END) AS O2ACT_missing,
    SUM(CASE WHEN ENERGY IS NULL THEN 1 ELSE 0 END) AS ENERGY_missing,
    SUM(CASE WHEN KWH_PER_TON IS NULL THEN 1 ELSE 0 END) AS KWH_PER_TON_missing,
    SUM(CASE WHEN MELT_TIME IS NULL THEN 1 ELSE 0 END) AS MELT_TIME_missing,
    SUM(CASE WHEN TA_TIME IS NULL THEN 1 ELSE 0 END) AS TA_TIME_missing,
    SUM(CASE WHEN TT_TIME IS NULL THEN 1 ELSE 0 END) AS TT_TIME_missing,
    SUM(CASE WHEN POW_ON_TIME IS NULL THEN 1 ELSE 0 END) AS POW_ON_TIME_missing,
    SUM(CASE WHEN TAPPING_TIME IS NULL THEN 1 ELSE 0 END) AS TAPPING_TIME_missing,
    SUM(CASE WHEN E1_CUR IS NULL THEN 1 ELSE 0 END) AS E1_CUR_missing,
    SUM(CASE WHEN E2_CUR IS NULL THEN 1 ELSE 0 END) AS E2_CUR_missing,
    SUM(CASE WHEN E3_CUR IS NULL THEN 1 ELSE 0 END) AS E3_CUR_missing,
    SUM(CASE WHEN SPOUT IS NULL THEN 1 ELSE 0 END) AS SPOUT_missing,
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
    SUM(CASE WHEN OPEN_C IS NULL THEN 1 ELSE 0 END) AS OPEN_C_missing,
    SUM(CASE WHEN TAP_C IS NULL THEN 1 ELSE 0 END) AS TAP_C_missing,
    SUM(CASE WHEN IT_KG IS NULL THEN 1 ELSE 0 END) AS IT_KG_missing,
    SUM(CASE WHEN BUCKET_NO IS NULL THEN 1 ELSE 0 END) AS BUCKET_NO_missing,
    SUM(CASE WHEN STATIC_WT IS NULL THEN 1 ELSE 0 END) AS STATIC_WT_missing,
    SUM(CASE WHEN LIME IS NULL THEN 1 ELSE 0 END) AS LIME_missing,
    SUM(CASE WHEN O2SIDE1 IS NULL THEN 1 ELSE 0 END) AS O2SIDE1_missing,
    SUM(CASE WHEN O2SIDE2 IS NULL THEN 1 ELSE 0 END) AS O2SIDE2_missing,
    SUM(CASE WHEN O2SIDE3 IS NULL THEN 1 ELSE 0 END) AS O2SIDE3_missing,
    SUM(CASE WHEN PREV_TAP_TIME IS NULL THEN 1 ELSE 0 END) AS PREV_TAP_TIME_missing,
    SUM(CASE WHEN TAP_DURATION IS NULL THEN 1 ELSE 0 END) AS TAP_DURATION_missing,
    SUM(CASE WHEN Pour_Back_Metal IS NULL THEN 1 ELSE 0 END) AS Pour_Back_Metal_missing,
    SUM(CASE WHEN LM_WT IS NULL THEN 1 ELSE 0 END) AS LM_WT_missing,
    SUM(CASE WHEN Production IS NULL THEN 1 ELSE 0 END) AS Production_missing
FROM TEMP_RAW;  # # columns with < 1% Missing Values 





-- ------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------
# 									Outliers Detection AND Outliers Treatment
###########################################################################################################

SET SQL_SAFE_UPDATES = 0;

WITH Ordered AS (
    SELECT  INJ1_QTY, ROW_NUMBER() OVER (ORDER BY INJ1_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT INJ1_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN INJ1_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN INJ1_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE INJ1_QTY < (Q1 - 1.5 * IQR) OR INJ1_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET INJ1_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE INJ1_QTY < (Q1 - 1.5 * IQR) OR INJ1_QTY > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  INJ2_QTY, ROW_NUMBER() OVER (ORDER BY INJ2_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT INJ2_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN INJ2_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN INJ2_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE INJ2_QTY < (Q1 - 1.5 * IQR) OR INJ2_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET INJ2_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE INJ2_QTY < (Q1 - 1.5 * IQR) OR INJ2_QTY > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  BSM, ROW_NUMBER() OVER (ORDER BY BSM) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT BSM, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN BSM ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN BSM ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE BSM < (Q1 - 1.5 * IQR) OR BSM > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET BSM = (Q1 + Q3) / 2  -- Replacing with median
WHERE BSM < (Q1 - 1.5 * IQR) OR BSM > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  SKULL, ROW_NUMBER() OVER (ORDER BY SKULL) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT SKULL, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN SKULL ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN SKULL ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE SKULL < (Q1 - 1.5 * IQR) OR SKULL > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET SKULL = (Q1 + Q3) / 2  -- Replacing with median
WHERE SKULL < (Q1 - 1.5 * IQR) OR SKULL > (Q3 + 1.5 * IQR);
-- ----------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  BP, ROW_NUMBER() OVER (ORDER BY BP) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT BP, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN BP ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN BP ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE BP < (Q1 - 1.5 * IQR) OR BP > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET BP = (Q1 + Q3) / 2  -- Replacing with median
WHERE BP < (Q1 - 1.5 * IQR) OR BP > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  HBI, ROW_NUMBER() OVER (ORDER BY HBI) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT HBI, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN HBI ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN HBI ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE HBI < (Q1 - 1.5 * IQR) OR HBI > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET HBI = (Q1 + Q3) / 2  -- Replacing with median
WHERE HBI < (Q1 - 1.5 * IQR) OR HBI > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  OTHERS, ROW_NUMBER() OVER (ORDER BY OTHERS) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT OTHERS, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN OTHERS ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN OTHERS ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE OTHERS < (Q1 - 1.5 * IQR) OR OTHERS > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET OTHERS = (Q1 + Q3) / 2  -- Replacing with median
WHERE OTHERS < (Q1 - 1.5 * IQR) OR OTHERS > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  SCRAP_QTY, ROW_NUMBER() OVER (ORDER BY SCRAP_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT SCRAP_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN SCRAP_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN SCRAP_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE SCRAP_QTY < (Q1 - 1.5 * IQR) OR SCRAP_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET SCRAP_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE SCRAP_QTY < (Q1 - 1.5 * IQR) OR SCRAP_QTY > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  DRI1_QTY, ROW_NUMBER() OVER (ORDER BY DRI1_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT DRI1_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN DRI1_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN DRI1_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE DRI1_QTY < (Q1 - 1.5 * IQR) OR DRI1_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET DRI1_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE DRI1_QTY < (Q1 - 1.5 * IQR) OR DRI1_QTY > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  DRI2_QTY, ROW_NUMBER() OVER (ORDER BY DRI2_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT DRI2_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN DRI2_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN DRI2_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE DRI2_QTY < (Q1 - 1.5 * IQR) OR DRI2_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET DRI2_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE DRI2_QTY < (Q1 - 1.5 * IQR) OR DRI2_QTY > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TOT_DRI_QTY, ROW_NUMBER() OVER (ORDER BY TOT_DRI_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TOT_DRI_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TOT_DRI_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TOT_DRI_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TOT_DRI_QTY < (Q1 - 1.5 * IQR) OR TOT_DRI_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TOT_DRI_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE TOT_DRI_QTY < (Q1 - 1.5 * IQR) OR TOT_DRI_QTY > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------
WITH Ordered AS (
    SELECT  HOT_METAL, ROW_NUMBER() OVER (ORDER BY HOT_METAL) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT HOT_METAL, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN HOT_METAL ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN HOT_METAL ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE HOT_METAL < (Q1 - 1.5 * IQR) OR HOT_METAL > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET HOT_METAL = (Q1 + Q3) / 2  -- Replacing with median
WHERE HOT_METAL < (Q1 - 1.5 * IQR) OR HOT_METAL > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TOTAL_CHARGE, ROW_NUMBER() OVER (ORDER BY TOTAL_CHARGE) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TOTAL_CHARGE, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TOTAL_CHARGE ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TOTAL_CHARGE ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TOTAL_CHARGE < (Q1 - 1.5 * IQR) OR TOTAL_CHARGE > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TOTAL_CHARGE = (Q1 + Q3) / 2  -- Replacing with median
WHERE TOTAL_CHARGE < (Q1 - 1.5 * IQR) OR TOTAL_CHARGE > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  HOT_HEEL, ROW_NUMBER() OVER (ORDER BY HOT_HEEL) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT HOT_HEEL, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN HOT_HEEL ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN HOT_HEEL ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE HOT_HEEL < (Q1 - 1.5 * IQR) OR HOT_HEEL > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET HOT_HEEL = (Q1 + Q3) / 2  -- Replacing with median
WHERE HOT_HEEL < (Q1 - 1.5 * IQR) OR HOT_HEEL > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  DOLO, ROW_NUMBER() OVER (ORDER BY DOLO) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT DOLO, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN DOLO ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN DOLO ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE DOLO < (Q1 - 1.5 * IQR) OR DOLO > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET DOLO = (Q1 + Q3) / 2  -- Replacing with median
WHERE DOLO < (Q1 - 1.5 * IQR) OR DOLO > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  DOLO1_EMPTY, ROW_NUMBER() OVER (ORDER BY DOLO1_EMPTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT DOLO1_EMPTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN DOLO1_EMPTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN DOLO1_EMPTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE DOLO1_EMPTY < (Q1 - 1.5 * IQR) OR DOLO1_EMPTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET DOLO1_EMPTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE DOLO1_EMPTY < (Q1 - 1.5 * IQR) OR DOLO1_EMPTY > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TOT_LIME_QTY, ROW_NUMBER() OVER (ORDER BY TOT_LIME_QTY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TOT_LIME_QTY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TOT_LIME_QTY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TOT_LIME_QTY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TOT_LIME_QTY < (Q1 - 1.5 * IQR) OR TOT_LIME_QTY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TOT_LIME_QTY = (Q1 + Q3) / 2  -- Replacing with median
WHERE TOT_LIME_QTY < (Q1 - 1.5 * IQR) OR TOT_LIME_QTY > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  O2ACT, ROW_NUMBER() OVER (ORDER BY O2ACT) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT O2ACT, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN O2ACT ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN O2ACT ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE O2ACT < (Q1 - 1.5 * IQR) OR O2ACT > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET O2ACT = (Q1 + Q3) / 2  -- Replacing with median
WHERE O2ACT < (Q1 - 1.5 * IQR) OR O2ACT > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  ENERGY, ROW_NUMBER() OVER (ORDER BY ENERGY) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT ENERGY, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN ENERGY ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN ENERGY ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE ENERGY < (Q1 - 1.5 * IQR) OR ENERGY > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET ENERGY = (Q1 + Q3) / 2  -- Replacing with median
WHERE ENERGY < (Q1 - 1.5 * IQR) OR ENERGY > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  KWH_PER_TON, ROW_NUMBER() OVER (ORDER BY KWH_PER_TON) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT KWH_PER_TON, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN KWH_PER_TON ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN KWH_PER_TON ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE KWH_PER_TON < (Q1 - 1.5 * IQR) OR KWH_PER_TON > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET KWH_PER_TON = (Q1 + Q3) / 2  -- Replacing with median
WHERE KWH_PER_TON < (Q1 - 1.5 * IQR) OR KWH_PER_TON > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  MELT_TIME, ROW_NUMBER() OVER (ORDER BY MELT_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT MELT_TIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN MELT_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN MELT_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE MELT_TIME < (Q1 - 1.5 * IQR) OR MELT_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET MELT_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE MELT_TIME < (Q1 - 1.5 * IQR) OR MELT_TIME > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TA_TIME, ROW_NUMBER() OVER (ORDER BY TA_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TA_TIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TA_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TA_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TA_TIME < (Q1 - 1.5 * IQR) OR TA_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TA_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE TA_TIME < (Q1 - 1.5 * IQR) OR TA_TIME > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TT_TIME, ROW_NUMBER() OVER (ORDER BY TT_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TT_TIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TT_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TT_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TT_TIME < (Q1 - 1.5 * IQR) OR TT_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TT_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE TT_TIME < (Q1 - 1.5 * IQR) OR TT_TIME > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  POW_ON_TIME, ROW_NUMBER() OVER (ORDER BY POW_ON_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT POW_ON_TIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN POW_ON_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN POW_ON_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE POW_ON_TIME < (Q1 - 1.5 * IQR) OR POW_ON_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET POW_ON_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE POW_ON_TIME < (Q1 - 1.5 * IQR) OR POW_ON_TIME > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  TAPPING_TIME, ROW_NUMBER() OVER (ORDER BY TAPPING_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TAPPING_TIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TAPPING_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TAPPING_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TAPPING_TIME < (Q1 - 1.5 * IQR) OR TAPPING_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TAPPING_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE TAPPING_TIME < (Q1 - 1.5 * IQR) OR TAPPING_TIME > (Q3 + 1.5 * IQR);
-- ----------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  E1_CUR, ROW_NUMBER() OVER (ORDER BY E1_CUR) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT E1_CUR, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN E1_CUR ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN E1_CUR ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE E1_CUR < (Q1 - 1.5 * IQR) OR E1_CUR > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET E1_CUR = (Q1 + Q3) / 2  -- Replacing with median
WHERE E1_CUR < (Q1 - 1.5 * IQR) OR E1_CUR > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  E2_CUR, ROW_NUMBER() OVER (ORDER BY E2_CUR) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT E2_CUR, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN E2_CUR ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN E2_CUR ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE E2_CUR < (Q1 - 1.5 * IQR) OR E2_CUR > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET E2_CUR = (Q1 + Q3) / 2  -- Replacing with median
WHERE E2_CUR < (Q1 - 1.5 * IQR) OR E2_CUR > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  E3_CUR, ROW_NUMBER() OVER (ORDER BY E3_CUR) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT E3_CUR, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN E3_CUR ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN E3_CUR ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE E3_CUR < (Q1 - 1.5 * IQR) OR E3_CUR > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET E3_CUR = (Q1 + Q3) / 2  -- Replacing with median
WHERE E3_CUR < (Q1 - 1.5 * IQR) OR E3_CUR > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  SPOUT, ROW_NUMBER() OVER (ORDER BY SPOUT) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT SPOUT, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN SPOUT ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN SPOUT ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE SPOUT < (Q1 - 1.5 * IQR) OR SPOUT > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET SPOUT = (Q1 + Q3) / 2  -- Replacing with median
WHERE SPOUT < (Q1 - 1.5 * IQR) OR SPOUT > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  C, ROW_NUMBER() OVER (ORDER BY C) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT C, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN C ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN C ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE C < (Q1 - 1.5 * IQR) OR C > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET C = (Q1 + Q3) / 2  -- Replacing with median
WHERE C < (Q1 - 1.5 * IQR) OR C > (Q3 + 1.5 * IQR);
-- -------------------------------- ------------------------ ---------------------------  ----------------------------------------
WITH Ordered AS (
    SELECT  lab_rep_time, ROW_NUMBER() OVER (ORDER BY lab_rep_time) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT lab_rep_time, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN lab_rep_time ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN lab_rep_time ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE lab_rep_time < (Q1 - 1.5 * IQR) OR lab_rep_time > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET lab_rep_time = (Q1 + Q3) / 2  -- Replacing with median
WHERE lab_rep_time < (Q1 - 1.5 * IQR) OR lab_rep_time > (Q3 + 1.5 * IQR); # No outliers detected missing values can be filled with mean [LAB_REP_TIME]
-- ------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  SI, ROW_NUMBER() OVER (ORDER BY SI) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT SI, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN SI ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN SI ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE SI < (Q1 - 1.5 * IQR) OR SI > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET SI = (Q1 + Q3) / 2  -- Replacing with median
WHERE SI < (Q1 - 1.5 * IQR) OR SI > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  MN, ROW_NUMBER() OVER (ORDER BY MN) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT MN, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN MN ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN MN ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE MN < (Q1 - 1.5 * IQR) OR MN > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET MN = (Q1 + Q3) / 2  -- Replacing with median
WHERE MN < (Q1 - 1.5 * IQR) OR MN > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------
WITH Ordered AS (
    SELECT  P, ROW_NUMBER() OVER (ORDER BY P) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT P, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN P ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN P ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE P < (Q1 - 1.5 * IQR) OR P > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET P = (Q1 + Q3) / 2  -- Replacing with median
WHERE P < (Q1 - 1.5 * IQR) OR P > (Q3 + 1.5 * IQR);

WITH Ordered AS (
    SELECT  S, ROW_NUMBER() OVER (ORDER BY S) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT S, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN S ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN S ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE S < (Q1 - 1.5 * IQR) OR S > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET S = (Q1 + Q3) / 2  -- Replacing with median
WHERE S < (Q1 - 1.5 * IQR) OR S > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  CU, ROW_NUMBER() OVER (ORDER BY CU) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT CU, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN CU ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN CU ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE CU < (Q1 - 1.5 * IQR) OR CU > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET CU = (Q1 + Q3) / 2  -- Replacing with median
WHERE CU < (Q1 - 1.5 * IQR) OR CU > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  CR, ROW_NUMBER() OVER (ORDER BY CR) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT CR, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN CR ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN CR ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_CalCRlation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_CalCRlation
WHERE CR < (Q1 - 1.5 * IQR) OR CR > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_CalCRlation
SET CR = (Q1 + Q3) / 2  -- Replacing with median
WHERE CR < (Q1 - 1.5 * IQR) OR CR > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  NI, ROW_NUMBER() OVER (ORDER BY NI) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT NI, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN NI ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN NI ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE NI < (Q1 - 1.5 * IQR) OR NI > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET NI = (Q1 + Q3) / 2  -- Replacing with median
WHERE NI < (Q1 - 1.5 * IQR) OR NI > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT  N, ROW_NUMBER() OVER (ORDER BY N) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT N, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN N ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN N ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE N < (Q1 - 1.5 * IQR) OR N > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET N = (Q1 + Q3) / 2  -- Replacing with median
WHERE N < (Q1 - 1.5 * IQR) OR N > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------
WITH Ordered AS (
    SELECT OPEN_C, ROW_NUMBER() OVER (ORDER BY OPEN_C) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT OPEN_C, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN OPEN_C ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN OPEN_C ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE OPEN_C < (Q1 - 1.5 * IQR) OR OPEN_C > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET OPEN_C = (Q1 + Q3) / 2  -- Replacing with median
WHERE OPEN_C < (Q1 - 1.5 * IQR) OR OPEN_C > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------
WITH Ordered AS (
    SELECT TAP_C, ROW_NUMBER() OVER (ORDER BY TAP_C) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TAP_C, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TAP_C ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TAP_C ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TAP_C < (Q1 - 1.5 * IQR) OR TAP_C > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TAP_C = (Q1 + Q3) / 2  -- Replacing with median
WHERE TAP_C < (Q1 - 1.5 * IQR) OR TAP_C > (Q3 + 1.5 * IQR);
-- --------------------------------------------------------------------------
WITH Ordered AS (
    SELECT IT_KG, ROW_NUMBER() OVER (ORDER BY IT_KG) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT IT_KG, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN IT_KG ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN IT_KG ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE IT_KG < (Q1 - 1.5 * IQR) OR IT_KG > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET IT_KG = (Q1 + Q3) / 2  -- Replacing with median
WHERE IT_KG < (Q1 - 1.5 * IQR) OR IT_KG > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT BUCKET_NO, ROW_NUMBER() OVER (ORDER BY BUCKET_NO) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT BUCKET_NO, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN BUCKET_NO ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN BUCKET_NO ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE BUCKET_NO < (Q1 - 1.5 * IQR) OR BUCKET_NO > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET BUCKET_NO = (Q1 + Q3) / 2  -- Replacing with median
WHERE BUCKET_NO < (Q1 - 1.5 * IQR) OR BUCKET_NO > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT STATIC_WT, ROW_NUMBER() OVER (ORDER BY STATIC_WT) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT STATIC_WT, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN STATIC_WT ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN STATIC_WT ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE STATIC_WT < (Q1 - 1.5 * IQR) OR STATIC_WT > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET STATIC_WT = (Q1 + Q3) / 2  -- Replacing with median
WHERE STATIC_WT < (Q1 - 1.5 * IQR) OR STATIC_WT > (Q3 + 1.5 * IQR);
-- -------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT LIME, ROW_NUMBER() OVER (ORDER BY LIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT LIME, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN LIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN LIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE LIME < (Q1 - 1.5 * IQR) OR LIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET LIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE LIME < (Q1 - 1.5 * IQR) OR LIME > (Q3 + 1.5 * IQR);
-- ---------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT O2SIDE1, ROW_NUMBER() OVER (ORDER BY O2SIDE1) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT O2SIDE1, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN O2SIDE1 ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN O2SIDE1 ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE O2SIDE1 < (Q1 - 1.5 * IQR) OR O2SIDE1 > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET O2SIDE1 = (Q1 + Q3) / 2  -- Replacing with median
WHERE O2SIDE1 < (Q1 - 1.5 * IQR) OR O2SIDE1 > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT O2SIDE2, ROW_NUMBER() OVER (ORDER BY O2SIDE2) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT O2SIDE2, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN O2SIDE2 ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN O2SIDE2 ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE O2SIDE2 < (Q1 - 1.5 * IQR) OR O2SIDE2 > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET O2SIDE2 = (Q1 + Q3) / 2  -- Replacing with median
WHERE O2SIDE2 < (Q1 - 1.5 * IQR) OR O2SIDE2 > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT O2SIDE3, ROW_NUMBER() OVER (ORDER BY O2SIDE3) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT O2SIDE3, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN O2SIDE3 ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN O2SIDE3 ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE O2SIDE3 < (Q1 - 1.5 * IQR) OR O2SIDE3 > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET O2SIDE3 = (Q1 + Q3) / 2  -- Replacing with median
WHERE O2SIDE3 < (Q1 - 1.5 * IQR) OR O2SIDE3 > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT TAP_DURATION, ROW_NUMBER() OVER (ORDER BY TAP_DURATION) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT TAP_DURATION, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN TAP_DURATION ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN TAP_DURATION ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE TAP_DURATION < (Q1 - 1.5 * IQR) OR TAP_DURATION > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET TAP_DURATION = (Q1 + Q3) / 2  -- Replacing with median
WHERE TAP_DURATION < (Q1 - 1.5 * IQR) OR TAP_DURATION > (Q3 + 1.5 * IQR);
-- ----------------------------------------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT POUR_BACK_METAL, ROW_NUMBER() OVER (ORDER BY POUR_BACK_METAL) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT POUR_BACK_METAL, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN POUR_BACK_METAL ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN POUR_BACK_METAL ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE POUR_BACK_METAL < (Q1 - 1.5 * IQR) OR POUR_BACK_METAL > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET POUR_BACK_METAL = (Q1 + Q3) / 2  -- Replacing with median
WHERE POUR_BACK_METAL < (Q1 - 1.5 * IQR) OR POUR_BACK_METAL > (Q3 + 1.5 * IQR);
-- -----------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT LM_WT, ROW_NUMBER() OVER (ORDER BY LM_WT) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT LM_WT, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN LM_WT ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN LM_WT ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT  Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers as (
SELECT *
FROM TEMP_RAW CROSS JOIN IQR_Calculation
WHERE LM_WT < (Q1 - 1.5 * IQR) OR LM_WT > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET LM_WT = (Q1 + Q3) / 2  -- Replacing with median
WHERE LM_WT < (Q1 - 1.5 * IQR) OR LM_WT > (Q3 + 1.5 * IQR);
-- ------------------------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT PREV_TAP_TIME, ROW_NUMBER() OVER (ORDER BY PREV_TAP_TIME) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT 
        PREV_TAP_TIME, total_rows, row_num, 
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN PREV_TAP_TIME ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN PREV_TAP_TIME ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers AS (
    SELECT *
    FROM TEMP_RAW
    CROSS JOIN IQR_Calculation
    WHERE PREV_TAP_TIME < (Q1 - 1.5 * IQR) OR PREV_TAP_TIME > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET PREV_TAP_TIME = (Q1 + Q3) / 2  -- Replacing with median
WHERE PREV_TAP_TIME < (Q1 - 1.5 * IQR) OR PREV_TAP_TIME > (Q3 + 1.5 * IQR); # NO outliers detected missing values can be replaced with mean [PREV_TAP_TIME]
-- -------------------------------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT Production, ROW_NUMBER() OVER (ORDER BY Production) AS row_num, COUNT(*) OVER () AS total_rows
    FROM TEMP_RAW ),
Quartiles AS (
    SELECT Production, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Production ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Production ELSE NULL END AS Q3
    FROM Ordered ),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles ),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3 ),
Outliers AS (
    SELECT *
    FROM TEMP_RAW
    CROSS JOIN IQR_Calculation
    WHERE Production < (Q1 - 1.5 * IQR) OR Production > (Q3 + 1.5 * IQR)
)
UPDATE TEMP_RAW
CROSS JOIN IQR_Calculation
SET Production = (Q1 + Q3) / 2  -- Replacing with median
WHERE Production < (Q1 - 1.5 * IQR) OR Production > (Q3 + 1.5 * IQR); # Found 83 effected records and replace values with median [Production]
-- ------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
# 									HANDLING THE MISSING VALUES
######################################################################################
/* #Replacing LAB_REP_TIME missing values with mean because in that column there are no outliers 
SET @MEANVAR = (SELECT AVG(LAB_REP_TIME) FROM TEMP_RAW WHERE LAB_REP_TIME IS NOT NULL);
SET @MEAN2VAR = (SELECT AVG(PREV_TAP_TIME) FROM TEMP_RAW WHERE PREV_TAP_TIME IS NOT NULL); */
#REPLACLING 
UPDATE TEMP_RAW
SET LAB_REP_TIME = COALESCE(LAB_REP_TIME, NULL);
UPDATE TEMP_RAW 
SET PREV_TAP_TIME = COALESCE(PREV_TAP_TIME, NULL);

#replacing missing values with 0 in the Production (MT) column:
UPDATE TEMP_RAW
SET Production = COALESCE(Production, 0);

SELECT * FROM TEMP_RAW;
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
# 						PERFORMING EXPLORATORY DATA ANALYSIS AFTER CLEANING
##########################################################################################################
# 				ALL FOUR BUSINESS MOMENTS
#################################################################################### 
-- Created Stored Procedure for Mean , Mode, Standard deviation, Variance, Skewness, Kurtosis

delimiter //

create procedure stats_query(in column_name varchar(255))
begin
    set @sql = concat(
        'select
            ''', column_name, ''' as column_name,
            avg(', column_name, ') as mean,
            (
                select ', column_name, '
                from TEMP_RAW
                group by ', column_name, '
                order by count(*) desc, ', column_name, ' asc
                limit 1
            ) as mode,
            stddev(', column_name, ') as stddev,
            variance(', column_name, ') as variance,
            max(', column_name, ') - min(', column_name, ') as range_value,
            (sum(pow(', column_name, ' - (select avg(', column_name, ') from TEMP_RAW), 3)) / count(*)) / pow(stddev(', column_name, '), 3) as skewness,
            (sum(pow(', column_name, ' - (select avg(', column_name, ') from TEMP_RAW), 4)) / count(*)) / pow(variance(', column_name, '), 2) as kurtosis
        from TEMP_RAW'
    );

    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
end//

delimiter ;

-- Created Stored Procedure for Median 

DELIMITER //

create procedure med_query(in column_name varchar(255))
begin
    set @sql = concat(
        'select
            avg(subquery.', column_name, ') as median
        from (
            select
                ', column_name, ',
                row_number() over (order by ', column_name, ') as rn,
                count(*) over () as cnt
            from TEMP_RAW
        ) as subquery
        where
            rn IN ((cnt + 1) / 2, (cnt + 2) / 2)'
    );

    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
end //

DELIMITER ;
-- --------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------
# 									NORMALIZATION
###########################################################################################################################

CREATE TABLE scaled1 AS
SELECT
    CASE WHEN (MAX(INJ1_QTY) OVER () - MIN(INJ1_QTY) OVER ()) = 0 THEN 0 ELSE (INJ1_QTY - MIN(INJ1_QTY) OVER ()) / (MAX(INJ1_QTY) OVER () - MIN(INJ1_QTY) OVER ()) END AS scaled_INJ1_QTY,
    CASE WHEN (MAX(INJ2_QTY) OVER () - MIN(INJ2_QTY) OVER ()) = 0 THEN 0 ELSE (INJ2_QTY - MIN(INJ2_QTY) OVER ()) / (MAX(INJ2_QTY) OVER () - MIN(INJ2_QTY) OVER ()) END AS scaled_INJ2_QTY,
    CASE WHEN (MAX(DRI1_QTY) OVER () - MIN(DRI1_QTY) OVER ()) = 0 THEN 0 ELSE (DRI1_QTY - MIN(DRI1_QTY) OVER ()) / (MAX(DRI1_QTY) OVER () - MIN(DRI1_QTY) OVER ()) END AS scaled_DRI1_QTY,
    CASE WHEN (MAX(DRI2_QTY) OVER () - MIN(DRI2_QTY) OVER ()) = 0 THEN 0 ELSE (DRI2_QTY - MIN(DRI2_QTY) OVER ()) / (MAX(DRI2_QTY) OVER () - MIN(DRI2_QTY) OVER ()) END AS scaled_DRI2_QTY,
    CASE WHEN (MAX(TOT_DRI_QTY) OVER () - MIN(TOT_DRI_QTY) OVER ()) = 0 THEN 0 ELSE (TOT_DRI_QTY - MIN(TOT_DRI_QTY) OVER ()) / (MAX(TOT_DRI_QTY) OVER () - MIN(TOT_DRI_QTY) OVER ()) END AS scaled_TOT_DRI_QTY,
    CASE WHEN (MAX(HOT_METAL) OVER () - MIN(HOT_METAL) OVER ()) = 0 THEN 0 ELSE (HOT_METAL - MIN(HOT_METAL) OVER ()) / (MAX(HOT_METAL) OVER () - MIN(HOT_METAL) OVER ()) END AS scaled_HOT_METAL,
    CASE WHEN (MAX(Total_Charge) OVER () - MIN(Total_Charge) OVER ()) = 0 THEN 0 ELSE (Total_Charge - MIN(Total_Charge) OVER ()) / (MAX(Total_Charge) OVER () - MIN(Total_Charge) OVER ()) END AS scaled_Total_Charge,
    CASE WHEN (MAX(Hot_Heel) OVER () - MIN(Hot_Heel) OVER ()) = 0 THEN 0 ELSE (Hot_Heel - MIN(Hot_Heel) OVER ()) / (MAX(Hot_Heel) OVER () - MIN(Hot_Heel) OVER ()) END AS scaled_Hot_Heel,
    CASE WHEN (MAX(DOLO) OVER () - MIN(DOLO) OVER ()) = 0 THEN 0 ELSE (DOLO - MIN(DOLO) OVER ()) / (MAX(DOLO) OVER () - MIN(DOLO) OVER ()) END AS scaled_DOLO,
    CASE WHEN (MAX(DOLO1_EMPTY) OVER () - MIN(DOLO1_EMPTY) OVER ()) = 0 THEN 0 ELSE (DOLO1_EMPTY - MIN(DOLO1_EMPTY) OVER ()) / (MAX(DOLO1_EMPTY) OVER () - MIN(DOLO1_EMPTY) OVER ()) END AS scaled_DOLO1_EMPTY,
    CASE WHEN (MAX(TOT_LIME_QTY) OVER () - MIN(TOT_LIME_QTY) OVER ()) = 0 THEN 0 ELSE (TOT_LIME_QTY - MIN(TOT_LIME_QTY) OVER ()) / (MAX(TOT_LIME_QTY) OVER () - MIN(TOT_LIME_QTY) OVER ()) END AS scaled_TOT_LIME_QTY,
    CASE WHEN (MAX(O2ACT) OVER () - MIN(O2ACT) OVER ()) = 0 THEN 0 ELSE (O2ACT - MIN(O2ACT) OVER ()) / (MAX(O2ACT) OVER () - MIN(O2ACT) OVER ()) END AS scaled_O2ACT,
    CASE WHEN (MAX(ENERGY) OVER () - MIN(ENERGY) OVER ()) = 0 THEN 0 ELSE (ENERGY - MIN(ENERGY) OVER ()) / (MAX(ENERGY) OVER () - MIN(ENERGY) OVER ()) END AS scaled_ENERGY,
    CASE WHEN (MAX(KWH_PER_TON) OVER () - MIN(KWH_PER_TON) OVER ()) = 0 THEN 0 ELSE (KWH_PER_TON - MIN(KWH_PER_TON) OVER ()) / (MAX(KWH_PER_TON) OVER () - MIN(KWH_PER_TON) OVER ()) END AS scaled_KWH_PER_TON,
    CASE WHEN (MAX(MELT_TIME) OVER () - MIN(MELT_TIME) OVER ()) = 0 THEN 0 ELSE (MELT_TIME - MIN(MELT_TIME) OVER ()) / (MAX(MELT_TIME) OVER () - MIN(MELT_TIME) OVER ()) END AS scaled_MELT_TIME,
    CASE WHEN (MAX(TA_TIME) OVER () - MIN(TA_TIME) OVER ()) = 0 THEN 0 ELSE (TA_TIME - MIN(TA_TIME) OVER ()) / (MAX(TA_TIME) OVER () - MIN(TA_TIME) OVER ()) END AS scaled_TA_TIME,
    CASE WHEN (MAX(TT_TIME) OVER () - MIN(TT_TIME) OVER ()) = 0 THEN 0 ELSE (TT_TIME - MIN(TT_TIME) OVER ()) / (MAX(TT_TIME) OVER () - MIN(TT_TIME) OVER ()) END AS scaled_TT_TIME,
    CASE WHEN (MAX(E1_CUR) OVER () - MIN(E1_CUR) OVER ()) = 0 THEN 0 ELSE (E1_CUR - MIN(E1_CUR) OVER ()) / (MAX(E1_CUR) OVER () - MIN(E1_CUR) OVER ()) END AS scaled_E1_CUR,
    CASE WHEN (MAX(E2_CUR) OVER () - MIN(E2_CUR) OVER ()) = 0 THEN 0 ELSE (E2_CUR - MIN(E2_CUR) OVER ()) / (MAX(E2_CUR) OVER () - MIN(E2_CUR) OVER ()) END AS scaled_E2_CUR,
    CASE WHEN (MAX(E3_CUR) OVER () - MIN(E3_CUR) OVER ()) = 0 THEN 0 ELSE (E3_CUR - MIN(E3_CUR) OVER ()) / (MAX(E3_CUR) OVER () - MIN(E3_CUR) OVER ()) END AS scaled_E3_CUR
FROM TEMP_RAW;
CREATE TABLE SCALED2
SELECT	
	CASE WHEN (MAX(SPOUT) OVER () - MIN(SPOUT) OVER ()) = 0 THEN 0 ELSE (SPOUT - MIN(SPOUT) OVER ()) / (MAX(SPOUT) OVER () - MIN(SPOUT) OVER ()) END AS scaled_SPOUT,
    CASE WHEN (MAX(C) OVER () - MIN(C) OVER ()) = 0 THEN 0 ELSE (C - MIN(C) OVER ()) / (MAX(C) OVER () - MIN(C) OVER ()) END AS scaled_C,
    CASE WHEN (MAX(SI) OVER () - MIN(SI) OVER ()) = 0 THEN 0 ELSE (SI - MIN(SI) OVER ()) / (MAX(SI) OVER () - MIN(SI) OVER ()) END AS scaled_SI,
    CASE WHEN (MAX(MN) OVER () - MIN(MN) OVER ()) = 0 THEN 0 ELSE (MN - MIN(MN) OVER ()) / (MAX(MN) OVER () - MIN(MN) OVER ()) END AS scaled_MN,
    CASE WHEN (MAX(P) OVER () - MIN(P) OVER ()) = 0 THEN 0 ELSE (P - MIN(P) OVER ()) / (MAX(P) OVER () - MIN(P) OVER ()) END AS scaled_P,
    CASE WHEN (MAX(S) OVER () - MIN(S) OVER ()) = 0 THEN 0 ELSE (S - MIN(S) OVER ()) / (MAX(S) OVER () - MIN(S) OVER ()) END AS scaled_S,
    CASE WHEN (MAX(CU) OVER () - MIN(CU) OVER ()) = 0 THEN 0 ELSE (CU - MIN(CU) OVER ()) / (MAX(CU) OVER () - MIN(CU) OVER ()) END AS scaled_CU,
    CASE WHEN (MAX(CR) OVER () - MIN(CR) OVER ()) = 0 THEN 0 ELSE (CR - MIN(CR) OVER ()) / (MAX(CR) OVER () - MIN(CR) OVER ()) END AS scaled_CR,
    CASE WHEN (MAX(NI) OVER () - MIN(NI) OVER ()) = 0 THEN 0 ELSE (NI - MIN(NI) OVER ()) / (MAX(NI) OVER () - MIN(NI) OVER ()) END AS scaled_NI,
    CASE WHEN (MAX(N) OVER () - MIN(N) OVER ()) = 0 THEN 0 ELSE (N - MIN(N) OVER ()) / (MAX(N) OVER () - MIN(N) OVER ()) END AS scaled_N,
    CASE WHEN (MAX(OPEN_C) OVER () - MIN(OPEN_C) OVER ()) = 0 THEN 0 ELSE (OPEN_C - MIN(OPEN_C) OVER ()) / (MAX(OPEN_C) OVER () - MIN(OPEN_C) OVER ()) END AS scaled_OPEN_C,
    CASE WHEN (MAX(TAP_C) OVER () - MIN(TAP_C) OVER ()) = 0 THEN 0 ELSE (TAP_C - MIN(TAP_C) OVER ()) / (MAX(TAP_C) OVER () - MIN(TAP_C) OVER ()) END AS scaled_TAP_C,
    CASE WHEN (MAX(IT_KG) OVER () - MIN(IT_KG) OVER ()) = 0 THEN 0 ELSE (IT_KG - MIN(IT_KG) OVER ()) / (MAX(IT_KG) OVER () - MIN(IT_KG) OVER ()) END AS scaled_IT_KG,
    CASE WHEN (MAX(STATIC_WT) OVER () - MIN(STATIC_WT) OVER ()) = 0 THEN 0 ELSE (STATIC_WT - MIN(STATIC_WT) OVER ()) / (MAX(STATIC_WT) OVER () - MIN(STATIC_WT) OVER ()) END AS scaled_STATIC_WT,
    CASE WHEN (MAX(LIME) OVER () - MIN(LIME) OVER ()) = 0 THEN 0 ELSE (LIME - MIN(LIME) OVER ()) / (MAX(LIME) OVER () - MIN(LIME) OVER ()) END AS scaled_LIME,
    CASE WHEN (MAX(O2SIDE1) OVER () - MIN(O2SIDE1) OVER ()) = 0 THEN 0 ELSE (O2SIDE1 - MIN(O2SIDE1) OVER ()) / (MAX(O2SIDE1) OVER () - MIN(O2SIDE1) OVER ()) END AS scaled_O2SIDE1,
    CASE WHEN (MAX(O2SIDE2) OVER () - MIN(O2SIDE2) OVER ()) = 0 THEN 0 ELSE (O2SIDE2 - MIN(O2SIDE2) OVER ()) / (MAX(O2SIDE2) OVER () - MIN(O2SIDE2) OVER ()) END AS scaled_O2SIDE2,
    CASE WHEN (MAX(O2SIDE3) OVER () - MIN(O2SIDE3) OVER ()) = 0 THEN 0 ELSE (O2SIDE3 - MIN(O2SIDE3) OVER ()) / (MAX(O2SIDE3) OVER () - MIN(O2SIDE3) OVER ()) END AS scaled_O2SIDE3,
    CASE WHEN (MAX(Pour_Back_Metal) OVER () - MIN(Pour_Back_Metal) OVER ()) = 0 THEN 0 ELSE (Pour_Back_Metal - MIN(Pour_Back_Metal) OVER ()) / (MAX(Pour_Back_Metal) OVER () - MIN(Pour_Back_Metal) OVER ()) END AS scaled_Pour_Back_Metal,
    CASE WHEN (MAX(LM_WT) OVER () - MIN(LM_WT) OVER ()) = 0 THEN 0 ELSE (LM_WT - MIN(LM_WT) OVER ()) / (MAX(LM_WT) OVER () - MIN(LM_WT) OVER ()) END AS scaled_LM_WT,
    CASE WHEN (MAX(Production) OVER () - MIN(Production) OVER ()) = 0 THEN 0 ELSE (Production - MIN(Production) OVER ()) / (MAX(Production) OVER () - MIN(Production) OVER ()) END AS scaled_Production
FROM TEMP_RAW;

select * from scaled1 JOIN SCALED2; 
CREATE TABLE SCALED select * from scaled1 JOIN SCALED2;


desc TEMP_RAW;


