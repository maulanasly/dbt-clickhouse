WITH customer_metrics AS (
    SELECT
        customer_id,
        yearly_income_usd,
        credit_score,
        num_credit_cards,
        total_debt_usd
    FROM {{ ref('dim_customers') }}
),

card_metrics AS (
    SELECT
        card_id,
        customer_id,
        card_brand,
        card_type,
        credit_limit,
        has_chip,
        card_on_dark_web
    FROM {{ ref('dim_cards') }}
)

SELECT
    t.transaction_id,
    t.transaction_date,
    t.customer_id,
    t.card_id,
    t.amount,
    t.use_chip,
    t.merchant_id,
    t.merchant_city,
    t.merchant_state,
    t.merchant_zip,
    -- Merchant category details
    m.merchant_category_code,
    m.merchant_category_name,
    -- Card details
    c.card_brand,
    c.card_type,
    c.credit_limit,
    c.has_chip,
    c.card_on_dark_web,
    -- Customer metrics
    cm.yearly_income_usd,
    cm.credit_score,
    cm.num_credit_cards,
    cm.total_debt_usd,
    --    -- Derived metrics
    toDecimal64(t.amount, 2) / NULLIF(toDecimal64(c.credit_limit, 2), 0) as credit_utilization_pct,
    CASE
        WHEN toInt64(c.has_chip) = 1 AND t.use_chip ILIKE '%chip%' = 0 THEN 1
        ELSE 0
    END as is_chip_available_not_used,
    t.amount / NULLIF(cm.yearly_income_usd, 0) as transaction_to_income_ratio
FROM {{ ref('fact_transactions') }} t
LEFT JOIN {{ ref('dim_merchants') }} m
    ON toString(t.merchant_category_code) = toString(m.merchant_category_code)
LEFT JOIN card_metrics c
    ON t.card_id = c.card_id
LEFT JOIN customer_metrics cm
    ON t.customer_id = cm.customer_id
