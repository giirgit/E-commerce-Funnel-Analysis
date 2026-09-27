-- ============================================================
-- E-COMMERCE FUNNEL ANALYSIS
-- ============================================================


-- UNIQUE USERS ACCORDING TO EVENT TYPE
SELECT event_type, COUNT(DISTINCT user_id) AS unique_users
FROM events
GROUP BY event_type
ORDER BY unique_users DESC;


-- OVERALL FUNNEL CONVERSION
WITH Funnel AS (
    SELECT event_type, COUNT(DISTINCT user_id) AS unique_users
    FROM events
    GROUP BY event_type
),

Funnel_counts AS (
    SELECT
        (SELECT unique_users FROM Funnel WHERE event_type='view') AS view_users,
        (SELECT unique_users FROM Funnel WHERE event_type='cart') AS cart_users,
        (SELECT unique_users FROM Funnel WHERE event_type='purchase') AS purchase_users
)

SELECT
    view_users,
    cart_users,
    purchase_users,
    ROUND(100.0 * cart_users / view_users, 2) AS view_to_cart_pct,
    ROUND(100.0 * purchase_users / cart_users, 2) AS cart_to_purchase_pct,
    ROUND(100.0 * purchase_users / view_users, 2) AS view_to_purchase_pct
FROM Funnel_counts;


-- CATEGORY VIEW TO CART CONVERSION
SELECT category_code,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END),
        2
    ) AS view_to_cart_pct
FROM events
GROUP BY category_code
ORDER BY view_to_cart_pct ASC;

-- Extracting 'computers', 'appliances', 'electronics', etc. from the category_code for overall category conversion
SELECT
    SUBSTR(category_code, 1, INSTR(category_code, '.') - 1) AS parent_department,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
        / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END), 0),
        2
    ) AS avg_view_to_cart_pct
FROM events
WHERE category_code IS NOT NULL AND INSTR(category_code, '.') > 0
GROUP BY 1
HAVING view_users >= 1000
ORDER BY avg_view_to_cart_pct DESC;


-- ACTIVITY AND VIEW TO CART CONVERSION BY HOUR
SELECT
    SUBSTR(event_time, 12, 2) AS hour_utc,
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS active_users,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase_users,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type='cart' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event_type='view' THEN user_id END),
        2
    ) AS view_to_cart_conversion

FROM events
GROUP BY hour_utc
ORDER BY view_to_cart_conversion DESC;


-- PRICE TIER VIEW TO CART CONVERSION
SELECT
    CASE
        WHEN price < 5 THEN '1. Under $5'
        WHEN price >= 5 AND price < 25 THEN '2. $5 - $25'
        WHEN price >= 25 AND price < 100 THEN '3. $25 - $100'
        WHEN price >= 100 AND price < 500 THEN '4. $100 - $500'
        WHEN price >= 500 AND price < 2500 THEN '5. $500 - $2,500'
        WHEN price >= 2500 THEN '6. $2,500+'
        ELSE 'Unknown / Invalid'
    END AS price_tier,

    -- Unique users who viewed products in each price tier
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,

    -- Unique users who added products to cart in each price tier
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,

    -- View to Cart Conversion
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END),
        2
    ) AS view_to_cart_rate_pct

FROM events
WHERE event_type IN ('view', 'cart')
GROUP BY 1
ORDER BY 1 ASC;


-- Brand revenue
SELECT
    brand,
    COUNT(*) AS purchase_events,
    ROUND(SUM(price), 2) AS revenue
FROM events
WHERE event_type = 'purchase'
GROUP BY brand
ORDER BY revenue DESC;

SELECT
    brand,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,

    -- View to Cart %
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END),
        2
    ) AS view_to_cart_pct
    
FROM events
GROUP BY brand
HAVING COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) >= 200
ORDER BY view_to_cart_pct DESC;

-- Brands with views>=1000 but low conversion
SELECT
    brand,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,

    -- View to Cart %
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END),
        2
    ) AS view_to_cart_pct
    
FROM events
GROUP BY brand
HAVING COUNT(DISTINCT CASE WHEN event_type='view' then user_id END) >= 1000
ORDER BY view_to_cart_pct ASC;


-- CATEGORY-WISE CART dropoff
SELECT
    category_code,

    COUNT(DISTINCT CASE
        WHEN event_type = 'cart' THEN user_id
    END) AS cart_users,

    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS purchase_users,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)
        /
        NULLIF(
            COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END),
            0
        ),
        2
    ) AS cart_to_purchase_pct,

    ROUND(
        100.0 - (
            100.0 *
            COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)
            /
            NULLIF(
                COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END),
                0
            )
        ),
        2
    ) AS cart_to_purchase_dropoff_pct

FROM events
WHERE category_code IS NOT NULL
GROUP BY category_code
HAVING COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) >= 50
ORDER BY cart_to_purchase_dropoff_pct DESC;