-- Run these deliberately invalid statements one at a time, outside a transaction.
-- Each should fail at the named constraint; the sample rows should remain unchanged.

-- 1. customer pk. Expected: pk_customer, SQLSTATE 23505.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (1, 'Casey Reed', 'casey.reed@example.test', '2026-03-01T10:00:00Z');

-- 2. customer unique. Expected: uq_customer_0, SQLSTATE 23505.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (101, 'Casey Reed', 'alex.morgan@example.test', '2026-03-01T10:00:00Z');

-- 3. customer nn id. Expected: customer_id, SQLSTATE 23502.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (NULL, 'Casey Reed', 'casey.reed@example.test', '2026-03-01T10:00:00Z');

-- 4. customer nn name. Expected: full_name, SQLSTATE 23502.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (102, NULL, 'casey.reed@example.test', '2026-03-01T10:00:00Z');

-- 5. customer nn email. Expected: email, SQLSTATE 23502.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (103, 'Casey Reed', NULL, '2026-03-01T10:00:00Z');

-- 6. customer nn created. Expected: created_at, SQLSTATE 23502.
INSERT INTO portfolio."customer" ("customer_id", "full_name", "email", "created_at")
VALUES (104, 'Casey Reed', 'casey.reed@example.test', NULL);

-- 7. restaurant pk. Expected: pk_restaurant, SQLSTATE 23505.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (2, 'Harbor Table', 'Seafood', TRUE, '2026-03-01T10:00:00Z');

-- 8. restaurant nn id. Expected: restaurant_id, SQLSTATE 23502.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (NULL, 'Harbor Table', 'Seafood', TRUE, '2026-03-01T10:00:00Z');

-- 9. restaurant nn name. Expected: name, SQLSTATE 23502.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (106, NULL, 'Seafood', TRUE, '2026-03-01T10:00:00Z');

-- 10. restaurant nn cuisine. Expected: cuisine, SQLSTATE 23502.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (107, 'Harbor Table', NULL, TRUE, '2026-03-01T10:00:00Z');

-- 11. restaurant nn active. Expected: active, SQLSTATE 23502.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (108, 'Harbor Table', 'Seafood', NULL, '2026-03-01T10:00:00Z');

-- 12. restaurant nn created. Expected: created_at, SQLSTATE 23502.
INSERT INTO portfolio."restaurant" ("restaurant_id", "name", "cuisine", "active", "created_at")
VALUES (109, 'Harbor Table', 'Seafood', TRUE, NULL);

-- 13. menu item pk. Expected: pk_menu_item, SQLSTATE 23505.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (3, 2, 'Rice Plate', 11, TRUE);

-- 14. menu item unique. Expected: uq_menu_item_0, SQLSTATE 23505.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (110, 2, 'Garden Sandwich', 13, TRUE);

-- 15. menu item fk. Expected: fk_menu_item_0, SQLSTATE 23503.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (111, 999, 'Rice Plate', 11, TRUE);

-- 16. menu item nn id. Expected: menu_item_id, SQLSTATE 23502.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (NULL, 2, 'Rice Plate', 11, TRUE);

-- 17. menu item nn restaurant. Expected: restaurant_id, SQLSTATE 23502.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (112, NULL, 'Rice Plate', 11, TRUE);

-- 18. menu item nn name. Expected: name, SQLSTATE 23502.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (113, 2, NULL, 11, TRUE);

-- 19. menu item nn price. Expected: unit_price, SQLSTATE 23502.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (114, 2, 'Rice Plate', NULL, TRUE);

-- 20. menu item nn available. Expected: available, SQLSTATE 23502.
INSERT INTO portfolio."menu_item" ("menu_item_id", "restaurant_id", "name", "unit_price", "available")
VALUES (115, 2, 'Rice Plate', 11, NULL);

-- 21. food order pk. Expected: pk_food_order, SQLSTATE 23505.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (4, 1, 2, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 22. food order fk customer. Expected: fk_food_order_0, SQLSTATE 23503.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (116, 999, 2, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 23. food order fk restaurant. Expected: fk_food_order_1, SQLSTATE 23503.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (117, 1, 999, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 24. food order nn id. Expected: order_id, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (NULL, 1, 2, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 25. food order nn customer. Expected: customer_id, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (118, NULL, 2, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 26. food order nn restaurant. Expected: restaurant_id, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (119, 1, NULL, '2026-03-01T10:00:00Z', 'placed', '20 Fictional Lane');

-- 27. food order nn placed. Expected: placed_at, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (120, 1, 2, NULL, 'placed', '20 Fictional Lane');

-- 28. food order nn status. Expected: status, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (121, 1, 2, '2026-03-01T10:00:00Z', NULL, '20 Fictional Lane');

-- 29. food order nn address. Expected: delivery_address, SQLSTATE 23502.
INSERT INTO portfolio."food_order" ("order_id", "customer_id", "restaurant_id", "placed_at", "status", "delivery_address")
VALUES (122, 1, 2, '2026-03-01T10:00:00Z', 'placed', NULL);

-- 30. order item pk. Expected: pk_order_item, SQLSTATE 23505.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (5, 8, 7, 1, 6.25);

-- 31. order item unique. Expected: uq_order_item_0, SQLSTATE 23505.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (123, 4, 3, 1, 12.5);

-- 32. order item fk order. Expected: fk_order_item_0, SQLSTATE 23503.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (124, 999, 7, 1, 6.25);

-- 33. order item fk menu. Expected: fk_order_item_1, SQLSTATE 23503.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (125, 8, 999, 1, 6.25);

-- 34. order item nn id. Expected: order_item_id, SQLSTATE 23502.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (NULL, 8, 7, 1, 6.25);

-- 35. order item nn order. Expected: order_id, SQLSTATE 23502.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (126, NULL, 7, 1, 6.25);

-- 36. order item nn menu. Expected: menu_item_id, SQLSTATE 23502.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (127, 8, NULL, 1, 6.25);

-- 37. order item nn quantity. Expected: quantity, SQLSTATE 23502.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (128, 8, 7, NULL, 6.25);

-- 38. order item nn price. Expected: unit_price, SQLSTATE 23502.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (129, 8, 7, 1, NULL);

-- 39. order item check. Expected: positive_order_quantity, SQLSTATE 23514.
INSERT INTO portfolio."order_item" ("order_item_id", "order_id", "menu_item_id", "quantity", "unit_price")
VALUES (130, 8, 7, 0, 6.25);
