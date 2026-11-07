# Food Delivery Platform — database design

My case study records customer, restaurant, menu_item, food_order, order_item.

## Users

- Customers placing and tracking food orders
- Restaurant staff reviewing orders
- Support staff investigating order status

## Main operations

- Browse restaurants and available menu items
- Place an order with one or more menu items
- Update and review an order status

## Entities

| Entity | Information stored |
| --- | --- |
| customer | Stores synthetic customer contact details. |
| restaurant | Stores restaurants available on the platform. |
| menu_item | Stores restaurant menu items and their current prices. |
| food_order | Stores each customer's order and its delivery details. |
| order_item | Stores menu item quantities and price snapshots for each order. |

## customer

| Field | Type | Key | Required |
| --- | --- | --- | --- |
| customer_id | BIGINT | PK | Yes |
| full_name | TEXT |  | Yes |
| email | TEXT | Unique | Yes |
| created_at | TIMESTAMPTZ |  | Yes |
- Unique key: (email).

## restaurant

| Field | Type | Key | Required |
| --- | --- | --- | --- |
| restaurant_id | BIGINT | PK | Yes |
| name | TEXT |  | Yes |
| cuisine | TEXT |  | Yes |
| active | BOOLEAN |  | Yes |
| created_at | TIMESTAMPTZ |  | Yes |


## menu_item

| Field | Type | Key | Required |
| --- | --- | --- | --- |
| menu_item_id | BIGINT | PK | Yes |
| restaurant_id | BIGINT | FK | Yes |
| name | TEXT |  | Yes |
| unit_price | NUMERIC(18,2) |  | Yes |
| available | BOOLEAN |  | Yes |
- restaurant_id → restaurant.restaurant_id
- Unique key: (restaurant_id, name).

## food_order

| Field | Type | Key | Required |
| --- | --- | --- | --- |
| order_id | BIGINT | PK | Yes |
| customer_id | BIGINT | FK | Yes |
| restaurant_id | BIGINT | FK | Yes |
| placed_at | TIMESTAMPTZ |  | Yes |
| status | TEXT |  | Yes |
| delivery_address | TEXT |  | Yes |
- customer_id → customer.customer_id
- restaurant_id → restaurant.restaurant_id

## order_item

| Field | Type | Key | Required |
| --- | --- | --- | --- |
| order_item_id | BIGINT | PK | Yes |
| order_id | BIGINT | FK | Yes |
| menu_item_id | BIGINT | FK | Yes |
| quantity | INTEGER |  | Yes |
| unit_price | NUMERIC(18,2) |  | Yes |
- order_id → food_order.order_id
- menu_item_id → menu_item.menu_item_id
- Unique key: (order_id, menu_item_id).

## Relationships and business rules

- Each customer email identifies at most one customer.
- Every menu item references an existing restaurant.
- An order line quantity must be greater than zero.
- An order has at most one line for each menu item.

## Assumptions

- All records and identifiers are synthetic; email addresses and delivery addresses are fictional.
- Each food order belongs to one customer and one restaurant.
- Each menu item belongs to one restaurant; an order line refers to a menu item offered by that restaurant.
- A food_order status is represented as text; allowed status transitions are outside this database exercise.
- Worked normalization example rooted at food_order: keep customer attributes in customer and restaurant attributes in restaurant, referenced by customer_id and restaurant_id. Do not copy their descriptive attributes into food_order; this separates facts about the two distinct referenced entities from order-specific facts.
- The food_order decomposition in the example keeps order_id, customer_id, restaurant_id, placed_at, status, and delivery_address in the order relation, with customer and restaurant details in their respective relations.

