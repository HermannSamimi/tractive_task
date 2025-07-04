
    
    

with all_values as (

    select
        event_name as value_field,
        count(*) as n_records

    from TRACTIVE_DB.public.transformation
    group by event_name

)

select *
from all_values
where value_field not in (
    'CREATED','CANCELLED','EXPIRED'
)


