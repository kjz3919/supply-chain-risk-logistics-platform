import polars as pl
from dotenv import load_dotenv
import os
from datetime import date
todays_date = date.today()
# Defining the bucket with raw data
source = 's3://raw-scm-project/*.csv'

# Loading in the environment file
load_dotenv()
# Defining credentials for connecting with S3 and Postgres

# Credentials for S3 storage
MINIO_ROOT_USER = os.getenv("MINIO_ROOT_USER")
MINIO_ROOT_PASSWORD = os.getenv("MINIO_ROOT_PASSWORD")
# Credentials for Postgres DWH
POSTGRES_USER = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_DB = os.getenv("POSTGRES_DB")



# Defining connection options for connection with minIO storage
storage_options = {
    "aws_endpoint_url": "http://localhost:9000",
    "aws_access_key_id": MINIO_ROOT_USER,
    "aws_secret_access_key": MINIO_ROOT_PASSWORD,
    "aws_region": "us-east-1"
}

# Downloading the data from CSV and storing it into a dataframe
df = pl.scan_csv(source, storage_options=storage_options).collect()

# Writing the raw data to Postgres
df.write_database(
    table_name=f"raw.raw_scm_data_{todays_date}",
    connection=f"postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@localhost:5432/{POSTGRES_DB}",
    if_table_exists="append"
)
