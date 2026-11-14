# MIT 8103 Advanced Database Systems

**Food Delivery Platform** · Arisa Onwuka · Student ID 301928222

## Case study

Out of the cases or projects given to us in this assignent, I decided to take a different route by going for a custom-made Food Delivery Platform. In this project, the database was designed to enable customers place and track food orders, restaurant staff reviews orders and support staff investigates order status, with the associated tables named customer, restaurant, menu_item, food_order and order_item. In this project, the following functions are supported: browse restaurants and available menu items, place an order with one or more menu items and update / review an order status.

## Portfolio 1: Database Design and Modelling

This portfolio contains the design and model details of the database. The database was organised to have a relational design of 5 tables. While the primary keys identify records, the foreign keys are designed to preserve the links while enforcing the stated business rules. For example, an order line quantity must be greater than zero. The normalisation examples show the sample data at 1NF, 2NF and 3NF. All 39 deliberately invalid inserts were rejected without changing the valid sample rows.

![Food Delivery Platform ER diagram](images/Onwuka_Arisa_301928222_ERDiagram.png)

Figure 1. Tables, keys and relationships. PK: primary key; FK: foreign key; UK: unique value.

<!-- PAGE BREAK -->

## Portfolio 2: Query Processing and Optimisation

On the second portfolio, I executed three SQL queries against the sample records. The join returned 2 rows which included an Alex Morgan with Maple Kitchen. For the index comparison, 25,000 separate performance rows were used and the median lookup time changed from 1.253 ms to 0.197 ms. Both phases returned the same records. The measured plan used the new index. These timings apply to this lookup and environment.

## Portfolio 3: Transactions and Concurrency

Coming to the third portfolio, I had to use a temporary counter on order_item to test COMMIT, ROLLBACK and READ COMMITTED isolation. The uncommitted update remained hidden from the other session while the ROLLBACK restored the earlier committed value. Furthermore, without locking, two increments left the counter at 2. But with SELECT FOR UPDATE, Session B waited for Session A and the final value was 3. The helper is confined to this exercise; the case's original business fields stay unchanged.

## Portfolio 4: NoSQL and Advanced Data Models

In this portfolio, I used order_events for the case's event documents. Using MongoDB, I inserted 2 sample events which returned the expected results for 4 queries. The validation rejected an invalid date type alongside a duplicate event ID. The embedded snapshots kept related details with an event while the details field can differ by event type. These are fictional events; PostgreSQL continues to enforce its relational rules.

## Repository and evidence

[My Public Repository For This Project](https://github.com/BLACKHAWK-1/Onwuka_Arisa_301928222)

The portfolio folders contain the SQL and JavaScript, explanations, query plans, result tables and screenshots.


<!-- PAGE BREAK -->

## Portfolio 5: Distributed and Cloud Database Exercise

I proposed three MongoDB replica members across separate failure zones. The discussion covers primary elections, majority acknowledgement, secondary lag and sharding trade-offs for order_events. Replication supports availability, while backups address recovery. PostgreSQL needs its own availability plan. This is the permitted discussion option; no live replica set or failover test was deployed.

## Individual reflection

I kept customer, restaurant, menu_item, food_order, order_item in separate tables so their details could be maintained without repeating them in every related record. An order line quantity must be greater than zero. The constraint tests check this alongside the required values and record links. One issue illustrated by the two-session exercise is that both sessions can read the same value before either update is committed. Locking the row before reading preserves both increments. The index comparison also shows why I need to check the execution plan as well as the final answer: the same result can require different amounts of database work.

## AI-use declaration

I used GitHub Copilot and the portfolio generator to help prepare the database model, scripts and explanations. The generator ran the PostgreSQL and MongoDB exercises, checked their outputs and captured the result images.  I remain responsible for checking and explaining the submitted work.

## References

- [PostgreSQL: constraints](https://www.postgresql.org/docs/17/ddl-constraints.html)
- [PostgreSQL: EXPLAIN](https://www.postgresql.org/docs/17/using-explain.html)
- [PostgreSQL: isolation](https://www.postgresql.org/docs/17/transaction-iso.html)
- [PostgreSQL: row locks](https://www.postgresql.org/docs/17/explicit-locking.html)
- [MongoDB: data modelling](https://www.mongodb.com/docs/manual/data-modeling/)
- [MongoDB: replication](https://www.mongodb.com/docs/manual/replication/)
- [MongoDB: sharding](https://www.mongodb.com/docs/manual/sharding/)
- [Mermaid: ER diagrams](https://mermaid.js.org/syntax/entityRelationshipDiagram.html)

