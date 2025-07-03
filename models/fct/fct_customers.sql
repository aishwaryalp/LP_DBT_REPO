{{ config(
    materialized='incremental',
    pre_hook=[
        "{% if is_incremental() %} DELETE FROM {{ this }} WHERE customer_id IN (SELECT customer_id FROM AIRBNB.RAW.CUSTOMER) {% endif %}"
    ]
) }}

SELECT
    customer_id,
    name,
    UPDATED_AT,PHONE_NUMBER
FROM AIRBNB.RAW.CUSTOMER
