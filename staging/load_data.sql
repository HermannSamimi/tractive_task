{{ config(
    materialized='incremental',
    unique_key='_id',
    alias='load_data'
) }}

SELECT
  _id,
  purchase_id,
  event_name,
  payment_plan_id,
  subscription_id,
  user_id,
  created_at,
  current_timestamp() AS modeling_ingestion_timestamp
FROM {{ source('raw', 'RAW_DATA') }}

{% if is_incremental() %}
  WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}