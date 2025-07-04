{{ config(materialized='table') }}

with cancels as (
    select
        subscription_id,
        min(created_at) as first_cancel_time
    from {{ ref('transformation') }}
    where event_name = 'CANCELLED'
    group by subscription_id
),

created as (
    select subscription_id
    from {{ ref('transformation') }}
    where event_name = 'CREATED'
)

select
    ('%' || round(count(distinct cancels.subscription_id) * 1.0 / nullif(count(distinct created.subscription_id), 0) * 100, 2)) as cancellation_rate
from created
left join cancels using (subscription_id)