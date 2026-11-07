-- Fictional sample records for Food Delivery Platform.
BEGIN;
SET LOCAL standard_conforming_strings = on;
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at") VALUES (1, 'Alex Morgan', 'alex.morgan@example.test', '2026-01-10T09:00:00Z');
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at") VALUES (2, 'Maple Kitchen', 'Canadian', TRUE, '2026-01-05T12:00:00Z');
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available") VALUES (3, 2, 'Garden Sandwich', 12.5, TRUE);
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available") VALUES (7, 2, 'Tomato Soup', 6.25, TRUE);
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address") VALUES (4, 1, 2, '2026-02-01T18:30:00Z', 'delivered', '10 Fictional Lane');
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address") VALUES (8, 1, 2, '2026-02-02T19:00:00Z', 'placed', '10 Fictional Lane');
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price") VALUES (5, 4, 3, 2, 12.5);
COMMIT;
