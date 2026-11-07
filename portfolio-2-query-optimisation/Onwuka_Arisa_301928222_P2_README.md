# Food Delivery Platform — SQL queries

## 1. Show related food_order, customer, restaurant records (up to 20).

```sql
SELECT t0."order_id" AS "food_order_order_id",
       t0."placed_at" AS "food_order_placed_at",
       t1."customer_id" AS "customer_customer_id",
       t1."full_name" AS "customer_full_name",
       t2."restaurant_id" AS "restaurant_restaurant_id",
       t2."name" AS "restaurant_name"
FROM portfolio."food_order" t0
JOIN portfolio."customer" t1 ON t0."customer_id" = t1."customer_id"
JOIN portfolio."restaurant" t2 ON t0."restaurant_id" = t2."restaurant_id"
ORDER BY t0."order_id", t1."customer_id", t2."restaurant_id"
LIMIT 20;
```

| food_order_order_id | food_order_placed_at | customer_customer_id | customer_full_name | restaurant_restaurant_id | restaurant_name |
| --- | --- | --- | --- | --- | --- |
| 4 | 2026-02-01T18:30:00+00:00 | 1 | Alex Morgan | 2 | Maple Kitchen |
| 8 | 2026-02-02T19:00:00+00:00 | 1 | Alex Morgan | 2 | Maple Kitchen |

## 2. Find food_order records where placed_at matches "2026-02-01T18:30:00Z" (up to 20).

```sql
SELECT * FROM portfolio."food_order"
WHERE "placed_at" IS NOT DISTINCT FROM '2026-02-01T18:30:00Z'
ORDER BY "order_id"
LIMIT 20;
```

| order_id | customer_id | restaurant_id | placed_at | status | delivery_address |
| --- | --- | --- | --- | --- | --- |
| 4 | 1 | 2 | 2026-02-01T18:30:00+00:00 | delivered | 10 Fictional Lane |

## 3. Count food_order records for each customer_id (up to 20 groups).

```sql
SELECT "customer_id", count(*) AS record_count
FROM portfolio."food_order"
GROUP BY "customer_id"
ORDER BY record_count DESC, "customer_id" NULLS LAST
LIMIT 20;
```

| customer_id | record_count |
| --- | --- |
| 1 | 2 |


## Index comparison

| Phase | Median (ms) | Three runs (ms) | Plan nodes | Buffer hits |
| --- | --- | --- | --- | --- |
| Before index | 1.253 | 1.237, 1.253, 2.022 | Sort → Seq Scan | 139 |
| After index | 0.197 | 0.197, 0.194, 0.199 | Sort → Bitmap Heap Scan → Bitmap Index Scan | 30 |

The median execution time changed from 1.253 ms to 0.197 ms. The measured plan used p2_filter_idx. The results matched in both phases. An index adds storage and write-maintenance costs; timings depend on the selected lookup and environment.

## Execution plans

### Before index, run 1

```text
Sort (actual time=1.201..1.207 rows=25 loops=1)
  Seq Scan on food_order (actual time=0.015..1.167 rows=25 loops=1)
Planning Time: 0.33 ms
Execution Time: 1.237 ms
```

### Before index, run 2

```text
Sort (actual time=1.219..1.224 rows=25 loops=1)
  Seq Scan on food_order (actual time=0.015..1.185 rows=25 loops=1)
Planning Time: 0.319 ms
Execution Time: 1.253 ms
```

### Before index, run 3

```text
Sort (actual time=1.982..1.989 rows=25 loops=1)
  Seq Scan on food_order (actual time=0.013..1.942 rows=25 loops=1)
Planning Time: 0.324 ms
Execution Time: 2.022 ms
```

### After index, run 1

```text
Sort (actual time=0.141..0.146 rows=25 loops=1)
  Bitmap Heap Scan on food_order (actual time=0.03..0.107 rows=25 loops=1)
    Bitmap Index Scan using p2_filter_idx (actual time=0.014..0.015 rows=25 loops=1)
Planning Time: 0.524 ms
Execution Time: 0.197 ms
```

### After index, run 2

```text
Sort (actual time=0.138..0.143 rows=25 loops=1)
  Bitmap Heap Scan on food_order (actual time=0.031..0.104 rows=25 loops=1)
    Bitmap Index Scan using p2_filter_idx (actual time=0.015..0.015 rows=25 loops=1)
Planning Time: 0.523 ms
Execution Time: 0.194 ms
```

### After index, run 3

```text
Sort (actual time=0.143..0.148 rows=25 loops=1)
  Bitmap Heap Scan on food_order (actual time=0.031..0.108 rows=25 loops=1)
    Bitmap Index Scan using p2_filter_idx (actual time=0.015..0.015 rows=25 loops=1)
Planning Time: 0.533 ms
Execution Time: 0.199 ms
```

## Reproduce

Use a fresh database with the Portfolio 1 schema and sample data. Run Onwuka_Arisa_301928222_P2_Queries.sql, then Onwuka_Arisa_301928222_P2_Optimisation.sql. The optimisation script creates a separate performance table and runs EXPLAIN (ANALYZE, BUFFERS).

[Query screenshot](screenshots/Onwuka_Arisa_301928222_P2_QueryResults.png) · [Index comparison](screenshots/Onwuka_Arisa_301928222_P2_IndexComparison.png)

## References

- [PostgreSQL — EXPLAIN](https://www.postgresql.org/docs/17/using-explain.html)

