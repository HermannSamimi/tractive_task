
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    _id as unique_field,
    count(*) as n_records

from TRACTIVE_DB.public.transformation
where _id is not null
group by _id
having count(*) > 1



  
  
      
    ) dbt_internal_test