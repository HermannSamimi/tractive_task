select
  subscription_id,
  min(created_at) as created_at,
  any_value(user_id) as user_id,
  max(modeling_ingestion_timestamp) as modeling_ingestion_timestamp
from {{ ref("transformation") }}
where event_name = 'CREATED'
group by subscription_id