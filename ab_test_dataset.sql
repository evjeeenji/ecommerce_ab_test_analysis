SELECT
  event_date, -- Для динаміки на графіку
  test_group,
  COUNT(DISTINCT user_id) as users,
  COUNTIF(event_name = 'purchase') as orders,
  -- Revenue для розрахунку ROI
  SUM(ecommerce.purchase_revenue) as total_revenue
FROM (
  SELECT 
    event_date,
    user_pseudo_id as user_id,
    ecommerce, -- структура з даними про дохід
    -- Імітація спліта 50/50
    IF(MOD(ABS(FARM_FINGERPRINT(user_pseudo_id)), 2) = 0, 'Control', 'Test') as test_group,
    event_name
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131' -- Обмежимо період (3 місяці), щоб швидше рахувало
)
GROUP BY 1, 2
ORDER BY 1, 2