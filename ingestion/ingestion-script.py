import polars as pl
# Defining the bucket with raw data
source = 's3://raw-scm-project/*.csv'

# Defining connection options for connection with minIO storage
storage_options = {
    "aws_endpoint_url": "http://localhost:9000",
    "aws_access_key_id": "kjz",
    "aws_secret_access_key": "abcd12345",
    "aws_region": "us-east-1"
}

# Downloading the data from CSV and storing it into a dataframe
df = pl.scan_csv(source, storage_options=storage_options).collect()

