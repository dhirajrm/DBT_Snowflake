{{
    config(materialized = 'ephemeral')
}}

SELECT 
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE_QUALITY,
    CREATED_AT
FROM {{ ref('silver_hosts') }}