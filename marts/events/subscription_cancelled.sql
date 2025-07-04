select
  subscription_id,
  count(*) as cancel_count,
  min(created_at) as first_cancelled_at
from {{ ref("transformation") }}
where event_name = 'CANCELLED'
group by subscription_id