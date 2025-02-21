SELECT
    code as merchant_category_code,
    description as merchant_category_name
FROM {{ ref('stg_mcc_codes') }}
