
  create or replace   view TRACTIVE_DB.public.subscription_cancelled
  
  
  
  
  as (
    select
  subscription_id,
  count(*) as cancel_count,
  min(created_at) as first_cancelled_at
from TRACTIVE_DB.public.transformation
where event_name = 'CANCELLED'
group by subscription_id
  );

