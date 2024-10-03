import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
import pylab
import xlsxwriter


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



# Load the data
df = pd.read_excel( r"C:/Users/cw/Desktop/Dataset_steel.xlsx")

# Define columns for analysis
columns_to_analyze = ['SRNO', 'HEATNO', 'COKE_REQ', 'INJ1_QTY\n(Coke Injection Qty)', 
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

# Convert categorical columns to categorical type if needed
categorical_cols = ['GRADE', 'SECTION_IC']

for col in categorical_cols:
    df[col] = df[col].astype('category')

# Calculate descriptive statistics
descriptive_stats = df[columns_to_analyze].describe().transpose()

# Calculate mode separately since describe() doesn't give mode
mode_values = df[columns_to_analyze].mode().iloc[0]

# Calculate skewness and kurtosis
skewness_values = df[columns_to_analyze].skew()
kurtosis_values = df[columns_to_analyze].kurt()

# Calculate range
range_values = {col: max(df[col]) - min(df[col]) for col in columns_to_analyze}

# Calculate correlation coefficients
correlation_matrix = df[columns_to_analyze].corr()

# Calculate covariance matrix
covariance_matrix = df[columns_to_analyze].cov()

# Create Excel writer
output_file = 'C:/Users/cw/Desktop/analysis_results.xlsx'
with pd.ExcelWriter(output_file, engine='xlsxwriter') as writer:
    
    # Write descriptive statistics
    descriptive_stats.to_excel(writer, sheet_name='Descriptive Statistics')
    
    # Write mode values
    pd.DataFrame({'Mode': mode_values}).to_excel(writer, sheet_name='Mode')
    
    # Write skewness values
    pd.DataFrame({'Skewness': skewness_values}).to_excel(writer, sheet_name='Skewness')
    
    # Write kurtosis values
    pd.DataFrame({'Kurtosis': kurtosis_values}).to_excel(writer, sheet_name='Kurtosis')
    
    # Write range values
    pd.DataFrame({'Range': range_values}).to_excel(writer, sheet_name='Range')
    
    # Write correlation matrix
    correlation_matrix.to_excel(writer, sheet_name='Correlation Matrix')
    
    # Write covariance matrix
    covariance_matrix.to_excel(writer, sheet_name='Covariance Matrix')
    
    # Create sheets for plots
    workbook = writer.book
    worksheet_plots = workbook.add_worksheet('Plots')

    # Function to insert an image into Excel
    def insert_image(sheet, filename, row, col):
        sheet.insert_image(row, col, filename, {'x_scale': 0.5, 'y_scale': 0.5})

    # Save each plot to a file and insert into Excel
    for i, col in enumerate(columns_to_analyze):
        plt.figure(figsize=(6, 4))
        
        # Histogram
        plt.hist(df[col])
        plt.xlabel(col)
        plt.ylabel('Frequency')
        plt.title(f"{col} distribution")
        hist_filename = f"{col}_histogram.png"
        plt.savefig(hist_filename)
        insert_image(worksheet_plots, hist_filename, i*10, 0)
        plt.close()
        
        # Density Plot
        plt.figure(figsize=(6, 4))
        sns.kdeplot(df[col])
        plt.xlabel(col)
        plt.ylabel('Density')
        plt.title(f"{col} density distribution")
        density_filename = f"{col}_density.png"
        plt.savefig(density_filename)
        insert_image(worksheet_plots, density_filename, i*10, 5)
        plt.close()
        
        # Box Plot
        plt.figure(figsize=(6, 4))
        sns.boxplot(df[col], orient='horizontal')
        plt.xlabel(col)
        plt.title(f"{col} outlier distribution")
        box_filename = f"{col}_boxplot.png"
        plt.savefig(box_filename)
        insert_image(worksheet_plots, box_filename, i*10, 10)
        plt.close()
        
        # Q-Q Plot
        plt.figure(figsize=(6, 4))
        stats.probplot(df[col], plot=pylab)
        plt.ylabel(col)
        plt.title(f"{col} Q-Q plot")
        qq_filename = f"{col}_qqplot.png"
        plt.savefig(qq_filename)
        insert_image(worksheet_plots, qq_filename, i*10, 15)
        plt.close()
        
    # Scatter Plots
    for i, col1 in enumerate(columns_to_analyze):
        for col2 in columns_to_analyze[i+1:]:
            plt.figure(figsize=(6, 4))
            sns.scatterplot(x=df[col1], y=df[col2])
            plt.xlabel(col1)
            plt.ylabel(col2)
            plt.title(f"Correlation between {col1} & {col2}")
            scatter_filename = f"{col1}_{col2}_scatter.png"
            plt.savefig(scatter_filename)
            insert_image(worksheet_plots, scatter_filename, i*10, 20)
            plt.close()

# Print confirmation message
print(f"Analysis results saved to {output_file}")