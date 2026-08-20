import pandas as pd

# Load raw data
df = pd.read_csv('train.csv')

# Impute missing Postal Codes
df['Postal Code'] = df['Postal Code'].fillna(5401).astype(int)

# Standardize column names
df.columns = df.columns.str.strip().str.replace(' ', '_').str.replace('-', '_')

# Parse date columns
df['Order_Date'] = pd.to_datetime(df['Order_Date'], format='%d/%m/%Y')
df['Ship_Date'] = pd.to_datetime(df['Ship_Date'], format='%d/%m/%Y')

# Feature Engineering
df['Shipping_Days'] = (df['Ship_Date'] - df['Order_Date']).dt.days
df['Order_Year'] = df['Order_Date'].dt.year
df['Order_Month'] = df['Order_Date'].dt.month

# Clean text
text_columns = df.select_dtypes(include=['object']).columns
for col in text_columns:
    df[col] = df[col].str.strip()

# Export clean dataset
df.to_csv('cleaned_sales_data.csv', index=False)
