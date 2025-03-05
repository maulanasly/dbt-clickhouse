SELECT
    toInt64(id) as id,
    toInt64(client_id) as client_id,
    card_brand,
    card_type,
    card_number,
    toDate(concat(splitByChar('/', expires)[2], '-', splitByChar('/', expires)[1], '-01')) as expires,
    cvv,
    toUInt8(CASE
        WHEN has_chip = 'YES' THEN 1
        WHEN has_chip = 'NO' THEN 0
        ELSE 0
    END) as has_chip,
    toInt32(num_cards_issued) as num_cards_issued,
    toDecimal64(replaceRegexpAll(credit_limit, '\\$', ''), 2) as credit_limit,
    toDate(concat(splitByChar('/', acct_open_date )[2], '-', splitByChar('/', acct_open_date)[1], '-01')) as acct_open_date,
    toInt32(year_pin_last_changed) as year_pin_last_changed,
    toUInt8(CASE
        WHEN upper(card_on_dark_web) = 'YES' THEN 1
        WHEN upper(card_on_dark_web) = 'NO' THEN 0
        ELSE 0
    END) as card_on_dark_web
FROM
    {{ source('default', 'cards_data') }}
