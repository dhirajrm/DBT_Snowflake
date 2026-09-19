{% set table_config = [
    {
        "table" : ref("silver_bookings"),
        "columns" : "*",
        "alias" : "sb"
    },
    {
        "table" : ref("silver_listings"),
        "columns" : "* EXCLUDE (listing_id, created_at)",
        "alias" : "sl",
        "join_condition" : "sb.listing_id = sl.listing_id",
        "join_type" : "left"  
    },
    {
        "table" : ref("silver_hosts"),
        "columns" : "* EXCLUDE (host_id, created_at)",
        "alias" : "sh",
        "join_condition" : "sl.host_id = sh.host_id",
        "join_type" : "left"
    }
] %}

SELECT 
    {% for c in table_config %}
        {{ c['alias'] }}.{{ c['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for c in table_config %}
        {% if loop.first %}
            {{ c['table'] }} as {{ c['alias'] }}
        {% else %}
            {{ c['join_type'] }} join {{ c['table'] }} as {{ c['alias'] }} on {{ c['join_condition'] }}
        {% endif %}
    {% endfor %}

    