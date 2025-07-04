
  create or replace   view TRACTIVE_DB.public.subscription_expired
  
  
  
  
  as (
    select
  subscription_id,
  min(created_at) as expired_at
from TRACTIVE_DB.public.transformation
where event_name = 'EXPIRED'
group by subscription_id
  );

