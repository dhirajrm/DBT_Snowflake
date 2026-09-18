

select 
    listing_id,
    property_type,
    room_type,
    city,
    country,
    bedrooms,
    bathrooms,
    price_per_night,
    {{ tag('price_per_night')}} as price_tag,
    created_at
from 
    {{ref("bronze_listings")}}
