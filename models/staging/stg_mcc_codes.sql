SELECT
    toInt64(code) as code,
    name as description
FROM
    {{ source('default', 'mcc_codes') }}
