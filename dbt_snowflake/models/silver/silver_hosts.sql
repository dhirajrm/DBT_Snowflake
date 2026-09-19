{{ config(materialized = 'incremental', unique_key = 'host_id')}}

SELECT 
    HOST_ID,
    REPLACE(UPPER(TRIM(HOST_NAME)), ' ', '_') as HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    CASE 
        WHEN RESPONSE_RATE >= 0 AND RESPONSE_RATE < 30 THEN 'low'
        WHEN RESPONSE_RATE >= 30 AND RESPONSE_RATE < 70 THEN 'medium'
        ELSE 'high'
    END AS RESPONSE_RATE_QUALITY,
    created_at
from
    {{ ref("bronze_hosts")}}
    
