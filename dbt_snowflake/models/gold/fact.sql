{% set table_config = [
    {
        "table" : ref("obt"),
        "columns" : "obt.booking_id, obt.listing_id, obt.host_id, obt.total_cost, obt.price_per_night, obt.bedrooms, obt.bathrooms",
        "alias" : "obt",
    },
    {
        "table" : ref("dim_listings"),
        "columns" : "dl.* EXCLUDE (listing_id)",
        "alias" : "dl",
        "join_condition" : "obt.listing_id = dl.listing_id",
        "join_type" : "left"
    },
    {
        "table" : ref("dim_hosts"),
        "columns" : "dh.* EXCLUDE (host_id)",
        "alias" : "dh",
        "join_condition" : "obt.host_id = dh.host_id",
        "join_type" : "left"
    },
    {
        "table" : ref("dim_bookings"),
        "columns" : "db.* EXCLUDE (booking_id)",
        "alias" : "db",
        "join_condition" : "obt.booking_id = db.booking_id",
        "join_type" : "left"
    }
] %}

SELECT 
    {% for c in table_config %}
        {{ c['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for c in table_config %}
        {% if loop.first %}
            {{ c['table'] }} as {{ c['alias'] }}
        {% else %}
            {{ c['join_type'] }} join {{ c['table'] }} as {{ c['alias'] }} on {{ c['join_condition'] }}
        {% endif %}
    {% endfor %}


    