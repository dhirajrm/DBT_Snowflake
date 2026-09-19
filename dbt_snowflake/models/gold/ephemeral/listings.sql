{{
    config(materialized = 'ephemeral')
}}

SELECT 
    LISTING_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    CREATED_AT
FROM {{ ref('silver_listings') }}