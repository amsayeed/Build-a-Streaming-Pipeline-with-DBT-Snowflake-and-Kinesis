{{ config(database="DBT_PROD", tags=["stocks_batch"]) }}

with
    min_low as (
        select round(min(low)) as min_low, ticker
        from {{ ref("YAHOO_STOCKS_BATCH_DATA") }}
        where date >= current_date - (365 * 2)
        group by 2
    ),

    include_dates as (
        select m.ticker, b.date, m.min_low
        from {{ ref("YAHOO_STOCKS_BATCH_DATA") }} b
        inner join min_low m on round(b.low) = round(m.min_low) and b.ticker = m.ticker
    )

select distinct *
from include_dates
