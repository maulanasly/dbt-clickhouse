SELECT
    id as transaction_id,
    transaction_date,
    client_id as customer_id,
    card_id,
    amount,
    use_chip,
    merchant_id,
    merchant_city,
    merchant_state,
    zip as merchant_zip,
    mcc as merchant_category_code,
    errors as transaction_errors
FROM {{ ref('stg_transactions_data') }}
