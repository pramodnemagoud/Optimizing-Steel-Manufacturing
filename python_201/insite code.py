# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8 07:42:35 2024

@author: pramod nemagouda
"""

import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# List of numerical columns
numerical_columns = ['SRNO', 'HEATNO', 'COKE_REQ', 'INJ1_QTY\n(Coke Injection Qty)', 
                     'INJ2_QTY\n(Coke Injection Qty)', 'BSM', 'TP', 'MSTB', 'SKULL', 
                     'SHRAD', 'REMET', 'BP', 'HBI', 'OTHERS', 'SCRAP_QTY (MT)', 
                     'PIGIRON', 'DRI1_QTY (MT) (Lumps)', 'DRI2_QTY\n(MT) (Fines)', 
                     'TOT_DRI_QTY', 'HOT_METAL (HOT Metal from MBF)', 'Total Charge', 
                     'Hot_Heel (Left Over Liquid metal in EAF)', 'DOLO', 'DOLO1_EMPTY', 
                     'TOT_LIME_QTY', 'TAP_TEMP (Tappnig Temperature)', 'O2REQ', 'O2ACT', 
                     'ENERGY (Energy Consumption)', 'KWH_PER_TON (Energy Consumption Per Ton)', 
                     'KWH_PER_MIN', 'MELT_TIME (Melting Time)', 'TA_TIME (Turn Around Time)', 
                     'TT_TIME (Total Cycle Time Including Breakdown)', 'ARCING_TIME', 
                     'DOWN_TIME', 'E1_CUR (Electrode 1 Current)', 'E2_CUR (Electrode 2 Current)', 
                     'E3_CUR (Electrode 3 Current)', 'SPOUT (Bottom Refractory Temperature)', 
                     'DOLOMIT', 'CPC', 'TEMPERATURE', 'POWER', 'C', 'SI', 'MN', 'P', 'S', 'CU', 
                     'CR', 'NI', 'N', 'TIME_UTLN_PRCNT', 'TOP_COKE', 'OPEN_C', 'TAP_C', 'IT_KG', 
                     'BUCKET_NO', 'STATIC_WT', 'LIME', 'LIME2', 'O2SIDE1', 'O2SIDE2', 'O2SIDE3', 
                     'SPINNING', 'RAMMING1', 'RAMMING2', 'TAP_DURATION', 'Pour_Back_Metal', 'LM_WT', 
                     'Production (MT)']

# Business insights 
business_insights = {
    'SRNO': 'Sequential numbering, evenly distributed.',
    'HEATNO': 'Batch or cycle identifier, varies in distribution.',
    'COKE_REQ': 'Coke injection quantity, may show clusters depending on usage patterns.',
    'INJ1_QTY\n(Coke Injection Qty)': 'Injector 1 coke injection, similar distribution to INJ2.',
    'INJ2_QTY\n(Coke Injection Qty)': 'Injector 2 coke injection, similar distribution to INJ1.',
    'BSM': 'Bosh Slag Modulus, typically follows a normal distribution.',
    'TP': 'Tap Process, varies widely depending on operational conditions.',
    'MSTB': 'Mitsubishi Total Balance, may show clustering or uniform distribution.',
    'SKULL': 'Solidified steel residue, may have spikes or normal distribution.',
    'SHRAD': 'Steel Refractory Additives, varied distribution based on usage.',
    'REMET': 'Remelted steel, distribution influenced by recycling practices.',
    'BP': 'Blow Pressure, varied distribution based on operational settings.',
    'HBI': 'Hot Briquetted Iron, distribution varies based on usage.',
    'OTHERS': 'Other materials used, distribution depends on material frequency.',
    'SCRAP_QTY (MT)': 'Scrap quantity, distribution may vary based on recycling practices.',
    'PIGIRON': 'Pig Iron usage, distribution influenced by material sourcing.',
    'DRI1_QTY (MT) (Lumps)': 'DRI (Lumps) quantity, distribution influenced by material availability.',
    'DRI2_QTY\n(MT) (Fines)': 'DRI (Fines) quantity, distribution influenced by material availability.',
    'TOT_DRI_QTY': 'Total DRI quantity, distribution based on overall demand and availability.',
    'HOT_METAL (HOT Metal from MBF)': 'Hot Metal from Mini Blast Furnace, distribution reflects production cycles.',
    'Total Charge': 'Material charge, distribution influenced by production needs.',
    'Hot_Heel (Left Over Liquid metal in EAF)': 'Leftover liquid metal, distribution influenced by furnace operations.',
    'DOLO': 'Dolomite usage, distribution varies based on operational needs.',
    'DOLO1_EMPTY': 'Dolomite quantity, may have gaps or spikes in distribution.',
    'TOT_LIME_QTY': 'Total lime quantity, distribution influenced by operational needs.',
    'TAP_TEMP (Tappnig Temperature)': 'Tapping temperature, distribution varies based on operational conditions.',
    'O2REQ': 'Oxygen requirement, distribution reflects process needs.',
    'O2ACT': 'Actual oxygen usage, distribution influenced by operational conditions.',
    'ENERGY (Energy Consumption)': 'Energy consumption, distribution may show peaks during peak production times.',
    'KWH_PER_TON (Energy Consumption Per Ton)': 'Energy consumption per ton, distribution reflects efficiency measures.',
    'KWH_PER_MIN': 'Energy consumption per minute, distribution varies based on operational efficiency.',
    'MELT_TIME (Melting Time)': 'Melting time, distribution influenced by furnace and charge characteristics.',
    'TA_TIME (Turn Around Time)': 'Turnaround time, distribution reflects operational efficiency.',
    'TT_TIME (Total Cycle Time Including Breakdown)': 'Total cycle time, distribution reflects operational uptime.',
    'ARCING_TIME': 'Arcing time, distribution influenced by electrode and operational conditions.',
    'DOWN_TIME': 'Downtime, distribution may show spikes during maintenance periods.',
    'E1_CUR (Electrode 1 Current)': 'Electrode 1 current, distribution influenced by electrical and operational settings.',
    'E2_CUR (Electrode 2 Current)': 'Electrode 2 current, distribution influenced by electrical and operational settings.',
    'E3_CUR (Electrode 3 Current)': 'Electrode 3 current, distribution influenced by electrical and operational settings.',
    'SPOUT (Bottom Refractory Temperature)': 'Bottom refractory temperature, distribution varies based on furnace conditions.',
    'DOLOMIT': 'Dolomite usage, distribution influenced by operational needs.',
    'CPC': 'Coal pitch consumption, distribution varies based on furnace and operational settings.',
    'TEMPERATURE': 'Overall temperature, distribution reflects operational conditions and efficiency measures.',
    'POWER': 'Power consumption, distribution may show peaks during peak production times.',
    'C': 'Carbon content, distribution influences steel properties and operational efficiency.',
    'SI': 'Silicon content, distribution influences steel properties and operational efficiency.',
    'MN': 'Manganese content, distribution influences steel properties and operational efficiency.',
    'P': 'Phosphorus content, distribution influences steel properties and operational efficiency.',
    'S': 'Sulfur content, distribution influences steel properties and operational efficiency.',
    'CU': 'Copper content, distribution influences steel properties and operational efficiency.',
    'CR': 'Chromium content, distribution influences steel properties and operational efficiency.',
    'NI': 'Nickel content, distribution influences steel properties and operational efficiency.',
    'N': 'Nitrogen content, distribution influences steel properties and operational efficiency.',
    'TIME_UTLN_PRCNT': 'Time utilization percentage, distribution reflects operational efficiency.',
    'TOP_COKE': 'Top coke usage, distribution varies based on furnace and operational settings.',
    'OPEN_C': 'Open cavity, distribution influenced by furnace and operational settings.',
    'TAP_C': 'Tap cavity, distribution influenced by furnace and operational settings.',
    'IT_KG': 'Iron taphole kg, distribution influenced by furnace and operational settings.',
    'BUCKET_NO': 'Bucket number, typically evenly distributed or sequential.',
    'STATIC_WT': 'Static weight, distribution varies based on equipment characteristics.',
    'LIME': 'Lime usage, distribution influenced by operational and furnace settings.',
    'LIME2': 'Lime quantity 2, distribution influenced by operational and furnace settings.',
    'O2SIDE1': 'Oxygen side 1, distribution reflects process and operational needs.',
    'O2SIDE2': 'Oxygen side 2, distribution reflects process and operational needs.',
    'O2SIDE3': 'Oxygen side 3, distribution reflects process and operational needs.',
    'SPINNING': 'Spinning process, distribution influenced by production and operational settings.',
    'RAMMING1': 'Ramming material 1, distribution influenced by furnace and operational settings.',
    'RAMMING2': 'Ramming material 2, distribution influenced by furnace and operational settings.',
    'TAP_DURATION': 'Tapping duration, distribution influenced by furnace and operational settings.',
    'Pour_Back_Metal': 'Metal poured back, distribution influenced by recycling and operational efficiency.',
    'LM_WT': 'Liquid metal weight, distribution reflects furnace and operational efficiency.',
    'Production (MT)': 'Steel production, typically reflects production cycles and efficiency.'
}

# Plot histograms based on patterns
for column in numerical_columns:
    plt.figure(figsize=(8, 6))
    df[column].plot(kind='hist', bins=20, alpha=0.7, color='skyblue')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(True)
    if column in business_insights:
        plt.annotate(business_insights[column], xy=(0.5, 0.95), xycoords='axes fraction',
                     horizontalalignment='center', verticalalignment='top', fontsize=10, color='black')
    plt.show()
