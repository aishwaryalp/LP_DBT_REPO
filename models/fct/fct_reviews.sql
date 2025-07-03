{{
    config(
        materialized = 'incremental',
        on_schema_change= 'fail'
    )
}}

with all_src_reviews as(
    select * from {{ ref( 'src_reviews') }}
)
select * from all_src_reviews where review_date is not null

{% if is_incremental() %}
and review_date > (select max(review_date) from {{ this }})
{% endif %}