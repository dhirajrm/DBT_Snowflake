{{ config(materialized = 'incremental', unique_key = 'booking_id')}}

select
    booking_id,
    listing_id,
    booking_date,
    {{ multiply('nights_booked', 'booking_amount')}} as total_cost,
    booking_status,
    created_at
from 
    {{ ref("bronze_bookings")}}