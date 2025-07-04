

select
  c.subscription_id,
  -1 as event_count,
  c.user_id,
  c.created_at,
  c.modeling_ingestion_timestamp,
  coalesce(x.cancel_count, 0) as cancel_count,
  case when x.cancel_count is not null then true else false end as has_cancelled,
  x.first_cancelled_at,
  e.expired_at
from TRACTIVE_DB.public.subscription_created c
left join TRACTIVE_DB.public.subscription_cancelled x on c.subscription_id = x.subscription_id
left join TRACTIVE_DB.public.subscription_expired e on c.subscription_id = e.subscription_id