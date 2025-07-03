{{ config(materialized='view') }}
with src_hosts as(
    select * from {{ ref('src_hosts') }}
)
select 
HOST_ID,
NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from src_hosts