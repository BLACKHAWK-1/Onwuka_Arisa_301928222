# Food Delivery Platform — ER diagram

```mermaid
erDiagram
    direction LR
    customer {
        bigint customer_id PK
        text full_name
        text email UK
        timestamptz created_at
    }
    restaurant {
        bigint restaurant_id PK
        text name
        text cuisine
        boolean active
        timestamptz created_at
    }
    menu_item {
        bigint menu_item_id PK
        bigint restaurant_id FK
        text name
        numeric unit_price
        boolean available
    }
    food_order {
        bigint order_id PK
        bigint customer_id FK
        bigint restaurant_id FK
        timestamptz placed_at
        text status
        text delivery_address
    }
    order_item {
        bigint order_item_id PK
        bigint order_id FK
        bigint menu_item_id FK
        integer quantity
        numeric unit_price
    }
    restaurant ||--o{ menu_item : "restaurant_id"
    customer ||--o{ food_order : "customer_id"
    restaurant ||--o{ food_order : "restaurant_id"
    food_order ||--o{ order_item : "order_id"
    menu_item ||--o{ order_item : "menu_item_id"
```

PK identifies a record; FK links to another table; UK marks a single-field unique value. The relationship ends show exactly one, zero or one, or zero or many records. Composite unique keys and conditional rules are listed in the schema and design.

[Diagram image](../images/Onwuka_Arisa_301928222_ERDiagram.png)
