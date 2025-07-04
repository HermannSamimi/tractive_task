{{ config(
    materialized='view',
    alias='simplistic_approach'
) }}

SELECT
    subscription_id,
    -- (Part 1)If there's at least one cancellation, we count it as 1
    CASE
        WHEN cancelled_count >= 1 THEN 1.0 / create_count
        ELSE 0
    END AS cancellationRate,
    
    -- (Part 2)All cancellations over created subscriptions
    CASE
        WHEN cancelled_count > 0 THEN cancelled_count * 1.0 / create_count
        ELSE 0
    END AS cancellationRateFeaturePerformance
FROM (
    SELECT
        subscription_id,
        COUNT(CASE WHEN event_name = 'CREATED' THEN 1 END) AS create_count,
        COUNT(CASE WHEN event_name = 'CANCELLED' THEN 1 END) AS cancelled_count,
        COUNT(CASE WHEN event_name = 'EXPIRED' THEN 1 END) AS expired_count
    FROM {{ ref('transformation') }}
    GROUP BY subscription_id
) sub
ORDER BY cancellationRate desc