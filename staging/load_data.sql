{{ config(
    materialized='incremental',
    unique_key='_id',
    alias='load_data'
) }}

SELECT
  CAST(_id AS STRING) AS _id,
  CAST(purchase_id AS STRING) AS purchase_id,
  CAST(event_name AS STRING) AS event_name,
  CAST(payment_plan_id AS STRING) AS payment_plan_id,
  CAST(subscription_id AS STRING) AS subscription_id,
  CAST(user_id AS STRING) AS user_id,
  CAST(created_at AS TIMESTAMP) AS created_at,
  current_timestamp() AS modeling_ingestion_timestamp
FROM {{ source('raw', 'RAW_DATA') }}

{% if is_incremental() %}
  WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}