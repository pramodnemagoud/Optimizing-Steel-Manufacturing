# -*- coding: utf-8 -*-
"""
Created on Sun Jul  7 19:05:18 2024

@author: cw
"""

import pandas as pd
import numpy as np
from scipy import stats

# Load your dataset
file_path = r"C:/Users/cw/Desktop/Dataset_steel.xlsx"
data = pd.read_excel(file_path)


# Convert 'SRNO' and 'HEATNO' to string
data['SRNO'] = data['SRNO'].astype(str)
data['HEATNO'] = data['HEATNO'].astype(str)


# Function to calculate required statistics
def calculate_statistics(df):
    numeric_cols = df.select_dtypes(include=[np.number]).columns
    stats_df = pd.DataFrame(index=numeric_cols)
    
    stats_df['mean'] = df[numeric_cols].mean()
    stats_df['median'] = df[numeric_cols].median()
    stats_df['mode'] = df[numeric_cols].mode().iloc[0]  # Mode can have multiple values, take the first
    stats_df['variance'] = df[numeric_cols].var()
    stats_df['std_dev'] = df[numeric_cols].std()
    stats_df['range'] = df[numeric_cols].max() - df[numeric_cols].min()
    stats_df['skewness'] = df[numeric_cols].skew()
    stats_df['kurtosis'] = df[numeric_cols].apply(lambda x: stats.kurtosis(x, fisher=False))
    return stats_df

# Calculate and display statistics
statistics = calculate_statistics(data)
print(statistics)
#Save in new excel sheet
statistics.to_excel("C:/Users/cw/Desktop/statistics1.xlsx", index=True)


# Function to calculate mode for categorical columns
def calculate_mode(data):
    mode_df = data.select_dtypes(include=['object', 'category']).mode()
    return mode_df
# Calculate the mode for all categorical columns
mode_categorical_columns = calculate_mode(data)
print(mode_categorical_columns)

##################################################################################
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np
from scipy import stats

# Load your dataset
file_path = r"C:/Users/cw/Desktop/Dataset_steel.xlsx"
data = pd.read_excel(file_path)


######################### BAR PLOT ##########################################3

df = pd.DataFrame(data)

# Select numerical columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Plot bar charts for numerical columns
for col in numeric_columns:
    plt.figure(figsize=(10, 6))
    plt.bar(df.index, df[col])
    plt.xlabel('Index')
    plt.ylabel(col)
    plt.title(f'Bar Chart of {col}')
    plt.show()

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Calculate the sum of each numeric column
numeric_sums = df[numeric_columns].sum()

# Select the top 10 columns with the highest sum
top_10_numeric_sums = numeric_sums.nlargest(10)

# Plot the bar chart
import pandas as pd
import matplotlib.pyplot as plt

# Load the data
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Create bar charts for each numeric column with 10 bins
for column in numeric_columns:
    plt.figure(figsize=(10, 6))
    df[column].plot(kind='hist', bins=10, alpha=0.7, edgecolor='black')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(True)
    plt.show()

############################ HISTOGRAM PLOTS ###############################

# Plot histograms for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    plt.hist(data[column], bins=20, color='skyblue', edgecolor='black')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(axis='y', alpha=0.75)
    plt.show()


########################## DENSITY PLOTS ##########################################


# Plot density plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    sns.kdeplot(data[column], shade=True, color='skyblue')
    plt.title(f'Density Plot of {column}')
    plt.xlabel(column)
    plt.ylabel('Density')
    plt.show()
 
######################### BOX PLOTS ################################################    
        
import seaborn as sns
# Plot box plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    sns.boxplot(x=data[column], color='skyblue')
    plt.title(f'Box Plot of {column}')
    plt.xlabel(column)
    plt.show()
  
    


########################## Q-Q PLOTS ############################################  
# Assuming `data` is your DataFrame with numerical columns
import scipy.stats as stats
# Plot Q-Q plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    stats.probplot(data[column], dist="norm", plot=plt)
    plt.title(f'Q-Q Plot for {column}')
    plt.xlabel('Theoretical Quantiles')
    plt.ylabel('Sample Quantiles')
    plt.grid(True)
    plt.show()
 
    
 
    
######################### BIVARIATE PLOTS######################################
######################## SCATTER PLOTS ########################################
# Assuming data is loaded and now proceed with plotting
import pandas as pd
import matplotlib.pyplot as plt
df = pd.DataFrame(data)

numeric_columns = ['SRNO', 'HEATNO', 'COKE_REQ', 'INJ1_QTY\n(Coke Injection Qty)', 
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
#df.dtypes
categorical_columns = ['GRADE', 'SECTION_IC']

# Plotting each numeric column against each categorical column
for numeric_col in numeric_columns:
    for cat_col in categorical_columns:
        plt.figure(figsize=(8, 6))
        plt.scatter(df[cat_col], df[numeric_col], alpha=0.5)
        plt.title(f'{numeric_col} vs {cat_col}')
        plt.xlabel(cat_col)
        plt.ylabel(numeric_col)
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()
        
# Ensure categorical columns are correctly identified and cleaned
df['GRADE'] = df['GRADE'].astype(str)  # Ensure it's string type
df['SECTION_IC'] = df['SECTION_IC'].astype(str)  # Ensure it's string type
        
import pandas as pd
import matplotlib.pyplot as plt

# Assuming the data is already loaded into a DataFrame 'df'
numeric_columns = ['SRNO', 'HEATNO', 'COKE_REQ', 'INJ1_QTY\n(Coke Injection Qty)', 
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

categorical_columns = ['GRADE', 'SECTION_IC']

# Plotting each numeric column against each categorical column using bar plot
for numeric_col in numeric_columns:
    for cat_col in categorical_columns:
        plt.figure(figsize=(10, 6))
        df.groupby(cat_col)[numeric_col].mean().plot(kind='bar', alpha=0.7)
        plt.title(f'Average {numeric_col} by {cat_col}')
        plt.xlabel(cat_col)
        plt.ylabel(f'Average {numeric_col}')
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()
 
###################### TIME SERIES PLOTS ##########################################

# Plot time series for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(10, 6))
    plt.plot(data.index, data[column], marker='o', linestyle='-', color='b', label=column)
    plt.title(f'Time Series Plot for {column}')
    plt.xlabel('Date')
    plt.ylabel(column)
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.show()
    
    

##############################################################################
numeric_df = df[numeric_columns]

# Calculate correlation matrix
corr_matrix = numeric_df.corr()

# Plotting the correlation matrix using seaborn
plt.figure(figsize=(30, 24))  # Adjust the figure size (width, height) as necessary
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt='.2f', linewidths=0.5)
plt.title('Correlation Matrix of Numeric Columns', fontsize=20)
plt.xticks(rotation=45)
plt.yticks(rotation=0)
plt.tight_layout()
plt.show()
