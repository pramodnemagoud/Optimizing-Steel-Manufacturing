import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
data = pd.read_excel(r"C:/Users/cw/Desktop/Dataset_steel.xlsx")
df = pd.DataFrame(data)

# List of numerical columns
numerical_columns = ['COKE_REQ', 'ENERGY (Energy Consumption)', 'Production (MT)', 
                     'TAP_TEMP (Tappnig Temperature)', 'KWH_PER_TON (Energy Consumption Per Ton)', 
                     'MELT_TIME (Melting Time)', 'TT_TIME (Total Cycle Time Including Breakdown)', 
                     'TEMPERATURE', 'POWER', 'C', 'SI', 'MN', 'P', 'S', 'CU', 'CR', 'NI', 'N']

# Plot histograms with annotations for each column
for column in numerical_columns:
    plt.figure(figsize=(8, 6))
    plt.hist(df[column].dropna(), bins=30, edgecolor='k')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(True)
    
    # Add business insight as annotation
    if column == 'COKE_REQ':
        insight = "Optimize coke mix to minimize variations,\n ensuring consistent quality and reducing energy costs."
    elif column == 'ENERGY (Energy Consumption)':
        insight = "Implement energy-saving measures during\n peak times to reduce costs and improve efficiency."
    elif column == 'Production (MT)':
        insight = "Maintain consistent output by optimizing\n scheduling and refining production processes."
    elif column == 'TAP_TEMP (Tappnig Temperature)':
        insight = "Implement precise temperature control\n measures to ensure consistent product quality."
    elif column == 'KWH_PER_TON (Energy Consumption Per Ton)':
        insight = "Reduce overall energy costs by optimizing\n furnace operations and using energy-efficient materials."
    elif column == 'MELT_TIME (Melting Time)':
        insight = "Optimize scrap preparation and furnace\n operations to reduce melt times and energy consumption."
    elif column == 'TT_TIME (Total Cycle Time Including Breakdown)':
        insight = "Minimize downtime and production delays\n through preventive maintenance and process optimization."
    elif column == 'TEMPERATURE':
        insight = "Calibrate sensors for accurate temperature\n control to maintain material properties."
    elif column == 'POWER':
        insight = "Explore renewable energy sources and\n optimize power distribution systems for cost reduction."
    elif column in ['C', 'SI', 'MN', 'P', 'S', 'CU', 'CR', 'NI', 'N']:
        insight = "Implement strict quality control measures\n based on chemical composition analysis."
    else:
        insight = "Insight not specified."

    plt.annotate(insight, xy=(0.5, 0.85), xycoords='axes fraction',
                 bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    
    plt.tight_layout()
    plt.show()
