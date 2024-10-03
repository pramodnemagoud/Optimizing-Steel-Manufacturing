
use project_201;
-- DESCRIBE provides a detailed description of the table structure, including column names, data types, and other attributes.
DESCRIBE data_set;

-- View all the columns datatype in the table
select column_name, data_type
from information_schema.columns
where table_name = 'data_setT'
and table_schema = 'project_201';

/*data_type LIKE 'int%' will match columns of type INT, INTEGER, etc.
data_type LIKE 'decimal%' will match columns of type DECIMAL.
data_type LIKE 'float%' will match columns of type FLOAT.
data_type LIKE 'double%' will match columns of type DOUBLE */

-- View only numerical columns datatype in the table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'data_setT'
  AND table_schema = 'project_201'
  AND (data_type LIKE 'int%' OR data_type LIKE 'decimal%' OR data_type LIKE 'float%' OR data_type LIKE 'double%');



# ---------------  Typecasting  ----------------- #
ALTER TABLE Data_sett MODIFY COLUMN SRNO VARCHAR(10);

ALTER TABLE Data_sett  MODIFY COLUMN DATETIME DATE;

ALTER TABLE Data_sett  MODIFY COLUMN PREV_TAP_TIME DATE;

#---------------  drop zero columns ----------------
ALTER TABLE data_sett
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

#rename columns
ALTER TABLE data_sett RENAME COLUMN `INJ1_QTY
(Coke Injection Qty)` TO INJ1_QTY;

ALTER TABLE data_sett RENAME COLUMN `INJ2_QTY
(Coke Injection Qty)` TO INJ2_QTY;

ALTER TABLE data_sett 
RENAME COLUMN `SCRAP_QTY (MT)` TO SCRAP_QTY,
RENAME COLUMN `DRI1_QTY (MT) (Lumps)` TO DRI1_QTY_Lumps,
RENAME COLUMN `DRI2_QTY
(MT) (Fines)` TO DRI2_QTY_Fines,
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
RENAME COLUMN `Production (MT)` TO Production;


# ------------------  Handling Duplicates  ---------------------------
SELECT SRNO, COUNT(*) as duplicate_count_SRNO
FROM data_sett
GROUP BY SRNO
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

SELECT INJ1_QTY, COUNT(*) as duplicate_count_INJ1_QTY
FROM data_sett
GROUP BY INJ1_QTY
HAVING COUNT(*) > 1;

SELECT INJ2_QTY, COUNT(*) as duplicate_count_INJ2_QTY
FROM data_sett
GROUP BY INJ2_QTY
HAVING COUNT(*) > 1;

SELECT BSM, COUNT(*) as duplicate_count_BSM
FROM data_sett
GROUP BY BSM
HAVING COUNT(*) > 1;

SELECT SKULL, COUNT(*) as duplicate_count_SKULL
FROM data_sett
GROUP BY SKULL
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

SELECT DRI1_QTY_Lumps , COUNT(*) as duplicate_count_DRI1_QTY
FROM data_sett
GROUP BY DRI1_QTY_Lumps
HAVING COUNT(*) > 1;

SELECT DRI2_QTY_Fines, COUNT(*) as duplicate_count_DRI2_QTY
FROM data_sett
GROUP BY DRI2_QTY_Fines
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


# -------------- Outlier Treatment -----------#
--- Increase timeout settings
SET @@session.wait_timeout = 28800;
SET @@session.net_read_timeout = 600;

-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Perform the update
UPDATE data_setT AS e
JOIN (
    SELECT
        INJ1_QTY,
        INJ2_QTY,
        DRI1_QTY_Lumps,
        DRI2_QTY_Fines,
        TOT_DRI_QTY,
        HOT_METAL,
        `Total Charge`,
        Hot_Heel,
        DOLO,
        DOLO1_EMPTY,
        TOT_LIME_QTY,
        O2ACT,
        ENERGY,
        KWH_PER_TON,
        MELT_TIME,
        TA_TIME,
        TT_TIME,
        E1_CUR,
        E2_CUR,
        E3_CUR,
        SPOUT,
        C,
        SI,
        MN,
        P,
        S,
        CU,
        CR,
        NI,
        N,
        OPEN_C,
        TAP_C,
        IT_KG,
        STATIC_WT,
        LIME,
        O2SIDE1,
        O2SIDE2,
        O2SIDE3,
        Pour_Back_Metal,
        LM_WT,
        Production,
        NTILE(4) OVER (ORDER BY INJ1_QTY) AS INJ1_QTY_quartile,
        NTILE(4) OVER (ORDER BY INJ2_QTY) AS INJ2_QTY_quartile,
        NTILE(4) OVER (ORDER BY DRI1_QTY_Lumps) AS DRI1_QTY_Lumps_quartile,
        NTILE(4) OVER (ORDER BY DRI2_QTY_Fines) AS DRI2_QTY_Fines_quartile,
        NTILE(4) OVER (ORDER BY TOT_DRI_QTY) AS TOT_DRI_QTY_quartile,
        NTILE(4) OVER (ORDER BY HOT_METAL) AS HOT_METAL_quartile,
        NTILE(4) OVER (ORDER BY `Total Charge`) AS Total_Charge_quartile,
        NTILE(4) OVER (ORDER BY Hot_Heel) AS Hot_Heel_quartile,
        NTILE(4) OVER (ORDER BY DOLO) AS DOLO_quartile,
        NTILE(4) OVER (ORDER BY DOLO1_EMPTY) AS DOLO1_EMPTY_quartile,
        NTILE(4) OVER (ORDER BY TOT_LIME_QTY) AS TOT_LIME_QTY_quartile,
        NTILE(4) OVER (ORDER BY O2ACT) AS O2ACT_quartile,
        NTILE(4) OVER (ORDER BY ENERGY) AS ENERGY_quartile,
        NTILE(4) OVER (ORDER BY KWH_PER_TON) AS KWH_PER_TON_quartile,
        NTILE(4) OVER (ORDER BY MELT_TIME) AS MELT_TIME_quartile,
        NTILE(4) OVER (ORDER BY TA_TIME) AS TA_TIME_quartile,
        NTILE(4) OVER (ORDER BY TT_TIME) AS TT_TIME_quartile,
        NTILE(4) OVER (ORDER BY E1_CUR) AS E1_CUR_quartile,
        NTILE(4) OVER (ORDER BY E2_CUR) AS E2_CUR_quartile,
        NTILE(4) OVER (ORDER BY E3_CUR) AS E3_CUR_quartile,
        NTILE(4) OVER (ORDER BY SPOUT) AS SPOUT_quartile,
        NTILE(4) OVER (ORDER BY C) AS C_quartile,
        NTILE(4) OVER (ORDER BY SI) AS SI_quartile,
        NTILE(4) OVER (ORDER BY MN) AS MN_quartile,
        NTILE(4) OVER (ORDER BY P) AS P_quartile,
        NTILE(4) OVER (ORDER BY S) AS S_quartile,
        NTILE(4) OVER (ORDER BY CU) AS CU_quartile,
        NTILE(4) OVER (ORDER BY CR) AS CR_quartile,
        NTILE(4) OVER (ORDER BY NI) AS NI_quartile,
        NTILE(4) OVER (ORDER BY N) AS N_quartile,
        NTILE(4) OVER (ORDER BY OPEN_C) AS OPEN_C_quartile,
        NTILE(4) OVER (ORDER BY TAP_C) AS TAP_C_quartile,
        NTILE(4) OVER (ORDER BY IT_KG) AS IT_KG_quartile,
        NTILE(4) OVER (ORDER BY STATIC_WT) AS STATIC_WT_quartile,
        NTILE(4) OVER (ORDER BY LIME) AS LIME_quartile,
        NTILE(4) OVER (ORDER BY O2SIDE1) AS O2SIDE1_quartile,
        NTILE(4) OVER (ORDER BY O2SIDE2) AS O2SIDE2_quartile,
        NTILE(4) OVER (ORDER BY O2SIDE3) AS O2SIDE3_quartile,
        NTILE(4) OVER (ORDER BY Pour_Back_Metal) AS Pour_Back_Metal_quartile,
        NTILE(4) OVER (ORDER BY LM_WT) AS LM_WT_quartile,
        NTILE(4) OVER (ORDER BY Production) AS Production_quartile
    FROM data_setT
) AS subquery ON 1 = 1
SET e.INJ1_QTY = (
        SELECT
            AVG(INJ1_QTY)
        FROM
            (
                SELECT
                    INJ1_QTY,
                    INJ2_QTY,
                    DRI1_QTY_Lumps,
                    DRI2_QTY_Fines,
                    TOT_DRI_QTY,
                    HOT_METAL,
                    `Total Charge`,
                    Hot_Heel,
                    DOLO,
                    DOLO1_EMPTY,
                    TOT_LIME_QTY,
                    O2ACT,
                    ENERGY,
                    KWH_PER_TON,
                    MELT_TIME,
                    TA_TIME,
                    TT_TIME,
                    E1_CUR,
                    E2_CUR,
                    E3_CUR,
                    SPOUT,
                    C,
                    SI,
                    MN,
                    P,
                    S,
                    CU,
                    CR,
                    NI,
                    N,
                    OPEN_C,
                    TAP_C,
                    IT_KG,
                    STATIC_WT,
                    LIME,
                    O2SIDE1,
                    O2SIDE2,
                    O2SIDE3,
                    Pour_Back_Metal,
                    LM_WT,
                    Production,
                    INJ1_QTY_quartile,
                    INJ2_QTY_quartile,
                    DRI1_QTY_Lumps_quartile,
                    DRI2_QTY_Fines_quartile,
                    TOT_DRI_QTY_quartile,
                    HOT_METAL_quartile,
                    Total_Charge_quartile,
                    Hot_Heel_quartile,
                    DOLO_quartile,
                    DOLO1_EMPTY_quartile,
                    TOT_LIME_QTY_quartile,
                    O2ACT_quartile,
                    ENERGY_quartile,
                    KWH_PER_TON_quartile,
                    MELT_TIME_quartile,
                    TA_TIME_quartile,
                    TT_TIME_quartile,
                    E1_CUR_quartile,
                    E2_CUR_quartile,
                    E3_CUR_quartile,
                    SPOUT_quartile,
                    C_quartile,
                    SI_quartile,
                    MN_quartile,
                    P_quartile,
                    S_quartile,
                    CU_quartile,
                    CR_quartile,
                    NI_quartile,
                    N_quartile,
                    OPEN_C_quartile,
                    TAP_C_quartile,
                    IT_KG_quartile,
                    STATIC_WT_quartile,
                    LIME_quartile,
                    O2SIDE1_quartile,
                    O2SIDE2_quartile,
                    O2SIDE3_quartile,
                    Pour_Back_Metal_quartile,
                    LM_WT_quartile,
                    Production_quartile
                FROM
                    data_setT
            )
        AS
            temp
    WHERE
        INJ1_QTY_quartile = subquery.INJ1_QTY_quartile)
WHERE
    subquery.INJ1_QTY_quartile IN (1 , 4);

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;



# ------------    Zero & near Zero Variance features ------ ----- #

SELECT
    VARIANCE(INJ1_QTY) AS INJ1_QTY_variance,
    VARIANCE(INJ2_QTY) AS INJ2_QTY_variance,
    VARIANCE(DRI1_QTY_Lumps) AS DRI1_QTY_Lumps_variance,
    VARIANCE(DRI2_QTY_Fines) AS DRI2_QTY_Fines_variance,
    VARIANCE(TOT_DRI_QTY) AS TOT_DRI_QTY_variance,
    VARIANCE(HOT_METAL) AS HOT_METAL_variance,
    VARIANCE(`Total Charge`) AS Total_Charge_variance,
    VARIANCE(Hot_Heel) AS Hot_Heel_variance,
    VARIANCE(DOLO) AS DOLO_variance,
    VARIANCE(DOLO1_EMPTY) AS DOLO1_EMPTY_variance,
    VARIANCE(TOT_LIME_QTY) AS TOT_LIME_QTY_variance,
    VARIANCE(O2ACT) AS O2ACT_variance,
    VARIANCE(ENERGY) AS ENERGY_variance,
    VARIANCE(KWH_PER_TON) AS KWH_PER_TON_variance,
    VARIANCE(MELT_TIME) AS MELT_TIME_variance,
    VARIANCE(TA_TIME) AS TA_TIME_variance,
    VARIANCE(TT_TIME) AS TT_TIME_variance,
    VARIANCE(E1_CUR) AS E1_CUR_variance,
    VARIANCE(E2_CUR) AS E2_CUR_variance,
    VARIANCE(E3_CUR) AS E3_CUR_variance,
    VARIANCE(SPOUT) AS SPOUT_variance,
    VARIANCE(C) AS C_variance,
    VARIANCE(SI) AS SI_variance,
    VARIANCE(MN) AS MN_variance,
    VARIANCE(P) AS P_variance,
    VARIANCE(S) AS S_variance,
    VARIANCE(CU) AS CU_variance,
    VARIANCE(CR) AS CR_variance,
    VARIANCE(NI) AS NI_variance,
    VARIANCE(N) AS N_variance,
    VARIANCE(OPEN_C) AS OPEN_C_variance,
    VARIANCE(TAP_C) AS TAP_C_variance,
    VARIANCE(IT_KG) AS IT_KG_variance,
    VARIANCE(STATIC_WT) AS STATIC_WT_variance,
    VARIANCE(LIME) AS LIME_variance,
    VARIANCE(O2SIDE1) AS O2SIDE1_variance,
    VARIANCE(O2SIDE2) AS O2SIDE2_variance,
    VARIANCE(O2SIDE3) AS O2SIDE3_variance,
    VARIANCE(Pour_Back_Metal) AS Pour_Back_Metal_variance,
    VARIANCE(LM_WT) AS LM_WT_variance,
    VARIANCE(Production) AS Production_variance
FROM data_sett;


##
#    ---------------------  missing values  ---------------------------
SELECT 
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
    SUM(CASE WHEN `OTHERS` IS NULL THEN 1 ELSE 0 END) AS OTHERS_missing,
    SUM(CASE WHEN SCRAP_QTY IS NULL THEN 1 ELSE 0 END) AS SCRAP_QTY_missing,
    SUM(CASE WHEN PIGIRON IS NULL THEN 1 ELSE 0 END) AS PIGIRON_missing,
    SUM(CASE WHEN DRI1_QTY_Lumps IS NULL THEN 1 ELSE 0 END) AS DRI1_QTY_missing,
    SUM(CASE WHEN DRI2_QTY_Fines IS NULL THEN 1 ELSE 0 END) AS DRI2_QTY_missing,
    SUM(CASE WHEN TOT_DRI_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_DRI_QTY_missing,
    SUM(CASE WHEN HOT_METAL IS NULL THEN 1 ELSE 0 END) AS HOT_METAL_missing,
    SUM(CASE WHEN `Total Charge` IS NULL THEN 1 ELSE 0 END) AS Total_Charge_missing,
    SUM(CASE WHEN Hot_Heel IS NULL THEN 1 ELSE 0 END) AS Hot_Heel_missing,
    SUM(CASE WHEN DOLO IS NULL THEN 1 ELSE 0 END) AS DOLO_missing,
    SUM(CASE WHEN DOLO1_EMPTY IS NULL THEN 1 ELSE 0 END) AS DOLO1_EMPTY_missing,
    SUM(CASE WHEN TOT_LIME_QTY IS NULL THEN 1 ELSE 0 END) AS TOT_LIME_QTY_missing,
    SUM(CASE WHEN TAP_TEMP IS NULL THEN 1 ELSE 0 END) AS TAP_TEMP_missing,
    SUM(CASE WHEN O2ACT IS NULL THEN 1 ELSE 0 END) AS O2ACT_missing,
    SUM(CASE WHEN ENERGY IS NULL THEN 1 ELSE 0 END) AS ENERGY_missing,
    SUM(CASE WHEN KWH_PER_TON IS NULL THEN 1 ELSE 0 END) AS KWH_PER_TON_missing,
    SUM(CASE WHEN KWH_PER_MIN IS NULL THEN 1 ELSE 0 END) AS KWH_PER_MIN_missing,
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
FROM data_sett;



#replace missing values with a different value other than NULL in the future.
UPDATE data_sett
SET LAB_REP_TIME = COALESCE(LAB_REP_TIME, NULL),
    PREV_TAP_TIME = COALESCE(PREV_TAP_TIME, NULL);

#replace missing values with 0 in the Production (MT) column of your data_sett table:
UPDATE data_sett
SET `Production (MT)` = COALESCE(`Production (MT)`, 0);





# ----------------- Normalization ----------------#
CREATE TABLE data_setT_scaled AS
SELECT
    INJ1_QTY,
    INJ2_QTY,
    DRI1_QTY_Lumps,
    DRI2_QTY_Fines,
    TOT_DRI_QTY,
    HOT_METAL,
    `Total Charge`,
    Hot_Heel,
    DOLO,
    DOLO1_EMPTY,
    TOT_LIME_QTY,
    O2ACT,
    ENERGY,
    KWH_PER_TON,
    MELT_TIME,
    TA_TIME,
    TT_TIME,
    E1_CUR,
    E2_CUR,
    E3_CUR,
    SPOUT,
    C,
    SI,
    MN,
    P,
    S,
    CU,
    CR,
    NI,
    N,
    OPEN_C,
    TAP_C,
    IT_KG,
    STATIC_WT,
    LIME,
    O2SIDE1,
    O2SIDE2,
    O2SIDE3,
    Pour_Back_Metal,
    LM_WT,
    Production,
    -- Scaled columns
    (INJ1_QTY - MIN(INJ1_QTY) OVER ()) / (MAX(INJ1_QTY) OVER () - MIN(INJ1_QTY) OVER ()) AS scaled_INJ1_QTY,
    (INJ2_QTY - MIN(INJ2_QTY) OVER ()) / (MAX(INJ2_QTY) OVER () - MIN(INJ2_QTY) OVER ()) AS scaled_INJ2_QTY,
    (DRI1_QTY_Lumps - MIN(DRI1_QTY_Lumps) OVER ()) / (MAX(DRI1_QTY_Lumps) OVER () - MIN(DRI1_QTY_Lumps) OVER ()) AS scaled_DRI1_QTY_Lumps,
    (DRI2_QTY_Fines - MIN(DRI2_QTY_Fines) OVER ()) / (MAX(DRI2_QTY_Fines) OVER () - MIN(DRI2_QTY_Fines) OVER ()) AS scaled_DRI2_QTY_Fines,
    (TOT_DRI_QTY - MIN(TOT_DRI_QTY) OVER ()) / (MAX(TOT_DRI_QTY) OVER () - MIN(TOT_DRI_QTY) OVER ()) AS scaled_TOT_DRI_QTY,
    (HOT_METAL - MIN(HOT_METAL) OVER ()) / (MAX(HOT_METAL) OVER () - MIN(HOT_METAL) OVER ()) AS scaled_HOT_METAL,
    (`Total Charge` - MIN(`Total Charge`) OVER ()) / (MAX(`Total Charge`) OVER () - MIN(`Total Charge`) OVER ()) AS scaled_Total_Charge,
    (Hot_Heel - MIN(Hot_Heel) OVER ()) / (MAX(Hot_Heel) OVER () - MIN(Hot_Heel) OVER ()) AS scaled_Hot_Heel,
    (DOLO - MIN(DOLO) OVER ()) / (MAX(DOLO) OVER () - MIN(DOLO) OVER ()) AS scaled_DOLO,
    (DOLO1_EMPTY - MIN(DOLO1_EMPTY) OVER ()) / (MAX(DOLO1_EMPTY) OVER () - MIN(DOLO1_EMPTY) OVER ()) AS scaled_DOLO1_EMPTY,
    (TOT_LIME_QTY - MIN(TOT_LIME_QTY) OVER ()) / (MAX(TOT_LIME_QTY) OVER () - MIN(TOT_LIME_QTY) OVER ()) AS scaled_TOT_LIME_QTY,
    (O2ACT - MIN(O2ACT) OVER ()) / (MAX(O2ACT) OVER () - MIN(O2ACT) OVER ()) AS scaled_O2ACT,
    (ENERGY - MIN(ENERGY) OVER ()) / (MAX(ENERGY) OVER () - MIN(ENERGY) OVER ()) AS scaled_ENERGY,
    (KWH_PER_TON - MIN(KWH_PER_TON) OVER ()) / (MAX(KWH_PER_TON) OVER () - MIN(KWH_PER_TON) OVER ()) AS scaled_KWH_PER_TON,
    (MELT_TIME - MIN(MELT_TIME) OVER ()) / (MAX(MELT_TIME) OVER () - MIN(MELT_TIME) OVER ()) AS scaled_MELT_TIME,
    (TA_TIME - MIN(TA_TIME) OVER ()) / (MAX(TA_TIME) OVER () - MIN(TA_TIME) OVER ()) AS scaled_TA_TIME,
    (TT_TIME - MIN(TT_TIME) OVER ()) / (MAX(TT_TIME) OVER () - MIN(TT_TIME) OVER ()) AS scaled_TT_TIME,
    (E1_CUR - MIN(E1_CUR) OVER ()) / (MAX(E1_CUR) OVER () - MIN(E1_CUR) OVER ()) AS scaled_E1_CUR,
    (E2_CUR - MIN(E2_CUR) OVER ()) / (MAX(E2_CUR) OVER () - MIN(E2_CUR) OVER ()) AS scaled_E2_CUR,
    (E3_CUR - MIN(E3_CUR) OVER ()) / (MAX(E3_CUR) OVER () - MIN(E3_CUR) OVER ()) AS scaled_E3_CUR,
    (SPOUT - MIN(SPOUT) OVER ()) / (MAX(SPOUT) OVER () - MIN(SPOUT) OVER ()) AS scaled_SPOUT,
    (C - MIN(C) OVER ()) / (MAX(C) OVER () - MIN(C) OVER ()) AS scaled_C,
    (SI - MIN(SI) OVER ()) / (MAX(SI) OVER () - MIN(SI) OVER ()) AS scaled_SI,
    (MN - MIN(MN) OVER ()) / (MAX(MN) OVER () - MIN(MN) OVER ()) AS scaled_MN,
    (P - MIN(P) OVER ()) / (MAX(P) OVER () - MIN(P) OVER ()) AS scaled_P,
    (S - MIN(S) OVER ()) / (MAX(S) OVER () - MIN(S) OVER ()) AS scaled_S,
    (CU - MIN(CU) OVER ()) / (MAX(CU) OVER () - MIN(CU) OVER ()) AS scaled_CU,
    (CR - MIN(CR) OVER ()) / (MAX(CR) OVER () - MIN(CR) OVER ()) AS scaled_CR,
    (NI - MIN(NI) OVER ()) / (MAX(NI) OVER () - MIN(NI) OVER ()) AS scaled_NI,
    (N - MIN(N) OVER ()) / (MAX(N) OVER () - MIN(N) OVER ()) AS scaled_N,
    (OPEN_C - MIN(OPEN_C) OVER ()) / (MAX(OPEN_C) OVER () - MIN(OPEN_C) OVER ()) AS scaled_OPEN_C,
    (TAP_C - MIN(TAP_C) OVER ()) / (MAX(TAP_C) OVER () - MIN(TAP_C) OVER ()) AS scaled_TAP_C,
    (IT_KG - MIN(IT_KG) OVER ()) / (MAX(IT_KG) OVER () - MIN(IT_KG) OVER ()) AS scaled_IT_KG,
    (STATIC_WT - MIN(STATIC_WT) OVER ()) / (MAX(STATIC_WT) OVER () - MIN(STATIC_WT) OVER ()) AS scaled_STATIC_WT,
    (LIME - MIN(LIME) OVER ()) / (MAX(LIME) OVER () - MIN(LIME) OVER ()) AS scaled_LIME,
    (O2SIDE1 - MIN(O2SIDE1) OVER ()) / (MAX(O2SIDE1) OVER () - MIN(O2SIDE1) OVER ()) AS scaled_O2SIDE1,
    (O2SIDE2 - MIN(O2SIDE2) OVER ()) / (MAX(O2SIDE2) OVER () - MIN(O2SIDE2) OVER ()) AS scaled_O2SIDE2,
    (O2SIDE3 - MIN(O2SIDE3) OVER ()) / (MAX(O2SIDE3) OVER () - MIN(O2SIDE3) OVER ()) AS scaled_O2SIDE3,
    (Pour_Back_Metal - MIN(Pour_Back_Metal) OVER ()) / (MAX(Pour_Back_Metal) OVER () - MIN(Pour_Back_Metal) OVER ()) AS scaled_Pour_Back_Metal,
    (LM_WT - MIN(LM_WT) OVER ()) / (MAX(LM_WT) OVER () - MIN(LM_WT) OVER ()) AS scaled_LM_WT,
    (Production - MIN(Production) OVER ()) / (MAX(Production) OVER () - MIN(Production) OVER ()) AS scaled_Production
FROM data_sett;


# --------------------  Discretization/Binning/Grouping -----------------------------------------  #

SELECT
    INJ1_QTY,
    INJ2_QTY,
    DRI1_QTY_Lumps,
    DRI2_QTY_Fines,
    TOT_DRI_QTY,
    HOT_METAL,
    `Total Charge`,
    Hot_Heel,
    DOLO,
    DOLO1_EMPTY,
    TOT_LIME_QTY,
    O2ACT,
    ENERGY,
    KWH_PER_TON,
    MELT_TIME,
    TA_TIME,
    TT_TIME,
    E1_CUR,
    E2_CUR,
    E3_CUR,
    SPOUT,
    C,
    SI,
    MN,
    P,
    S,
    CU,
    CR,
    NI,
    N,
    OPEN_C,
    TAP_C,
    IT_KG,
    STATIC_WT,
    LIME,
    O2SIDE1,
    O2SIDE2,
    O2SIDE3,
    Pour_Back_Metal,
    LM_WT,
    Production,
    CASE
        WHEN TOT_DRI_QTY < 50000 THEN 'Low'
        WHEN TOT_DRI_QTY >= 50000 AND TOT_DRI_QTY < 100000 THEN 'Medium'
        WHEN TOT_DRI_QTY >= 100000 THEN 'High'
        ELSE 'Unknown'
    END AS TOT_DRI_QTY_group
FROM data_sett;



#  --------------------- Dummy Variable Creation ------------------------#

#Mean
SELECT 
    AVG(`INJ1_QTY`) AS avg_INJ1_QTY,
    AVG(`INJ2_QTY`) AS avg_INJ2_QTY,
    AVG(`DRI1_QTY_Lumps`) AS avg_DRI1_QTY_Lumps,
    AVG(`DRI2_QTY_Fines`) AS avg_DRI2_QTY_Fines,
    AVG(`TOT_DRI_QTY`) AS avg_TOT_DRI_QTY,
    AVG(`HOT_METAL`) AS avg_HOT_METAL,
    AVG(`Total Charge`) AS avg_Total_Charge,
    AVG(`Hot_Heel`) AS avg_Hot_Heel,
    AVG(`DOLO`) AS avg_DOLO,
    AVG(`DOLO1_EMPTY`) AS avg_DOLO1_EMPTY,
    AVG(`TOT_LIME_QTY`) AS avg_TOT_LIME_QTY,
    AVG(`O2ACT`) AS avg_O2ACT,
    AVG(`ENERGY`) AS avg_ENERGY,
    AVG(`KWH_PER_TON`) AS avg_KWH_PER_TON,
    AVG(`MELT_TIME`) AS avg_MELT_TIME,
    AVG(`TA_TIME`) AS avg_TA_TIME,
    AVG(`TT_TIME`) AS avg_TT_TIME,
    AVG(`E1_CUR`) AS avg_E1_CUR,
    AVG(`E2_CUR`) AS avg_E2_CUR,
    AVG(`E3_CUR`) AS avg_E3_CUR,
    AVG(`SPOUT`) AS avg_SPOUT,
    AVG(`C`) AS avg_C,
    AVG(`SI`) AS avg_SI,
    AVG(`MN`) AS avg_MN,
    AVG(`P`) AS avg_P,
    AVG(`S`) AS avg_S,
    AVG(`CU`) AS avg_CU,
    AVG(`CR`) AS avg_CR,
    AVG(`NI`) AS avg_NI,
    AVG(`N`) AS avg_N,
    AVG(`OPEN_C`) AS avg_OPEN_C,
    AVG(`TAP_C`) AS avg_TAP_C,
    AVG(`IT_KG`) AS avg_IT_KG,
    AVG(`STATIC_WT`) AS avg_STATIC_WT,
    AVG(`LIME`) AS avg_LIME,
    AVG(`O2SIDE1`) AS avg_O2SIDE1,
    AVG(`O2SIDE2`) AS avg_O2SIDE2,
    AVG(`O2SIDE3`) AS avg_O2SIDE3,
    AVG(`Pour_Back_Metal`) AS avg_Pour_Back_Metal,
    AVG(`LM_WT`) AS avg_LM_WT,
    AVG(`Production`) AS avg_Production
FROM data_sett;

#median
-- Median for INJ1_QTY 
SELECT `INJ1_QTY` AS median_INJ1_QTY
FROM (
    SELECT `INJ1_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `INJ1_QTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for INJ2_QTY
SELECT `INJ2_QTY` AS median_INJ2_QTY
FROM (
    SELECT `INJ2_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `INJ2_QTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DRI1_QTY_Lumps
SELECT `DRI1_QTY_Lumps` AS median_DRI1_QTY_Lumps
FROM (
    SELECT `DRI1_QTY_Lumps`, 
           ROW_NUMBER() OVER (ORDER BY `DRI1_QTY_Lumps`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DRI2_QTY_Fines
SELECT `DRI2_QTY_Fines` AS median_DRI2_QTY_Fines
FROM (
    SELECT `DRI2_QTY_Fines`, 
           ROW_NUMBER() OVER (ORDER BY `DRI2_QTY_Fines`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TOT_DRI_QTY
SELECT `TOT_DRI_QTY` AS median_TOT_DRI_QTY
FROM (
    SELECT `TOT_DRI_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `TOT_DRI_QTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for HOT_METAL
SELECT `HOT_METAL` AS median_HOT_METAL
FROM (
    SELECT `HOT_METAL`, 
           ROW_NUMBER() OVER (ORDER BY `HOT_METAL`) AS row_num,
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

-- Median for Hot_Heel
SELECT `Hot_Heel` AS median_Hot_Heel
FROM (
    SELECT `Hot_Heel`, 
           ROW_NUMBER() OVER (ORDER BY `Hot_Heel`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOLO
SELECT `DOLO` AS median_DOLO
FROM (
    SELECT `DOLO`, 
           ROW_NUMBER() OVER (ORDER BY `DOLO`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for DOLO1_EMPTY
SELECT `DOLO1_EMPTY` AS median_DOLO1_EMPTY
FROM (
    SELECT `DOLO1_EMPTY`, 
           ROW_NUMBER() OVER (ORDER BY `DOLO1_EMPTY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TOT_LIME_QTY
SELECT `TOT_LIME_QTY` AS median_TOT_LIME_QTY
FROM (
    SELECT `TOT_LIME_QTY`, 
           ROW_NUMBER() OVER (ORDER BY `TOT_LIME_QTY`) AS row_num,
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

-- Median for ENERGY
SELECT `ENERGY` AS median_ENERGY
FROM (
    SELECT `ENERGY`, 
           ROW_NUMBER() OVER (ORDER BY `ENERGY`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for KWH_PER_TON
SELECT `KWH_PER_TON` AS median_KWH_PER_TON
FROM (
    SELECT `KWH_PER_TON`, 
           ROW_NUMBER() OVER (ORDER BY `KWH_PER_TON`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for MELT_TIME
SELECT `MELT_TIME` AS median_MELT_TIME
FROM (
    SELECT `MELT_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `MELT_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TA_TIME
SELECT `TA_TIME` AS median_TA_TIME
FROM (
    SELECT `TA_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `TA_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for TT_TIME
SELECT `TT_TIME` AS median_TT_TIME
FROM (
    SELECT `TT_TIME`, 
           ROW_NUMBER() OVER (ORDER BY `TT_TIME`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E1_CUR
SELECT `E1_CUR` AS median_E1_CUR
FROM (
    SELECT `E1_CUR`, 
           ROW_NUMBER() OVER (ORDER BY `E1_CUR`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E2_CUR
SELECT `E2_CUR` AS median_E2_CUR
FROM (
    SELECT `E2_CUR`, 
           ROW_NUMBER() OVER (ORDER BY `E2_CUR`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for E3_CUR
SELECT `E3_CUR` AS median_E3_CUR
FROM (
    SELECT `E3_CUR`, 
           ROW_NUMBER() OVER (ORDER BY `E3_CUR`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for SPOUT
SELECT `SPOUT` AS median_SPOUT
FROM (
    SELECT `SPOUT`, 
           ROW_NUMBER() OVER (ORDER BY `SPOUT`) AS row_num,
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

-- Median for Pour_Back_Metal
SELECT `Pour_Back_Metal` AS median_Pour_Back_Metal
FROM (
    SELECT `Pour_Back_Metal`, 
           ROW_NUMBER() OVER (ORDER BY `Pour_Back_Metal`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for LM_WT
SELECT `LM_WT` AS median_LM_WT
FROM (
    SELECT `LM_WT`, 
           ROW_NUMBER() OVER (ORDER BY `LM_WT`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- Median for Production
SELECT `Production` AS median_Production
FROM (
    SELECT `Production`, 
           ROW_NUMBER() OVER (ORDER BY `Production`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM data_set
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;






#Mode

-- Mode for INJ1_QTY
SELECT INJ1_QTY AS Mode_INJ1_QTY
FROM data_set
GROUP BY INJ1_QTY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for INJ2_QTY
SELECT INJ2_QTY AS Mode_INJ2_QTY
FROM data_set
GROUP BY INJ2_QTY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for DRI1_QTY_Lumps
SELECT DRI1_QTY_Lumps AS Mode_DRI1_QTY_Lumps
FROM data_set
GROUP BY DRI1_QTY_Lumps
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for DRI2_QTY_Fines
SELECT DRI2_QTY_Fines AS Mode_DRI2_QTY_Fines
FROM data_set
GROUP BY DRI2_QTY_Fines
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for TOT_DRI_QTY
SELECT TOT_DRI_QTY AS Mode_TOT_DRI_QTY
FROM data_set
GROUP BY TOT_DRI_QTY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for HOT_METAL
SELECT HOT_METAL AS Mode_HOT_METAL
FROM data_set
GROUP BY HOT_METAL
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Total Charge
SELECT `Total Charge` AS Mode_Total_Charge
FROM data_set
GROUP BY `Total Charge`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Hot_Heel
SELECT Hot_Heel AS Mode_Hot_Heel
FROM data_set
GROUP BY Hot_Heel
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for DOLO
SELECT DOLO AS Mode_DOLO
FROM data_set
GROUP BY DOLO
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for DOLO1_EMPTY
SELECT DOLO1_EMPTY AS Mode_DOLO1_EMPTY
FROM data_set
GROUP BY DOLO1_EMPTY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for TOT_LIME_QTY
SELECT TOT_LIME_QTY AS Mode_TOT_LIME_QTY
FROM data_set
GROUP BY TOT_LIME_QTY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for O2ACT
SELECT O2ACT AS Mode_O2ACT
FROM data_set
GROUP BY O2ACT
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for ENERGY
SELECT ENERGY AS Mode_ENERGY
FROM data_set
GROUP BY ENERGY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for KWH_PER_TON
SELECT KWH_PER_TON AS Mode_KWH_PER_TON
FROM data_set
GROUP BY KWH_PER_TON
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for MELT_TIME
SELECT MELT_TIME AS Mode_MELT_TIME
FROM data_set
GROUP BY MELT_TIME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for TA_TIME
SELECT TA_TIME AS Mode_TA_TIME
FROM data_set
GROUP BY TA_TIME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for TT_TIME
SELECT TT_TIME AS Mode_TT_TIME
FROM data_set
GROUP BY TT_TIME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for E1_CUR
SELECT E1_CUR AS Mode_E1_CUR
FROM data_set
GROUP BY E1_CUR
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for E2_CUR
SELECT E2_CUR AS Mode_E2_CUR
FROM data_set
GROUP BY E2_CUR
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for E3_CUR
SELECT E3_CUR AS Mode_E3_CUR
FROM data_set
GROUP BY E3_CUR
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for SPOUT
SELECT SPOUT AS Mode_SPOUT
FROM data_set
GROUP BY SPOUT
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for C
SELECT C AS Mode_C
FROM data_set
GROUP BY C
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for SI
SELECT SI AS Mode_SI
FROM data_set
GROUP BY SI
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for MN
SELECT MN AS Mode_MN
FROM data_set
GROUP BY MN
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for P
SELECT P AS Mode_P
FROM data_set
GROUP BY P
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for S
SELECT S AS Mode_S
FROM data_set
GROUP BY S
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for CU
SELECT CU AS Mode_CU
FROM data_set
GROUP BY CU
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for CR
SELECT CR AS Mode_CR
FROM data_set
GROUP BY CR
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for NI
SELECT NI AS Mode_NI
FROM data_set
GROUP BY NI
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for N
SELECT N AS Mode_N
FROM data_set
GROUP BY N
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for OPEN_C
SELECT OPEN_C AS Mode_OPEN_C
FROM data_set
GROUP BY OPEN_C
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for TAP_C
SELECT TAP_C AS Mode_TAP_C
FROM data_set
GROUP BY TAP_C
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for IT_KG
SELECT IT_KG AS Mode_IT_KG
FROM data_set
GROUP BY IT_KG
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for STATIC_WT
SELECT STATIC_WT AS Mode_STATIC_WT
FROM data_set
GROUP BY STATIC_WT
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for LIME
SELECT LIME AS Mode_LIME
FROM data_set
GROUP BY LIME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for O2SIDE1
SELECT O2SIDE1 AS Mode_O2SIDE1
FROM data_set
GROUP BY O2SIDE1
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for O2SIDE2
SELECT O2SIDE2 AS Mode_O2SIDE2
FROM data_set
GROUP BY O2SIDE2
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for O2SIDE3
SELECT O2SIDE3 AS Mode_O2SIDE3
FROM data_set
GROUP BY O2SIDE3
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Pour_Back_Metal
SELECT Pour_Back_Metal AS Mode_Pour_Back_Metal
FROM data_set
GROUP BY Pour_Back_Metal
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for LM_WT
SELECT LM_WT AS Mode_LM_WT
FROM data_set
GROUP BY LM_WT
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Production
SELECT Production AS Mode_Production
FROM data_set
GROUP BY Production
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT
    `INJ1_QTY` AS Mode_INJ1_QTY,
    `INJ2_QTY` AS Mode_INJ2_QTY,
    `DRI1_QTY_Lumps` AS Mode_DRI1_QTY_Lumps,
    `DRI2_QTY_Fines` AS Mode_DRI2_QTY_Fines,
    `TOT_DRI_QTY` AS Mode_TOT_DRI_QTY,
    `HOT_METAL` AS Mode_HOT_METAL,
    `Total Charge` AS Mode_Total_Charge,
    `Hot_Heel` AS Mode_Hot_Heel,
    `DOLO` AS Mode_DOLO,
    `DOLO1_EMPTY` AS Mode_DOLO1_EMPTY,
    `TOT_LIME_QTY` AS Mode_TOT_LIME_QTY,
    `O2ACT` AS Mode_O2ACT,
    `ENERGY` AS Mode_ENERGY,
    `KWH_PER_TON` AS Mode_KWH_PER_TON,
    `MELT_TIME` AS Mode_MELT_TIME,
    `TA_TIME` AS Mode_TA_TIME,
    `TT_TIME` AS Mode_TT_TIME,
    `E1_CUR` AS Mode_E1_CUR,
    `E2_CUR` AS Mode_E2_CUR,
    `E3_CUR` AS Mode_E3_CUR,
    `SPOUT` AS Mode_SPOUT,
    `C` AS Mode_C,
    `SI` AS Mode_SI,
    `MN` AS Mode_MN,
    `P` AS Mode_P,
    `S` AS Mode_S,
    `CU` AS Mode_CU,
    `CR` AS Mode_CR,
    `NI` AS Mode_NI,
    `N` AS Mode_N,
    `OPEN_C` AS Mode_OPEN_C,
    `TAP_C` AS Mode_TAP_C,
    `IT_KG` AS Mode_IT_KG,
    `STATIC_WT` AS Mode_STATIC_WT,
    `LIME` AS Mode_LIME,
    `O2SIDE1` AS Mode_O2SIDE1,
    `O2SIDE2` AS Mode_O2SIDE2,
    `O2SIDE3` AS Mode_O2SIDE3,
    `Pour_Back_Metal` AS Mode_Pour_Back_Metal,
    `LM_WT` AS Mode_LM_WT,
    `Production` AS Mode_Production
FROM data_set
GROUP BY
        `INJ1_QTY`,
        `INJ2_QTY`,
        `DRI1_QTY_Lumps`,
        `DRI2_QTY_Fines`,
        `TOT_DRI_QTY`,
        `HOT_METAL`,
        `Total Charge`,
        `Hot_Heel`,
        `DOLO`,
        `DOLO1_EMPTY`,
        `TOT_LIME_QTY`,
        `O2ACT`,
        `ENERGY`,
        `KWH_PER_TON`,
        `MELT_TIME`,
        `TA_TIME`,
        `TT_TIME`,
        `E1_CUR`,
        `E2_CUR`,
        `E3_CUR`,
        `SPOUT`,
        `C`,
        `SI`,
        `MN`,
        `P`,
        `S`,
        `CU`,
        `CR`,
        `NI`,
        `N`,
        `OPEN_C`,
        `TAP_C`,
        `IT_KG`,
        `STATIC_WT`,
        `LIME`,
        `O2SIDE1`,
        `O2SIDE2`,
        `O2SIDE3`,
        `Pour_Back_Metal`,
        `LM_WT`,
        `Production`
ORDER BY COUNT(*) DESC
LIMIT 1;



#  VARIANCE
SELECT
  VARIANCE(`INJ1_QTY`) AS INJ1_QTY_variance,
  VARIANCE(`INJ2_QTY`) AS INJ2_QTY_variance,
  VARIANCE(`DRI1_QTY_Lumps`) AS DRI1_QTY_Lumps_variance,
  VARIANCE(`DRI2_QTY_Fines`) AS DRI2_QTY_Fines_variance,
  VARIANCE(`TOT_DRI_QTY`) AS TOT_DRI_QTY_variance,
  VARIANCE(`HOT_METAL`) AS HOT_METAL_variance,
  VARIANCE(`Total Charge`) AS Total_Charge_variance,
  VARIANCE(`Hot_Heel`) AS Hot_Heel_variance,
  VARIANCE(`DOLO`) AS DOLO_variance,
  VARIANCE(`DOLO1_EMPTY`) AS DOLO1_EMPTY_variance,
  VARIANCE(`TOT_LIME_QTY`) AS TOT_LIME_QTY_variance,
  VARIANCE(`O2ACT`) AS O2ACT_variance,
  VARIANCE(`ENERGY`) AS ENERGY_variance,
  VARIANCE(`KWH_PER_TON`) AS KWH_PER_TON_variance,
  VARIANCE(`MELT_TIME`) AS MELT_TIME_variance,
  VARIANCE(`TA_TIME`) AS TA_TIME_variance,
  VARIANCE(`TT_TIME`) AS TT_TIME_variance,
  VARIANCE(`E1_CUR`) AS E1_CUR_variance,
  VARIANCE(`E2_CUR`) AS E2_CUR_variance,
  VARIANCE(`E3_CUR`) AS E3_CUR_variance,
  VARIANCE(`SPOUT`) AS SPOUT_variance,
  VARIANCE(`C`) AS C_variance,
  VARIANCE(`SI`) AS SI_variance,
  VARIANCE(`MN`) AS MN_variance,
  VARIANCE(`P`) AS P_variance,
  VARIANCE(`S`) AS S_variance,
  VARIANCE(`CU`) AS CU_variance,
  VARIANCE(`CR`) AS CR_variance,
  VARIANCE(`NI`) AS NI_variance,
  VARIANCE(`N`) AS N_variance,
  VARIANCE(`OPEN_C`) AS OPEN_C_variance,
  VARIANCE(`TAP_C`) AS TAP_C_variance,
  VARIANCE(`IT_KG`) AS IT_KG_variance,
  VARIANCE(`STATIC_WT`) AS STATIC_WT_variance,
  VARIANCE(`LIME`) AS LIME_variance,
  VARIANCE(`O2SIDE1`) AS O2SIDE1_variance,
  VARIANCE(`O2SIDE2`) AS O2SIDE2_variance,
  VARIANCE(`O2SIDE3`) AS O2SIDE3_variance,
  VARIANCE(`Pour_Back_Metal`) AS Pour_Back_Metal_variance,
  VARIANCE(`LM_WT`) AS LM_WT_variance,
  VARIANCE(`Production`) AS Production_variance
FROM data_sett;


# stddev
SELECT
    STD(`INJ1_QTY`) AS stddev_INJ1_QTY,
    STD(`INJ2_QTY`) AS stddev_INJ2_QTY,
    STD(`DRI1_QTY_Lumps`) AS stddev_DRI1_QTY_Lumps,
    STD(`DRI2_QTY_Fines`) AS stddev_DRI2_QTY_Fines,
    STD(`TOT_DRI_QTY`) AS stddev_TOT_DRI_QTY,
    STD(`HOT_METAL`) AS stddev_HOT_METAL,
    STD(`Total Charge`) AS stddev_Total_Charge,
    STD(`Hot_Heel`) AS stddev_Hot_Heel,
    STD(`DOLO`) AS stddev_DOLO,
    STD(`DOLO1_EMPTY`) AS stddev_DOLO1_EMPTY,
    STD(`TOT_LIME_QTY`) AS stddev_TOT_LIME_QTY,
    STD(`O2ACT`) AS stddev_O2ACT,
    STD(`ENERGY`) AS stddev_ENERGY,
    STD(`KWH_PER_TON`) AS stddev_KWH_PER_TON,
    STD(`MELT_TIME`) AS stddev_MELT_TIME,
    STD(`TA_TIME`) AS stddev_TA_TIME,
    STD(`TT_TIME`) AS stddev_TT_TIME,
    STD(`E1_CUR`) AS stddev_E1_CUR,
    STD(`E2_CUR`) AS stddev_E2_CUR,
    STD(`E3_CUR`) AS stddev_E3_CUR,
    STD(`SPOUT`) AS stddev_SPOUT,
    STD(`C`) AS stddev_C,
    STD(`SI`) AS stddev_SI,
    STD(`MN`) AS stddev_MN,
    STD(`P`) AS stddev_P,
    STD(`S`) AS stddev_S,
    STD(`CU`) AS stddev_CU,
    STD(`CR`) AS stddev_CR,
    STD(`NI`) AS stddev_NI,
    STD(`N`) AS stddev_N,
    STD(`OPEN_C`) AS stddev_OPEN_C,
    STD(`TAP_C`) AS stddev_TAP_C,
    STD(`IT_KG`) AS stddev_IT_KG,
    STD(`STATIC_WT`) AS stddev_STATIC_WT,
    STD(`LIME`) AS stddev_LIME,
    STD(`O2SIDE1`) AS stddev_O2SIDE1,
    STD(`O2SIDE2`) AS stddev_O2SIDE2,
    STD(`O2SIDE3`) AS stddev_O2SIDE3,
    STD(`Pour_Back_Metal`) AS stddev_Pour_Back_Metal,
    STD(`LM_WT`) AS stddev_LM_WT,
    STD(`Production`) AS stddev_Production
FROM data_sett;



#Range

SELECT
    (MAX(`INJ1_QTY`) - MIN(`INJ1_QTY`)) AS Range_INJ1_QTY,
    (MAX(`INJ2_QTY`) - MIN(`INJ2_QTY`)) AS Range_INJ2_QTY,
    (MAX(`DRI1_QTY_Lumps`) - MIN(`DRI1_QTY_Lumps`)) AS Range_DRI1_QTY_Lumps,
    (MAX(`DRI2_QTY_Fines`) - MIN(`DRI2_QTY_Fines`)) AS Range_DRI2_QTY_Fines,
    (MAX(`TOT_DRI_QTY`) - MIN(`TOT_DRI_QTY`)) AS Range_TOT_DRI_QTY,
    (MAX(`HOT_METAL`) - MIN(`HOT_METAL`)) AS Range_HOT_METAL,
    (MAX(`Total Charge`) - MIN(`Total Charge`)) AS Range_Total_Charge,
    (MAX(`Hot_Heel`) - MIN(`Hot_Heel`)) AS Range_Hot_Heel,
    (MAX(`DOLO`) - MIN(`DOLO`)) AS Range_DOLO,
    (MAX(`DOLO1_EMPTY`) - MIN(`DOLO1_EMPTY`)) AS Range_DOLO1_EMPTY,
    (MAX(`TOT_LIME_QTY`) - MIN(`TOT_LIME_QTY`)) AS Range_TOT_LIME_QTY,
    (MAX(`O2ACT`) - MIN(`O2ACT`)) AS Range_O2ACT,
    (MAX(`ENERGY`) - MIN(`ENERGY`)) AS Range_ENERGY,
    (MAX(`KWH_PER_TON`) - MIN(`KWH_PER_TON`)) AS Range_KWH_PER_TON,
    (MAX(`MELT_TIME`) - MIN(`MELT_TIME`)) AS Range_MELT_TIME,
    (MAX(`TA_TIME`) - MIN(`TA_TIME`)) AS Range_TA_TIME,
    (MAX(`TT_TIME`) - MIN(`TT_TIME`)) AS Range_TT_TIME,
    (MAX(`E1_CUR`) - MIN(`E1_CUR`)) AS Range_E1_CUR,
    (MAX(`E2_CUR`) - MIN(`E2_CUR`)) AS Range_E2_CUR,
    (MAX(`E3_CUR`) - MIN(`E3_CUR`)) AS Range_E3_CUR,
    (MAX(`SPOUT`) - MIN(`SPOUT`)) AS Range_SPOUT,
    (MAX(`C`) - MIN(`C`)) AS Range_C,
    (MAX(`SI`) - MIN(`SI`)) AS Range_SI,
    (MAX(`MN`) - MIN(`MN`)) AS Range_MN,
    (MAX(`P`) - MIN(`P`)) AS Range_P,
    (MAX(`S`) - MIN(`S`)) AS Range_S,
    (MAX(`CU`) - MIN(`CU`)) AS Range_CU,
    (MAX(`CR`) - MIN(`CR`)) AS Range_CR,
    (MAX(`NI`) - MIN(`NI`)) AS Range_NI,
    (MAX(`N`) - MIN(`N`)) AS Range_N,
    (MAX(`OPEN_C`) - MIN(`OPEN_C`)) AS Range_OPEN_C,
    (MAX(`TAP_C`) - MIN(`TAP_C`)) AS Range_TAP_C,
    (MAX(`IT_KG`) - MIN(`IT_KG`)) AS Range_IT_KG,
    (MAX(`STATIC_WT`) - MIN(`STATIC_WT`)) AS Range_STATIC_WT,
    (MAX(`LIME`) - MIN(`LIME`)) AS Range_LIME,
    (MAX(`O2SIDE1`) - MIN(`O2SIDE1`)) AS Range_O2SIDE1,
    (MAX(`O2SIDE2`) - MIN(`O2SIDE2`)) AS Range_O2SIDE2,
    (MAX(`O2SIDE3`) - MIN(`O2SIDE3`)) AS Range_O2SIDE3,
    (MAX(`Pour_Back_Metal`) - MIN(`Pour_Back_Metal`)) AS Range_Pour_Back_Metal,
    (MAX(`LM_WT`) - MIN(`LM_WT`)) AS Range_LM_WT,
    (MAX(`Production`) - MIN(`Production`)) AS Range_Production
FROM data_sett;


#skewness
SELECT
    SUM(POWER((`INJ1_QTY`) - (SELECT AVG(`INJ1_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`INJ1_QTY`) FROM data_set), 3)) AS skewness_INJ1_QTY,

    SUM(POWER((`INJ2_QTY`) - (SELECT AVG(`INJ2_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`INJ2_QTY`) FROM data_set), 3)) AS skewness_INJ2_QTY,

    SUM(POWER((`DRI1_QTY_Lumps`) - (SELECT AVG(`DRI1_QTY_Lumps`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DRI1_QTY_Lumps`) FROM data_set), 3)) AS skewness_DRI1_QTY_Lumps,

    SUM(POWER((`DRI2_QTY_Fines`) - (SELECT AVG(`DRI2_QTY_Fines`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DRI2_QTY_Fines`) FROM data_set), 3)) AS skewness_DRI2_QTY_Fines,

    SUM(POWER((`TOT_DRI_QTY`) - (SELECT AVG(`TOT_DRI_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_DRI_QTY`) FROM data_set), 3)) AS skewness_TOT_DRI_QTY,

    SUM(POWER((`HOT_METAL`) - (SELECT AVG(`HOT_METAL`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`HOT_METAL`) FROM data_set), 3)) AS skewness_HOT_METAL,

    SUM(POWER((`Total Charge`) - (SELECT AVG(`Total Charge`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Total Charge`) FROM data_set), 3)) AS skewness_Total_Charge,

    SUM(POWER((`Hot_Heel`) - (SELECT AVG(`Hot_Heel`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Hot_Heel`) FROM data_set), 3)) AS skewness_Hot_Heel,

    SUM(POWER((`DOLO`) - (SELECT AVG(`DOLO`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO`) FROM data_set), 3)) AS skewness_DOLO,

    SUM(POWER((`DOLO1_EMPTY`) - (SELECT AVG(`DOLO1_EMPTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO1_EMPTY`) FROM data_set), 3)) AS skewness_DOLO1_EMPTY,

    SUM(POWER((`TOT_LIME_QTY`) - (SELECT AVG(`TOT_LIME_QTY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_LIME_QTY`) FROM data_set), 3)) AS skewness_TOT_LIME_QTY,

    SUM(POWER((`O2ACT`) - (SELECT AVG(`O2ACT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2ACT`) FROM data_set), 3)) AS skewness_O2ACT,

    SUM(POWER((`ENERGY`) - (SELECT AVG(`ENERGY`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`ENERGY`) FROM data_set), 3)) AS skewness_ENERGY,

    SUM(POWER((`KWH_PER_TON`) - (SELECT AVG(`KWH_PER_TON`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_TON`) FROM data_set), 3)) AS skewness_KWH_PER_TON,

    SUM(POWER((`MELT_TIME`) - (SELECT AVG(`MELT_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`MELT_TIME`) FROM data_set), 3)) AS skewness_MELT_TIME,

    SUM(POWER((`TA_TIME`) - (SELECT AVG(`TA_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TA_TIME`) FROM data_set), 3)) AS skewness_TA_TIME,

    SUM(POWER((`TT_TIME`) - (SELECT AVG(`TT_TIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TT_TIME`) FROM data_set), 3)) AS skewness_TT_TIME,

    SUM(POWER((`E1_CUR`) - (SELECT AVG(`E1_CUR`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E1_CUR`) FROM data_set), 3)) AS skewness_E1_CUR,

    SUM(POWER((`E2_CUR`) - (SELECT AVG(`E2_CUR`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E2_CUR`) FROM data_set), 3)) AS skewness_E2_CUR,

    SUM(POWER((`E3_CUR`) - (SELECT AVG(`E3_CUR`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`E3_CUR`) FROM data_set), 3)) AS skewness_E3_CUR,

    SUM(POWER((`SPOUT`) - (SELECT AVG(`SPOUT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`SPOUT`) FROM data_set), 3)) AS skewness_SPOUT,

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

    SUM(POWER((`OPEN_C`) - (SELECT AVG(`OPEN_C`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`OPEN_C`) FROM data_set), 3)) AS skewness_OPEN_C,

    SUM(POWER((`TAP_C`) - (SELECT AVG(`TAP_C`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_C`) FROM data_set), 3)) AS skewness_TAP_C,

    SUM(POWER((`IT_KG`) - (SELECT AVG(`IT_KG`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`IT_KG`) FROM data_set), 3)) AS skewness_IT_KG,

    SUM(POWER((`STATIC_WT`) - (SELECT AVG(`STATIC_WT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`STATIC_WT`) FROM data_set), 3)) AS skewness_STATIC_WT,

    SUM(POWER((`LIME`) - (SELECT AVG(`LIME`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LIME`) FROM data_set), 3)) AS skewness_LIME,

    SUM(POWER((`O2SIDE1`) - (SELECT AVG(`O2SIDE1`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE1`) FROM data_set), 3)) AS skewness_O2SIDE1,

    SUM(POWER((`O2SIDE2`) - (SELECT AVG(`O2SIDE2`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE2`) FROM data_set), 3)) AS skewness_O2SIDE2,

    SUM(POWER((`O2SIDE3`) - (SELECT AVG(`O2SIDE3`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE3`) FROM data_set), 3)) AS skewness_O2SIDE3,

    SUM(POWER((`Pour_Back_Metal`) - (SELECT AVG(`Pour_Back_Metal`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Pour_Back_Metal`) FROM data_set), 3)) AS skewness_Pour_Back_Metal,

    SUM(POWER((`LM_WT`) - (SELECT AVG(`LM_WT`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`LM_WT`) FROM data_set), 3)) AS skewness_LM_WT,

    SUM(POWER((`Production`) - (SELECT AVG(`Production`) FROM data_set), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(`Production`) FROM data_set), 3)) AS skewness_Production

FROM data_set;



# kurtosis
SELECT
    (SUM(POWER((`INJ1_QTY`) - (SELECT AVG(`INJ1_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`INJ1_QTY`) FROM data_set), 4)) - 3) AS kurtosis_INJ1_QTY,
    
    (SUM(POWER((`INJ2_QTY`) - (SELECT AVG(`INJ2_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`INJ2_QTY`) FROM data_set), 4)) - 3) AS kurtosis_INJ2_QTY
from data_sett;
    
SELECT
    (SUM(POWER((`INJ1_QTY`) - (SELECT AVG(`INJ1_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`INJ1_QTY`) FROM data_set), 4)) - 3) AS kurtosis_INJ1_QTY,
    
    (SUM(POWER((`INJ2_QTY`) - (SELECT AVG(`INJ2_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`INJ2_QTY`) FROM data_set), 4)) - 3) AS kurtosis_INJ2_QTY,
    
    (SUM(POWER((`DRI1_QTY_Lumps`) - (SELECT AVG(`DRI1_QTY_Lumps`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DRI1_QTY_Lumps`) FROM data_set), 4)) - 3) AS kurtosis_DRI1_QTY_Lumps,
    
    (SUM(POWER((`DRI2_QTY_Fines`) - (SELECT AVG(`DRI2_QTY_Fines`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DRI2_QTY_Fines`) FROM data_set), 4)) - 3) AS kurtosis_DRI2_QTY_Fines,
    
    (SUM(POWER((`TOT_DRI_QTY`) - (SELECT AVG(`TOT_DRI_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_DRI_QTY`) FROM data_set), 4)) - 3) AS kurtosis_TOT_DRI_QTY,
    
    (SUM(POWER((`HOT_METAL`) - (SELECT AVG(`HOT_METAL`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`HOT_METAL`) FROM data_set), 4)) - 3) AS kurtosis_HOT_METAL,
    
    (SUM(POWER((`Total Charge`) - (SELECT AVG(`Total Charge`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Total Charge`) FROM data_set), 4)) - 3) AS kurtosis_Total_Charge,
    
    (SUM(POWER((`Hot_Heel`) - (SELECT AVG(`Hot_Heel`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Hot_Heel`) FROM data_set), 4)) - 3) AS kurtosis_Hot_Heel,
    
    (SUM(POWER((`DOLO`) - (SELECT AVG(`DOLO`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO`) FROM data_set), 4)) - 3) AS kurtosis_DOLO,
    
    (SUM(POWER((`DOLO1_EMPTY`) - (SELECT AVG(`DOLO1_EMPTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`DOLO1_EMPTY`) FROM data_set), 4)) - 3) AS kurtosis_DOLO1_EMPTY,
    
    (SUM(POWER((`TOT_LIME_QTY`) - (SELECT AVG(`TOT_LIME_QTY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TOT_LIME_QTY`) FROM data_set), 4)) - 3) AS kurtosis_TOT_LIME_QTY,
    
    (SUM(POWER((`O2ACT`) - (SELECT AVG(`O2ACT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2ACT`) FROM data_set), 4)) - 3) AS kurtosis_O2ACT,
    
    (SUM(POWER((`ENERGY`) - (SELECT AVG(`ENERGY`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`ENERGY`) FROM data_set), 4)) - 3) AS kurtosis_ENERGY,
    
    (SUM(POWER((`KWH_PER_TON`) - (SELECT AVG(`KWH_PER_TON`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`KWH_PER_TON`) FROM data_set), 4)) - 3) AS kurtosis_KWH_PER_TON,
    
    (SUM(POWER((`MELT_TIME`) - (SELECT AVG(`MELT_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`MELT_TIME`) FROM data_set), 4)) - 3) AS kurtosis_MELT_TIME,
    
    (SUM(POWER((`TA_TIME`) - (SELECT AVG(`TA_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TA_TIME`) FROM data_set), 4)) - 3) AS kurtosis_TA_TIME,
    
    (SUM(POWER((`TT_TIME`) - (SELECT AVG(`TT_TIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TT_TIME`) FROM data_set), 4)) - 3) AS kurtosis_TT_TIME,
    
    (SUM(POWER((`E1_CUR`) - (SELECT AVG(`E1_CUR`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E1_CUR`) FROM data_set), 4)) - 3) AS kurtosis_E1_CUR,
    
    (SUM(POWER((`E2_CUR`) - (SELECT AVG(`E2_CUR`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E2_CUR`) FROM data_set), 4)) - 3) AS kurtosis_E2_CUR,
    
    (SUM(POWER((`E3_CUR`) - (SELECT AVG(`E3_CUR`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`E3_CUR`) FROM data_set), 4)) - 3) AS kurtosis_E3_CUR,
    
    (SUM(POWER((`SPOUT`) - (SELECT AVG(`SPOUT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`SPOUT`) FROM data_set), 4)) - 3) AS kurtosis_SPOUT,
    
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
    
    (SUM(POWER((`OPEN_C`) - (SELECT AVG(`OPEN_C`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`OPEN_C`) FROM data_set), 4)) - 3) AS kurtosis_OPEN_C,
    
    (SUM(POWER((`TAP_C`) - (SELECT AVG(`TAP_C`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`TAP_C`) FROM data_set), 4)) - 3) AS kurtosis_TAP_C,
    
    (SUM(POWER((`IT_KG`) - (SELECT AVG(`IT_KG`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`IT_KG`) FROM data_set), 4)) - 3) AS kurtosis_IT_KG,
    
    (SUM(POWER((`STATIC_WT`) - (SELECT AVG(`STATIC_WT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`STATIC_WT`) FROM data_set), 4)) - 3) AS kurtosis_STATIC_WT,
    
    (SUM(POWER((`LIME`) - (SELECT AVG(`LIME`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LIME`) FROM data_set), 4)) - 3) AS kurtosis_LIME,
    
    (SUM(POWER((`O2SIDE1`) - (SELECT AVG(`O2SIDE1`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE1`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE1,
    
    (SUM(POWER((`O2SIDE2`) - (SELECT AVG(`O2SIDE2`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE2`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE2,
    
    (SUM(POWER((`O2SIDE3`) - (SELECT AVG(`O2SIDE3`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`O2SIDE3`) FROM data_set), 4)) - 3) AS kurtosis_O2SIDE3,
    
    (SUM(POWER((`Pour_Back_Metal`) - (SELECT AVG(`Pour_Back_Metal`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Pour_Back_Metal`) FROM data_set), 4)) - 3) AS kurtosis_Pour_Back_Metal,
    
    (SUM(POWER((`LM_WT`) - (SELECT AVG(`LM_WT`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`LM_WT`) FROM data_set), 4)) - 3) AS kurtosis_LM_WT,
    
    (SUM(POWER((`Production`) - (SELECT AVG(`Production`) FROM data_set), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(`Production`) FROM data_set), 4)) - 3) AS kurtosis_Production
FROM data_set;
