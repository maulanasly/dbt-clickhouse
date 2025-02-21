SELECT
    id as customer_id,
    current_age,
    retirement_age,
    birth_year,
    birth_month,
    gender,
    address,
    latitude,
    longitude,
    per_capita_income_usd,
    yearly_income_usd,
    total_debt_usd,
    credit_score,
    num_credit_cards
FROM {{ ref('stg_users_data') }}
