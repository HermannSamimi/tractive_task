

SELECT
  _id,
  purchase_id,
  event_name,
  payment_plan_id,
  subscription_id,
  user_id,
  created_at,
  current_timestamp() AS modeling_ingestion_timestamp
FROM TRACTIVE_DB.PUBLIC.RAW_DATA


  WHERE created_at > (SELECT MAX(created_at) FROM TRACTIVE_DB.public.load_data)
