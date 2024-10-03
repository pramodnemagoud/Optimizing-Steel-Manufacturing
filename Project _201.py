#-*- coding: utf-8 -*-
"""
Created on Thu Jun 27 18:39:08 2024

@author: pramod nemagouda
"""
'''

   Optimizing Steel Manufacturing: Charge Composition and Energy Use

●Business Problem
The company struggles with variability in material mix and power consumption, impacting product quality. Identifying the optimal charge mix and power usage will improve efficiency, reduce costs, and ensure consistent quality.


# `CRISP-ML(Q)` process model describes six phases:
# 
# 1. Business and Data Understanding
# 2. Data Preparation
# 3. Model Building
# 4. Evaluation
# 5. Deployment
# 6. Monitoring and Maintenance
'''
# Objective(s):Maximize product quality, efficiency, and cost savings.
# Constraints: Maximize power consumption

'''Success Criteria'''

'''Business Success Criteria - Improve production efficiency by 20%
   Economic Success Criteria - Lower energy consumption by 15%'''

'''
 
# Data Collection: Update this section after the research is done. 
 
# Data Dictionary:
# - Dataset contains 2059 rows and 79 columns


# Description:

'''




import pandas as pd
from sqlalchemy import create_engine

# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Optimizing Steel Manufacturing/Dataset_steel.xlsx")

# Replace with your actual PostgreSQL credentials
user = "postgres"
password = "pramod108" #ALTER USER postgres WITH PASSWORD 'pramod108';
host = "localhost"
port = "5432"  # Default PostgreSQL port
database = "practice_db"

# Create a PostgreSQL engine
engine = create_engine(f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}")


#pip install pandas sqlalchemy psycopg2

data.to_sql("practice_db", con=engine, if_exists='replace', index=False)


# Uncomment if sqlalchemy not installed
#!pip install sqlalchemy, psycopg2

from sqlalchemy import create_engine, text
from urllib.parse import quote

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Install the required packages if not present already
# pip install sweetviz
# pip install py-AutoClean
# pip install clusteval
# pip install sqlalchemy
# pip install pymysql


from sqlalchemy import create_engine

# Replace these variables with your actual database credentials
user = 'dbo'
password = 'pramod108'
server = '127.0.0.1'  # or '127.0.0.1' or '.'
database = 'demodb'

# Create the connection string
engine = create_engine(f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server")

data.to_sql("Data_sett", con=engine, if_exists='replace', chunksize=None, index=False)











import pandas as pd
# Read the XLSX file into a Pandas DataFrame
data = pd.read_csv(r"C:/Users/cw/Desktop/Wind_turbine.csv")


from sqlalchemy import create_engine
# Replace with your actual credentials
user = "root"
password = "pramod108"
database = "project_201"

engine = create_engine(f"mysql+pymysql://{user}:{password}@localhost:3306/{database}")
data.to_sql("Data_sett", con=engine, if_exists='replace', chunksize=None, index=False)

data.to_sql("Data_sett", con=engine, if_exists='replace', chunksize=None, index=False)
 
data_columns = data.columns

data_dtypes= data.dtypes


# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")

################## zero columns ###############

# List of columns to remove
columns_to_remove = ['COKE_REQ', 'TP', 'MSTB', 'SHRAD', 'REMET', 'O2REQ', 'ARCING_TIME', 
                     'DOWN_TIME', 'DOLOMIT', 'CPC', 'TEMPERATURE', 'POWER', 'TIME_UTLN_PRCNT', 
                     'TOP_COKE', 'LIME2', 'SPINNING', 'RAMMING1', 'RAMMING2']

# Remove the columns
data = data.drop(columns=columns_to_remove)

# Display the first few rows of the modified DataFrame
print(data.head())

################ Type casting #################
# Convert 'SRNO' and 'HEATNO' to string
data['SRNO'] = data['SRNO'].astype(str)
data['HEATNO'] = data['HEATNO'].astype(str)


##############################################
### Identify duplicate records in the data ###
duplicate = data.duplicated()  # Returns Boolean Series denoting duplicate rows.
duplicate

sum(duplicate)


# Option 1: Get all numeric data types (including floats)
#numeric_columns = data.select_dtypes(include='number').columns.tolist()
numeric_columns = data.select_dtypes(include=['float64', 'int64']).columns
# Null value in parcenatage
null_percent = ((data.isnull().sum())/2059)*100



####### FIRST MOMENT BUSINESS DECISION ##########

######### MEASURE OF CENTRAL TENDENCY ###########


######### MEAN ###########

mean = data[numeric_columns].mean()
mean

######## MEADIAN #########

median = data[numeric_columns].median()
median
######## MODE ############

mode = data[numeric_columns].mode()
mode

############ SECOND MOMENT BUSINESS DECISION ##########

############ MEASURE OF DISPERSION #############


###### VARIANCE #######

variance = data[numeric_columns].var()
variance

######## STANDARD DEVIATION ###########

std_dev = data[numeric_columns].std()
std_dev

####### RANGE ##########
range_data = data[numeric_columns].max() - data[numeric_columns].min()
range_data


############## THIRD MOMENT BUSINESS DECISION #############

############ MEASURE OF ASSEMETRY #############


###### SKEWNESS ########

skewness_data = data[numeric_columns].skew()
skewness_data

############ FOURTH MOMENT BUSINESS DECISION ###########

######## MEASURE OF PEAKNESS ##########


######### KURTOSIS #######

kurtosis_data = data[numeric_columns].kurt() 
kurtosis_data




import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Example data
# data = pd.read_csv('your_data.csv')  # Replace with your data loading method

for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure()
    sns.kdeplot(data[column].dropna(), shade=True)
    mean_value = data[column].mean()
    median_value = data[column].median()
    mode_value = data[column].mode().iloc[0]
    skewness_value = data[column].skew()
    
    plt.title(f'Density Plot for {column} (Mean: {mean_value:.2f}, Median: {median_value:.2f}, Mode: {mode_value:.2f}, Skewness: {skewness_value:.2f})')
    plt.xlabel(column)
    plt.ylabel('Density')
    plt.axvline(mean_value, color='r', linestyle='--', label=f'Mean: {mean_value:.2f}')
    plt.axvline(median_value, color='g', linestyle='-.', label=f'Median: {median_value:.2f}')
    plt.axvline(mode_value, color='b', linestyle='-', label=f'Mode: {mode_value:.2f}')
    plt.legend()
    plt.show()



##############  Using seaborn for density plots with skewness calculation:###############

   # Iterate through all numerical columns and plot density plots with skewness
for column in data.select_dtypes(include=['float64', 'int64']).columns:
   plt.figure()
   sns.kdeplot(data[column].dropna(), shade=True)
   skewness = data[column].skew()
   plt.title(f'Density Plot for {column} (Skewness: {skewness:.2f})')
   plt.xlabel(column)
   plt.ylabel('Density')
   plt.show()
 
#################  Using seaborn for density plots with kurtosis calculation:########

    # Assuming your DataFrame is named 'data'
    # data = pd.read_csv('your_file.csv')  # or data = pd.read_excel('your_file.xlsx')

    # Iterate through all numerical columns and plot density plots with kurtosis
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure()
    sns.kdeplot(data[column].dropna(), shade=True)
    kurtosis = data[column].kurtosis()
    plt.title(f'Density Plot for {column} (Kurtosis: {kurtosis:.2f})')
    plt.xlabel(column)
    plt.ylabel('Density')
    plt.show()


######################### BAR PLOT ##########################################3

# Plot bar plots for categorical columns
for column in data.select_dtypes(include=['object', 'category']).columns:
    plt.figure()
    data[column].value_counts().plot(kind='bar', title=column)
    plt.xlabel(column)
    plt.ylabel('Frequency')
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
    
###################### TIME SERIES PLOTS ##########################################

# Assuming `data` is your DataFrame with a datetime index

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

categorical_columns = ['GRADE', 'SECTION_IC']

# Ensure categorical columns are correctly identified and cleaned
df['GRADE'] = df['GRADE'].astype(str)  # Ensure it's string type
df['SECTION_IC'] = df['SECTION_IC'].astype(str)  # Ensure it's string type

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




###############################################################################
'''____________________ removeing zero colimns ____________________________ '''
###############################################################################

# List of columns to remove
columns_to_remove = ['COKE_REQ', 'TP', 'MSTB', 'SHRAD', 'REMET', 'O2REQ', 'ARCING_TIME', 
                     'DOWN_TIME', 'DOLOMIT', 'CPC', 'TEMPERATURE', 'POWER', 'TIME_UTLN_PRCNT', 
                     'TOP_COKE', 'LIME2', 'SPINNING', 'RAMMING1', 'RAMMING2','Pour_Back_Metal']

# Remove the columns
data = data.drop(columns=columns_to_remove)

# Display the first few rows of the modified DataFrame
print(data.head())


###############################################################################
'''___________________________ Type casting ________________________________'''
###############################################################################
df = pd.DataFrame(data)
# Convert datetime using the specified format
df['DATETIME'] = pd.to_datetime(df['DATETIME'], format='%m/%d/%Y')

df['POW_ON_TIME'] = pd.to_datetime(df['POW_ON_TIME'], format='%m/%d/%Y %H:%M')

df['LAB_REP_TIME'] = pd.to_datetime(df['LAB_REP_TIME'], format='%m/%d/%Y %H:%M')

df['PREV_TAP_TIME'] = pd.to_datetime(df['PREV_TAP_TIME'], format='%m/%d/%Y %H:%M')

# Verify the conversion
print(df['DATETIME'].head())
print(df['POW_ON_TIME'].head())
print(df['LAB_REP_TIME'].head())
print(df['PREV_TAP_TIME'].head())

# Convert 'SRNO' and 'HEATNO' to string
data['SRNO'] = data['SRNO'].astype(str)
data['HEATNO'] = data['HEATNO'].astype(str)


# Convert 'SRNO' and 'HEATNO' to string
df['SRNO'] = df['SRNO'].astype(str)
df['HEATNO'] = df['HEATNO'].astype(str)
###############################################################################
'''____________________________ Handling Duplicates _______________________ '''
###############################################################################

### Identify duplicate records in the data ###
duplicate = df.duplicated()  # Returns Boolean Series denoting duplicate rows.
duplicate

sum(duplicate)


# Option 1: Get all numeric data types (including floats)
#numeric_columns = data.select_dtypes(include='number').columns.tolist()
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns
# Null value in parcenatage
null_percent = ((df.isnull().sum())/2059)*100

###############################################################################
'''____________________________ Rename columns ____________________________ '''
###############################################################################

df = pd.DataFrame(data)

# Rename columns
df = df.rename(columns={
    'SCRAP_QTY (MT)': 'SCRAP_QTY',
    'DRI1_QTY (MT) (Lumps)': 'DRI1_QTY',
    'DRI2_QTY\n(MT) (Fines)': 'DRI2_QTY',
    'HOT_METAL (HOT Metal from MBF)': 'HOT_METAL',
    'Hot_Heel (Left Over Liquid metal in EAF)': 'Hot_Heel',
    'TAP_TEMP (Tappnig Temperature)': 'TAP_TEMP',
    'ENERGY (Energy Consumption)': 'ENERGY',
    'KWH_PER_TON (Energy Consumption Per Ton)': 'KWH_PER_TON',
    'MELT_TIME (Melting Time)': 'MELT_TIME',
    'TA_TIME (Turn Around Time)': 'TA_TIME',
    'TT_TIME (Total Cycle Time Including Breakdown)': 'TT_TIME',
    'E1_CUR (Electrode 1 Current)': 'E1_CUR',
    'E2_CUR (Electrode 2 Current)': 'E2_CUR',
    'E3_CUR (Electrode 3 Current)': 'E3_CUR',
    'SPOUT (Bottom Refractory Temperature)': 'SPOUT',
    'Production (MT)': 'Production',
    'total charge': 'Total_Charge',
    'INJ1_QTY\n(Coke Injection Qty)': 'INJ1_QTY',
    'INJ2_QTY\n(Coke Injection Qty)': 'INJ2_QTY'
})

###############################################################################
'''____________________________ Missing values ____________________________ '''
###############################################################################

# Identify missing values
missing_values = df.isnull().sum()

# Print the columns with missing values and their counts
print("Missing Values:")
print(missing_values[missing_values > 0])


# Fill missing values in numeric columns with the median of each column
df['LAB_REP_TIME'] = df['LAB_REP_TIME'].fillna(df['LAB_REP_TIME'].median())

df['Production'] = df['Production'].fillna(df['Production'].mean())

df['PREV_TAP_TIME'] = df['PREV_TAP_TIME'].fillna(df['PREV_TAP_TIME'].mean())

#After Fill missing Identify missing values
missing_values = df.isnull().sum()
# Print the columns with missing values and their counts
print("Missing Values:")
print(missing_values[missing_values > 0])



###############################################################################
'''____________________________ Outliers ___________________________________'''
###############################################################################

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the Excel file into a DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")  
df = pd.DataFrame(data)  

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Initialize an empty dictionary to store outliers for each column
outliers_dict = {}

# Store original DataFrame for plotting
df_original = df.copy()

# Iterate over each numeric column
for col in numeric_columns:
    Q1 = df[col].quantile(0.25)  # Calculate the first quartile (25th percentile)
    Q3 = df[col].quantile(0.75)  # Calculate the third quartile (75th percentile)
    IQR = Q3 - Q1  # Calculate the interquartile range (IQR)
    lower_bound = Q1 - 1.5 * IQR  # Calculate the lower bound for outliers
    upper_bound = Q3 + 1.5 * IQR  # Calculate the upper bound for outliers

    # Identify outliers
    outliers = df[(df[col] < lower_bound) | (df[col] > upper_bound)]  # Find outliers outside the lower and upper bounds

    # Store outliers in the dictionary if there are any
    if not outliers.empty:
        outliers_dict[col] = outliers

    # Compute the median of the column
    median = df[col].median()

    # Replace outliers with the median in the original DataFrame
    df.loc[(df[col] < lower_bound) | (df[col] > upper_bound), col] = median

# Plot boxplots for columns with outliers before and after replacing outliers with median
for col in outliers_dict.keys():
    fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(12, 6))

    # Boxplot before removing outliers
    sns.boxplot(y=df_original[col], ax=axes[0])
    axes[0].set_title(f'Boxplot of {col} (Before)')

    # Boxplot after replacing outliers with median
    sns.boxplot(y=df[col], ax=axes[1])
    axes[1].set_title(f'Boxplot of {col} (After)')

    plt.tight_layout()
    plt.show()




# Convert 'SRNO' and 'HEATNO' to string
df['SRNO'] = df['SRNO'].astype(int)
df['HEATNO'] = df['HEATNO'].astype(int)
# Remove the columns
df = df.drop(columns='Pour_Back_Metal')

# Save the cleaned DataFrame to a new Excel file
cleaned_file_path = r"C:/Users/cw/Downloads/Cleaned_Dataset_1.xlsx"
df.to_excel(cleaned_file_path, index=False)


# Plot boxplots for columns with outliers
for col in outliers_dict:
    fig, axes = plt.subplots(1, 2, figsize=(14, 6))  # Create a subplot with 1 row and 2 columns, set figure size

    # Boxplot before removing outliers
    sns.boxplot(df=df[[col]], ax=axes[0])  # Create a boxplot of the original data for the column
    axes[0].set_title(f'{col} - Before Removing Outliers')  # Set the title for the boxplot

    # Boxplot after replacing outliers with NaN
    sns.boxplot(df=df[[col]], ax=axes[1])  # Create a boxplot of the cleaned data for the column
    axes[1].set_title(f'{col} - After Replacing Outliers with NaN')  # Set the title for the boxplot

    plt.show()  # Display the plots











###############################################################################
'''____________________ Zero & near Zero Variance feature__________________ '''
###############################################################################

variance = data.var()
near_zero_var_features = variance[variance < 0.01]
print(near_zero_var_features)


###############################################################################
'''____________________ Normalization _____________________ '''
###############################################################################
import pandas as pd
from sklearn.preprocessing import MinMaxScaler

# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Initialize the MinMaxScaler
scaler = MinMaxScaler()

# Apply the scaler to the numeric columns
df[numeric_columns] = scaler.fit_transform(df[numeric_columns])
print(data)


# Save the normalized DataFrame to a new Excel file
normalized_file_path = r"C:/Users/cw/Downloads/Normalized_Dataset_steel.xlsx"
df.to_excel(normalized_file_path, index=False)


###############################################################################
'''____________________Z-Score Normalization (Standardization) _______________________'''
###############################################################################

from sklearn.preprocessing import StandardScaler

# Initialize the StandardScaler
scaler = StandardScaler()

# Apply the scaler to the numeric columns
df[numeric_columns] = scaler.fit_transform(df[numeric_columns])

# Save the standardized DataFrame to a new Excel file
standardized_file_path = r"C:/Users/cw/Downloads/Standardized_Dataset_steel.xlsx"
df.to_excel(standardized_file_path, index=False)



'''____________________ Log Transformation _____________________ '''

import numpy as np

# Apply the log transformation to the numeric columns
df[numeric_columns] = df[numeric_columns].apply(np.log1p)  # np.log1p is used to handle zero values

# Save the log-transformed DataFrame to a new Excel file
log_transformed_file_path = r"C:/Users/cw/Downloads/Log_Transformed_Dataset_steel.xlsx"
df.to_excel(log_transformed_file_path, index=False)


##################################################################################
'''____________________ Discretization/Binning/Grouping _____________________ '''
###############################################################################

import pandas as pd

# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# Select numeric columns
numeric_cols = df.select_dtypes(include=['number']).columns

# Define the number of bins and labels
num_bins = 3
bin_labels = ['Low', 'Medium', 'High']

# Apply binning to each numeric column
for col in numeric_cols:
    df[col + '_bins'] = pd.cut(df[col], bins=num_bins, labels=bin_labels)

# Print the DataFrame with binned columns
print(df)

# Save the binned DataFrame to a new Excel file
binned_file_path = r"C:/Users/cw/Downloads/Binned_Dataset_steel.xlsx"
df.to_excel(binned_file_path, index=False)


###############################################################################
'''____________________ Dummy Variable Creation _____________________ '''
###############################################################################

import pandas as pd

# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# Select categorical columns
categorical_cols = df.select_dtypes(include=['object']).columns

# Create dummy variables for categorical columns
df_with_dummies = pd.get_dummies(df, columns=categorical_cols, drop_first=True)

# Print the DataFrame with dummy variables
print(df_with_dummies)

# Save the DataFrame with dummy variables to a new Excel file
dummies_file_path = r"C:/Users/cw/Downloads/Dataset_with_Dummies_steel.xlsx"
df_with_dummies.to_excel(dummies_file_path, index=False)

























#################  Auto EDA ##############
#1 . sweetviz
import sweetviz
my_report = sweetviz.analyze([data, "data"])

my_report.show_html('Report.html')


# 2. D-Tale'

#pip install dtale
import dtale
data = pd.read_csv("C:/Users/cw/Desktop/Dataset_steel.xlsx")
d = dtale.show(data)
d.open_browser()
















