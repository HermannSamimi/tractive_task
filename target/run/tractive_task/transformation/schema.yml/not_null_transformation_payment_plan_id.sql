
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select payment_plan_id
from TRACTIVE_DB.public.transformation
where payment_plan_id is null



  
  
      
    ) dbt_internal_test