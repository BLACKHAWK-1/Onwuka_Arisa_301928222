# Food Delivery Platform — normalisation

The example uses the saved sample records. The full set of fields is in the design and schema.

## Starting grouped records

| customer_id | food_order records (list) |
| --- | --- |
| 1 | [4,8] |


The record IDs are grouped in a list. In 1NF, each record has its own row and each cell holds one value.

## 1NF: one value per cell

| food_order.order_id | food_order.customer_id | food_order.restaurant_id | food_order.status | customer.customer_id | customer.full_name | restaurant.restaurant_id | restaurant.name |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 4 | 1 | 2 | delivered | 1 | Alex Morgan | 2 | Maple Kitchen |
| 8 | 1 | 2 | placed | 1 | Alex Morgan | 2 | Maple Kitchen |

Key: order_id.

## 2NF: depend on the whole key

The declared candidate keys do not introduce a partial dependency here, so the 1NF rows stay unchanged at this step.

## food_order_example

| food_order.order_id | food_order.customer_id | food_order.restaurant_id | food_order.status | customer.customer_id | customer.full_name | restaurant.restaurant_id | restaurant.name |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 4 | 1 | 2 | delivered | 1 | Alex Morgan | 2 | Maple Kitchen |
| 8 | 1 | 2 | placed | 1 | Alex Morgan | 2 | Maple Kitchen |

## 3NF: store each entity’s details once

The entity keys determine their own descriptions. Related records keep foreign keys rather than repeating those descriptions.

## customer

| customer_id | full_name | email | created_at |
| --- | --- | --- | --- |
| 1 | Alex Morgan | alex.morgan@example.test | 2026-01-10T09:00:00+00:00 |

## restaurant

| restaurant_id | name | cuisine | active | created_at |
| --- | --- | --- | --- | --- |
| 2 | Maple Kitchen | Canadian | true | 2026-01-05T12:00:00+00:00 |

## menu_item

| menu_item_id | restaurant_id | name | unit_price | available |
| --- | --- | --- | --- | --- |
| 3 | 2 | Garden Sandwich | 12.5 | true |
| 7 | 2 | Tomato Soup | 6.25 | true |

## food_order

| order_id | customer_id | restaurant_id | placed_at | status | delivery_address |
| --- | --- | --- | --- | --- | --- |
| 4 | 1 | 2 | 2026-02-01T18:30:00+00:00 | delivered | 10 Fictional Lane |
| 8 | 1 | 2 | 2026-02-02T19:00:00+00:00 | placed | 10 Fictional Lane |

## order_item

| order_item_id | order_id | menu_item_id | quantity | unit_price |
| --- | --- | --- | --- | --- |
| 5 | 4 | 3 | 2 | 12.5 |

## Dependencies

- customer: (customer_id) → full_name, email, created_at
- restaurant: (restaurant_id) → name, cuisine, active, created_at
- menu_item: (menu_item_id) → restaurant_id, name, unit_price, available
- food_order: (order_id) → customer_id, restaurant_id, placed_at, status, delivery_address
- order_item: (order_item_id) → order_id, menu_item_id, quantity, unit_price

Joining the decomposed sample tables reproduces the original 2 example rows. The design assumes the declared keys describe the relevant business dependencies.
