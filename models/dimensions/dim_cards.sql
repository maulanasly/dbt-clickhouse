SELECT
    id as card_id,
    client_id as customer_id,
    card_brand,
    card_type,
    card_number,
    expires,
    has_chip,
    num_cards_issued,
    credit_limit,
    acct_open_date,
    year_pin_last_changed,
    card_on_dark_web
FROM {{ ref('stg_cards_data') }}
