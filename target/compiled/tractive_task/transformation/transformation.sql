

SELECT
  _id,
  event_name,
  purchase_id,
  payment_plan_id,
  subscription_id,
  user_id,
  created_at,
--   current_timestamp as currenttimestamp,
  CAST(created_at AS DATE) AS date,
  DATE_PART('HOUR', created_at) AS hour,
  modeling_ingestion_timestamp
FROM TRACTIVE_DB.public.load_data
WHERE
  _id IS NOT NULL AND
  (
    (event_name = 'CREATED' AND purchase_id IS NOT NULL AND payment_plan_id IS NOT NULL) OR
    (event_name = 'EXPIRED' AND purchase_id IS NOT NULL AND payment_plan_id IS NOT NULL) OR
    (event_name = 'CANCELLED')
  ) AND
  payment_plan_id IS NOT NULL AND
  subscription_id IS NOT NULL AND
  user_id IS NOT NULL AND
  created_at IS NOT NULL AND
  created_at < current_timestamp

order by event_name