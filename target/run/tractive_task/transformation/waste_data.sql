
  
    

create or replace transient table TRACTIVE_DB.public.waste_data
    
    
    
    as (

SELECT *
FROM TRACTIVE_DB.public.load_data
WHERE
  _id IS NULL OR
  event_name NOT IN ('CREATED', 'CANCELLED', 'EXPIRED') OR
  subscription_id IS NULL OR
  user_id IS NULL OR
  created_at IS NULL OR
  created_at > current_timestamp OR
  (
    event_name IN ('CREATED', 'EXPIRED') AND 
    (purchase_id IS NULL OR payment_plan_id IS NULL)
  ) OR
  (
    event_name = 'CANCELLED' AND 
    FALSE  -- purchase_id allowed to be NULL, so no extra checks here
  )
    )
;


  