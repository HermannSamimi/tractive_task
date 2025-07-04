{{ config(
    materialized='table'
) }}

select
    round(avg(cancellationRate), 4) as cancellation_rate,
    round(avg(cancellationRateFeaturePerformance), 4) as cancellation_rate_feature_performance
from {{ ref('simplistic_approach') }}