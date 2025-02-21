# DBT Staging Models

This project contains DBT staging models that transform raw data into a format suitable for analysis. The staging models are designed to clean, prepare, and structure the data from various sources.

## Models Overview

- **stg_cards_data.sql**: Staging model for the `cards_data` table, which includes transformations for credit card information.
- **stg_mcc_codes.sql**: Staging model for the `mcc_codes` table, preparing merchant category codes for analysis.
- **stg_transactions_data.sql**: Staging model for the `transactions_data` table, which processes transaction records.
- **stg_users_data.sql**: Staging model for the `users_data` table, handling user demographic and financial information.

## Sources

The sources for these models are defined in the `sources.yml` file located in the `staging` directory. This file includes descriptions and column definitions for each source table.

## Usage

To run the models, use the DBT CLI commands to build and test the transformations. Ensure that the necessary configurations are set up in your DBT project.
