SELECT
	toInt64(id) as id,
	toDateTime64(`date`, 0) as transaction_date,
	toInt64(client_id) as client_id,
	toInt64(card_id) as card_id,
	toDecimal64(right(amount, -1), 2) as amount,
	use_chip,
	toInt64(merchant_id) as merchant_id,
	merchant_city,
	merchant_state,
	zip,
	mcc,
	errors,
FROM
    {{ source('default', 'transactions_data') }}
