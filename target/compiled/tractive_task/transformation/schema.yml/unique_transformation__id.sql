
    
    

select
    _id as unique_field,
    count(*) as n_records

from TRACTIVE_DB.public.transformation
where _id is not null
group by _id
having count(*) > 1


