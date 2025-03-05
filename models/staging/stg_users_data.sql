SELECT
	toInt64(id) as id,
	toInt64(current_age) as current_age,
	toInt64(retirement_age) as retirement_age,
	toInt64(birth_year) as birth_year,
	toInt64(birth_month) as birth_month,
	gender,
	address,
	toFloat64(latitude) as latitude,
	toFloat64(longitude) as longitude,
	toInt64(right(per_capita_income, -1)) per_capita_income_usd,
	toInt64(right(yearly_income, -1)) as yearly_income_usd,
	toInt64(right(total_debt, -1)) AS total_debt_usd,
	toInt64(credit_score) as credit_score,
	toInt64(num_credit_cards) as num_credit_cards
FROM
    {{ source('default', 'users_data') }}
