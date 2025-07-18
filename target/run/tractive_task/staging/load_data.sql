-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into TRACTIVE_DB.public.load_data as DBT_INTERNAL_DEST
        using TRACTIVE_DB.public.load_data__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE._id = DBT_INTERNAL_DEST._id))

    
    when matched then update set
        "_ID" = DBT_INTERNAL_SOURCE."_ID","PURCHASE_ID" = DBT_INTERNAL_SOURCE."PURCHASE_ID","EVENT_NAME" = DBT_INTERNAL_SOURCE."EVENT_NAME","PAYMENT_PLAN_ID" = DBT_INTERNAL_SOURCE."PAYMENT_PLAN_ID","SUBSCRIPTION_ID" = DBT_INTERNAL_SOURCE."SUBSCRIPTION_ID","USER_ID" = DBT_INTERNAL_SOURCE."USER_ID","CREATED_AT" = DBT_INTERNAL_SOURCE."CREATED_AT","MODELING_INGESTION_TIMESTAMP" = DBT_INTERNAL_SOURCE."MODELING_INGESTION_TIMESTAMP"
    

    when not matched then insert
        ("_ID", "PURCHASE_ID", "EVENT_NAME", "PAYMENT_PLAN_ID", "SUBSCRIPTION_ID", "USER_ID", "CREATED_AT", "MODELING_INGESTION_TIMESTAMP")
    values
        ("_ID", "PURCHASE_ID", "EVENT_NAME", "PAYMENT_PLAN_ID", "SUBSCRIPTION_ID", "USER_ID", "CREATED_AT", "MODELING_INGESTION_TIMESTAMP")

;
    commit;