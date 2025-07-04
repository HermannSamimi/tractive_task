{{ config(materialized='table') }}

with cancels as (
    select
        subscription_id,
        count(*) as cancel_count
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
    ('%' || round((sum(cancels.cancel_count) * 1.0 / nullif(count(distinct created.subscription_id), 0) * 100), 2)) as cancellation_feature_perf
from created
left join cancels using (subscription_id)